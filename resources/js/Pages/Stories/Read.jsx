import { useState, useEffect, useRef } from "react";
import { Head, Link } from "@inertiajs/react";
import axios from "axios";
import Layout from "@/Layouts/Layout";
import CommentSection from "@/Components/comments/CommentSection";
import "@/assets/styles/stories.css";
import "@/assets/styles/story-read.css";
import "@/assets/styles/comments.css";
import { motion } from "framer-motion";
import HTMLFlipBook from "react-pageflip";
import Book from '../../Components/Book';

export default function Read({ story, auth }) {
    const [showCover, setShowCover] = useState(true);
    const [commentCount, setCommentCount] = useState(story.comment_count || 0);

    // Fetch the latest comment count when the page loads
    useEffect(() => {
        const fetchCommentCount = async () => {
            try {
                const response = await axios.get(
                    route("comments.get", story.id),
                );
                const comments = response.data.comments;

                // Count top-level comments and all replies
                let totalCount = comments.length;
                comments.forEach((comment) => {
                    if (comment.replies && comment.replies.length > 0) {
                        totalCount += comment.replies.length;
                    }
                });

                setCommentCount(totalCount);
            } catch (error) {
                console.error("Error fetching comment count:", error);
            }
        };

        fetchCommentCount();
    }, [story.id]);

    // Get story content from the database, or create a default if not available
    const getStoryContent = () => {
        if (story.content) {
            return story.content;
        }

        return `
      <h2>${story.title}</h2>
      <p class="author">By ${story.author}</p>

      <p>${story.description}</p>

      <p><em>This story is still being written. Check back soon for the full content!</em></p>
    `;
    };

    const storyContent = getStoryContent();

    // Utility function: split story content into smaller chunks (pages)
    const paginateStory = (htmlContent, wordsPerPage = 200) => {
        const words = htmlContent.split(" ");
        const pages = [];
        for (let i = 0; i < words.length; i += wordsPerPage) {
            pages.push(words.slice(i, i + wordsPerPage).join(" "));
        }
        return pages;
    };

    const storyPages = paginateStory(storyContent);

    // Start reading (hide cover)
    const startReading = () => {
        setShowCover(false);
    };

    // Auto-hide cover after 2 seconds (first time only)
    useEffect(() => {
        const timer = setTimeout(() => {
            const hasStartedReading = localStorage.getItem(
                `story-${story.id}-started`,
            );
            if (!hasStartedReading) {
                setShowCover(false);
                localStorage.setItem(`story-${story.id}-started`, "true");
            }
        }, 2000);

        return () => clearTimeout(timer);
    }, [story.id]);

    return (
        <Layout headerClass="inner-header">
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
                                src={
                                    story.cover_image
                                        ? `/storage/${story.cover_image}`
                                        : "/assets/images/default-cover.jpg"
                                }
                                className="book-cover-image"
                                alt={story.title}
                            />
                            <div className="book-cover-details">
                                <h1 className="book-title">{story.title}</h1>
                                <h3 className="book-author">
                                    By {story.author}
                                </h3>
                                <p className="book-genre">
                                    {story.genre} • {story.style}
                                </p>
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

            <section className="reading-container pt-200 pb-100">
                <div className="container">
                    <div className="row">
                        <div className="col-lg-10 mx-auto">
                            {/* Reading Controls */}
                            <div className="reading-controls">
                                <div className="d-flex justify-content-between align-items-center">
                                    <div className="d-flex align-items-center">
                                        <Link
                                            href={route(
                                                "stories.show",
                                                story.id,
                                            )}
                                            className="btn btn-primary story-btn"
                                        >
                                            <i className="fas fa-arrow-left me-2"></i>{" "}
                                            Back to Story
                                        </Link>
                                    </div>
                                </div>
                            </div>

                            {/* Book Info Bar */}
                            <div className="book-info-bar">
                                <div className="d-flex align-items-center">
                                    <img
                                        src={
                                            story.cover_image
                                                ? `/storage/${story.cover_image}`
                                                : "/assets/images/default-cover.jpg"
                                        }
                                        className="mini-cover mb-3 me-3"
                                        alt={story.title}
                                    />
                                    <div>
                                        <h4 className="mb-0">{story.title}</h4>
                                        <p className="mb-0 text-muted">
                                            Chapter 1
                                        </p>
                                    </div>
                                </div>
                            </div>

                            {/* Reading Content with Flipbook */}
                            <Book />

                            {/* Chapter Navigation */}
                            <div className="chapter-navigation">
                                <button
                                    className="btn btn-outline-secondary story-btn chapter-btn"
                                    disabled
                                >
                                    <i className="fas fa-chevron-left me-2"></i>{" "}
                                    Previous Chapter
                                </button>
                                <div className="chapter-indicator secondry-font">
                                    Chapter 1 of 1
                                </div>
                                <button
                                    className="btn btn-outline-secondary story-btn chapter-btn"
                                    disabled
                                >
                                    Next Chapter{" "}
                                    <i className="fas fa-chevron-right ms-2"></i>
                                </button>
                            </div>

                            {/* Reading Footer */}
                            <div className="reading-footer">
                                <div className="d-flex justify-content-between align-items-center">
                                    <div>
                                        <span className="label bg-secondry-theme text-white fs-16 py-10 px-20 radius-60 d-inline-block me-2">
                                            <i className="fas fa-bookmark me-2"></i>{" "}
                                            {story.genre}
                                        </span>
                                        {story.style && (
                                            <span className="label bg-primary-theme text-white fs-16 py-10 px-20 radius-60 d-inline-block">
                                                <i className="fas fa-pen-fancy me-2"></i>{" "}
                                                {story.style}
                                            </span>
                                        )}
                                    </div>
                                    <div className="reading-stats">
                                        <span className="fs-18 secondry-font">
                                            <i className="fas fa-eye me-2 text-primary-theme"></i>{" "}
                                            {story.read_count} reads
                                        </span>
                                        <span className="ms-3 fs-18 secondry-font">
                                            <i className="fas fa-comment me-2 text-primary-theme"></i>{" "}
                                            {commentCount} comments
                                        </span>
                                    </div>
                                </div>

                                <div className="author-note mt-4">
                                    <h5>Author's Note</h5>
                                    <p>
                                        Thank you for reading "{story.title}". I
                                        hope you enjoyed this story written in
                                        the style of {story.author}. If you'd
                                        like to continue this story with your
                                        own twist, click the "Continue This
                                        Story" button on the story details page.
                                    </p>
                                </div>

                                {/* Comment Section */}
                                <CommentSection
                                    storyId={story.id}
                                    currentUser={auth.user}
                                />
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </Layout>
    );
}
