import { useState, useEffect, useRef } from 'react';
import { Head, Link } from '@inertiajs/react';
import InnerLayout from '@/Layouts/InnerLayout';
import '@/assets/styles/stories.css';
import '@/assets/styles/story-read.css';

export default function Read({ story }) {
  const [readingProgress, setReadingProgress] = useState(0);
  const [isBookmarked, setIsBookmarked] = useState(false);
  const contentRef = useRef(null);

  // Sample content for demonstration (in a real app, this would come from the database)
  const sampleContent = story.content || `
    <h2>${story.title}</h2>
    <p class="author">By ${story.author}</p>
    
    <p>The morning mist clung to the cobblestone streets of Fallow End like a shroud, obscuring the village's quaint charm beneath a veil of secrecy. Detective Felix Merton pulled his coat tighter around his shoulders as he made his way toward the Halverton estate, a grand manor that loomed at the edge of the village like a sentinel guarding ancient secrets.</p>
    
    <p>The call had come just after dawn—the Earl of Halverton found floating face-down in his prized koi pond, his expensive silk robe billowing around him like exotic water lilies. At first glance, it appeared to be a tragic accident, perhaps the result of too much brandy and a midnight stroll gone awry. But Felix knew better. In his fifteen years as a detective, he'd learned that in places like Fallow End, nothing was ever as simple as it seemed.</p>
    
    <p>"Detective Merton, I presume?" A tall, slender woman with silver-streaked hair pulled into a severe bun approached him at the estate's wrought-iron gates. "I'm Mrs. Hargrove, the housekeeper. Lady Halverton is expecting you."</p>
    
    <p>Felix nodded, following the woman through the immaculate gardens that surrounded the manor. The air was heavy with the scent of roses and freshly cut grass, mingling with something else—the metallic tang of fear that seemed to emanate from the house itself.</p>
    
    <p>Lady Halverton was waiting in the drawing room, a space adorned with priceless artwork and antiques that spoke of generations of wealth and privilege. She was younger than Felix had expected, perhaps in her early forties, with a beauty that remained striking even in grief. Her pale hands trembled slightly as she offered him tea.</p>
    
    <p>"I appreciate your discretion in this matter, Detective," she said, her voice barely above a whisper. "My husband had many... connections in London. The press would have a field day if they caught wind of this."</p>
    
    <p>Felix declined the tea with a polite shake of his head. "I understand, Lady Halverton. But I should be clear—if I determine that your husband's death wasn't accidental, discretion may no longer be possible."</p>
    
    <p>A shadow passed across her face, quick as a cloud over the sun. "Of course. But Robert was always careless after drinking. He often walked the grounds at night when he couldn't sleep."</p>
    
    <p>"And was he drinking last night?"</p>
    
    <p>"He was celebrating," she replied, her gaze drifting to a modern sculpture that dominated the corner of the room—a twisted mass of metal and glass that seemed at odds with the classical décor. "The gallery opening is tomorrow. Robert had finally acquired a collection of contemporary art that he believed would put Fallow End on the map."</p>
    
    <p>Felix made a note in his small leather-bound notebook. "I'd like to see where it happened, if you don't mind."</p>
    
    <p>The koi pond was situated in the eastern garden, surrounded by a stone pathway and ornamental cherry trees. The body had been removed, but Felix could still see the disturbance in the water, the way the colorful fish darted nervously beneath the surface as if they too were witnesses to the night's events.</p>
    
    <p>As he knelt by the pond's edge, something caught his eye—a small, metallic object half-buried in the soft earth. Carefully, he extracted it with his handkerchief: a cufflink, gold with an intricate design of intertwined serpents.</p>
    
    <p>"Is this the Earl's?" he asked, showing it to Mrs. Hargrove, who had accompanied them to the garden.</p>
    
    <p>The housekeeper frowned, leaning closer to examine it. "No, sir. His Lordship preferred silver. I've never seen this before."</p>
    
    <p>Felix pocketed the cufflink, his mind already racing with possibilities. As he straightened, he noticed a figure watching from an upstairs window—a young woman with fiery red hair, her expression unreadable from this distance. When she realized she'd been spotted, she quickly stepped back from view.</p>
    
    <p>"Who was that?" Felix asked.</p>
    
    <p>Lady Halverton followed his gaze, her lips tightening almost imperceptibly. "That would be Eliza, my husband's ward. She's been with us for about a year now. Poor girl is devastated—she and Robert were quite close."</p>
    
    <p>There was something in her tone that made Felix curious. "I'd like to speak with her, if possible."</p>
    
    <p>"Of course," Lady Halverton replied, though her smile didn't reach her eyes. "Though I should warn you, Detective Merton—Eliza has quite an imagination. Don't believe everything she tells you."</p>
    
    <p>As they walked back toward the house, Felix couldn't shake the feeling that beneath Fallow End's picturesque surface, currents of deception ran as deep and dark as the pond where the Earl had met his end. And somewhere in this maze of wealth, art, and secrets, a killer was watching, waiting to see what the detective would discover next.</p>
    
    <p>What Felix didn't know was that the truth would be stranger and more dangerous than even he could imagine—and that before this case was closed, the quiet village of Fallow End would never be the same again.</p>
  `;

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

  // Load saved position and bookmark state on component mount
  useEffect(() => {
    // Check if story is bookmarked
    const bookmarks = JSON.parse(localStorage.getItem('story-bookmarks') || '[]');
    setIsBookmarked(bookmarks.includes(story.id));
    
    // Restore reading position
    if (contentRef.current) {
      const savedPosition = localStorage.getItem(`story-${story.id}-position`);
      if (savedPosition) {
        contentRef.current.scrollTop = parseInt(savedPosition, 10);
      }
    }
  }, [story.id]);

  return (
    <InnerLayout>
      <Head title={`Reading: ${story.title}`} />

      <div className="reading-progress-container">
        <div 
          className="reading-progress-bar" 
          style={{ width: `${readingProgress}%` }}
        ></div>
      </div>

      <section className="py-50 reading-container">
        <div className="container">
          <div className="row">
            <div className="col-lg-8 mx-auto">
              <div className="reading-header mb-4">
                <div className="d-flex justify-content-between align-items-center">
                  <Link 
                    href={route('stories.show', story.id)} 
                    className="btn btn-sm btn-outline-secondary"
                  >
                    <i className="fas fa-arrow-left me-2"></i> Back to Story
                  </Link>
                  <button 
                    className={`btn btn-sm ${isBookmarked ? 'btn-warning' : 'btn-outline-warning'}`}
                    onClick={toggleBookmark}
                  >
                    <i className={`fas fa-bookmark ${isBookmarked ? '' : 'far'}`}></i>
                    {isBookmarked ? ' Bookmarked' : ' Bookmark'}
                  </button>
                </div>
              </div>

              <div className="reading-content-wrapper">
                <div 
                  ref={contentRef} 
                  className="reading-content" 
                  onScroll={handleScroll}
                  dangerouslySetInnerHTML={{ __html: sampleContent }}
                ></div>
              </div>

              <div className="reading-footer mt-5">
                <div className="d-flex justify-content-between align-items-center">
                  <div>
                    <span className="badge bg-secondary me-2">{story.genre}</span>
                    <span className="badge bg-primary">{story.style}</span>
                  </div>
                  <div>
                    <button
                      className="btn btn-primary"
                      onClick={() => window.history.back()}
                    >
                      <i className="fas fa-arrow-left me-2"></i> Back
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </InnerLayout>
  );
}
