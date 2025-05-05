import { useState, useEffect, useRef } from 'react';
import { Head, Link } from '@inertiajs/react';
import InnerLayout from '@/Layouts/InnerLayout';
import '@/assets/styles/stories.css';
import '@/assets/styles/story-read.css';
import { motion } from 'framer-motion';

export default function Read({ story }) {
  const [readingProgress, setReadingProgress] = useState(0);
  const [isBookmarked, setIsBookmarked] = useState(false);
  const [showCover, setShowCover] = useState(true);
  const contentRef = useRef(null);

  // Get story content from the database, or create a default if not available
  const getStoryContent = () => {
    // If story has content in the database, use it
    if (story.content) {
      return story.content;
    }

    // Otherwise, create a default formatted content
    return `
      <h2>${story.title}</h2>
      <p class="author">By ${story.author}</p>

      <p>${story.description}</p>

      <p><em>This story is still being written. Check back soon for the full content!</em></p>
    `;
  };

  const storyContent = getStoryContent();

  // Handle scroll to update reading progress
  const handleScroll = () => {
    if (contentRef.current) {
      const element = contentRef.current;
      const totalHeight = element.scrollHeight - element.clientHeight;
      const scrollPosition = element.scrollTop;
      const percentage = (scrollPosition / totalHeight) * 100;
      setReadingProgress(percentage);

      // Save reading position to localStorage
      localStorage.setItem(`story-${story.id}-position`, scrollPosition);
    }
  };

  // Toggle bookmark
  const toggleBookmark = () => {
    const newBookmarkState = !isBookmarked;
    setIsBookmarked(newBookmarkState);

    // Save bookmark state to localStorage
    if (newBookmarkState) {
      const bookmarks = JSON.parse(localStorage.getItem('story-bookmarks') || '[]');
      if (!bookmarks.includes(story.id)) {
        bookmarks.push(story.id);
        localStorage.setItem('story-bookmarks', JSON.stringify(bookmarks));
      }
    } else {
      const bookmarks = JSON.parse(localStorage.getItem('story-bookmarks') || '[]');
      const updatedBookmarks = bookmarks.filter(id => id !== story.id);
      localStorage.setItem('story-bookmarks', JSON.stringify(updatedBookmarks));
    }
  };



  // Start reading (hide cover)
  const startReading = () => {
    setShowCover(false);
    // Auto-scroll to the beginning of the content
    if (contentRef.current) {
      contentRef.current.scrollTop = 0;
    }
  };

  // Load saved position and settings on component mount
  useEffect(() => {
    // Check if story is bookmarked
    const bookmarks = JSON.parse(localStorage.getItem('story-bookmarks') || '[]');
    setIsBookmarked(bookmarks.includes(story.id));

    // Show cover for 2 seconds, then auto-start reading
    const timer = setTimeout(() => {
      // Only auto-start if this is the first time viewing
      const hasStartedReading = localStorage.getItem(`story-${story.id}-started`);
      if (!hasStartedReading) {
        setShowCover(false);
        localStorage.setItem(`story-${story.id}-started`, 'true');
      }
    }, 2000);

    // Restore reading position (only if not showing cover)
    if (contentRef.current && !showCover) {
      const savedPosition = localStorage.getItem(`story-${story.id}-position`);
      if (savedPosition) {
        contentRef.current.scrollTop = parseInt(savedPosition, 10);
      }
    }

    return () => clearTimeout(timer);
  }, [story.id, showCover]);

  return (
    <InnerLayout>
      <Head title={`Reading: ${story.title}`} />

      {/* Book Cover Overlay */}
      {showCover && (
        <motion.div
          className="book-cover-overlay"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
        >
          <div className="book-cover-container">
            <div className="book-cover-wrapper">
              <img
                src={`/${story.cover_image}`}
                alt={story.title}
                className="book-cover-image"
              />
              <div className="book-cover-details">
                <h1 className="book-title">{story.title}</h1>
                <h3 className="book-author">By {story.author}</h3>
                <p className="book-genre">{story.genre} • {story.style}</p>
                <motion.button
                  className="btn btn-lg btn-primary start-reading-btn"
                  onClick={startReading}
                  whileHover={{ scale: 1.05 }}
                  whileTap={{ scale: 0.95 }}
                >
                  Begin Reading
                </motion.button>
              </div>
            </div>
          </div>
        </motion.div>
      )}

      {/* Reading Progress Bar */}
      <div className="reading-progress-container">
        <div
          className="reading-progress-bar"
          style={{ width: `${readingProgress}%` }}
        ></div>
      </div>

      <section className="reading-container">
        <div className="container">
          <div className="row">
            <div className="col-lg-10 mx-auto">
              {/* Reading Controls */}
              <div className="reading-controls">
                <div className="d-flex justify-content-between align-items-center">
                  <div className="d-flex align-items-center">
                    <Link
                      href={route('stories.show', story.id)}
                      className="btn btn-sm btn-outline-secondary me-2"
                    >
                      <i className="fas fa-arrow-left me-1"></i> Back
                    </Link>
                    <button
                      className={`btn btn-sm ${isBookmarked ? 'btn-warning' : 'btn-outline-warning'} me-2`}
                      onClick={toggleBookmark}
                      title={isBookmarked ? "Remove Bookmark" : "Add Bookmark"}
                    >
                      <i className={`${isBookmarked ? 'fas' : 'far'} fa-bookmark`}></i>
                    </button>
                  </div>
                </div>
              </div>

              {/* Book Info Bar */}
              <div className="book-info-bar">
                <div className="d-flex align-items-center">
                  <img
                    src={`/${story.cover_image}`}
                    alt={story.title}
                    className="mini-cover me-3"
                  />
                  <div>
                    <h4 className="mb-0">{story.title}</h4>
                    <p className="mb-0 text-muted">Chapter 1</p>
                  </div>
                </div>
              </div>

              {/* Reading Content */}
              <div className="reading-content-wrapper">
                <div
                  ref={contentRef}
                  className="reading-content"
                  onScroll={handleScroll}
                  dangerouslySetInnerHTML={{ __html: storyContent }}
                ></div>
              </div>

              {/* Chapter Navigation */}
              <div className="chapter-navigation">
                <button className="btn btn-outline-secondary" disabled>
                  <i className="fas fa-chevron-left me-2"></i> Previous Chapter
                </button>
                <div className="chapter-indicator">
                  Chapter 1 of 1
                </div>
                <button className="btn btn-outline-secondary" disabled>
                  Next Chapter <i className="fas fa-chevron-right ms-2"></i>
                </button>
              </div>

              {/* Reading Footer */}
              <div className="reading-footer">
                <div className="d-flex justify-content-between align-items-center">
                  <div>
                    <span className="badge bg-secondary me-2">{story.genre}</span>
                    <span className="badge bg-primary">{story.style}</span>
                  </div>
                  <div className="reading-stats">
                    <span><i className="fas fa-eye me-1"></i> {story.read_count} reads</span>
                    <span className="ms-3"><i className="fas fa-comment me-1"></i> {story.comment_count} comments</span>
                  </div>
                </div>

                <div className="author-note mt-4">
                  <h5>Author's Note</h5>
                  <p>Thank you for reading "{story.title}". I hope you enjoyed this story written in the style of {story.author}. If you'd like to continue this story with your own twist, click the "Continue This Story" button on the story details page.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </InnerLayout>
  );
}
