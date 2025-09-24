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
import Book from "../../Components/Book";
import LikeButton from "@/Components/stories/LikeButton";
import usePaginateByHeight from "@/hooks/usePaginateByHeight";

export default function Read({ story, auth }) {
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
    const bookRef = useRef(null);
    const [currentPage, setCurrentPage] = useState(0);
    const [totalPages, setTotalPages] = useState(0);
    const storyContent = getStoryContent();

    // Use pagination hook with book dimensions to preserve styling
    const { pages: storyPages, isPaginating } = usePaginateByHeight(
        storyContent,
        460, // width (same as flipbook)
        600, // height (same as flipbook)
    );
    
    // Debug log
    console.log('Story content:', storyContent);
    console.log('Story pages:', storyPages);

    // Calculate total pages including front cover, story pages, and back cover
    const calculateTotalPages = () => {
        if (storyPages.length === 0) return 0;
        return storyPages.length + 2; // +2 for front and back covers
    };

    useEffect(() => {
        const total = calculateTotalPages();
        setTotalPages(total);
    }, [storyPages.length]);

    const flipNext = () => {
        // Check if we can go to next page
        if (currentPage < totalPages - 1) {
            bookRef.current?.pageFlip()?.flipNext();
        }
    };
    
    const flipPrev = () => {
        // Check if we can go to previous page
        if (currentPage > 0) {
            bookRef.current?.pageFlip()?.flipPrev();
        }
    };

    const handleBookInit = (flipBookInstance) => {
        if (!flipBookInstance) return;

        // Use our calculated total pages instead of trying to get it from flipbook
        const pageCount = calculateTotalPages();
        setTotalPages(pageCount);
        setCurrentPage(0);

        // Listen to flip events - try different event binding approaches
        if (flipBookInstance.on) {
            flipBookInstance.on("flip", (e) => {
                setCurrentPage(e.data);
            });
        } else if (flipBookInstance.pageFlip?.on) {
            flipBookInstance.pageFlip.on("flip", (e) => {
                setCurrentPage(e.data);
            });
        }
    };

    const handleBookFlip = (e) => {
        setCurrentPage(e.data);
    };

    useEffect(() => {
        // console.log("Page:", currentPage, "of", totalPages);
    }, [currentPage, totalPages]);

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
            {/* {showCover && (
                <motion.div
                    className="book-cover-overlay"
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1 }}
                    exit={{ opacity: 0 }}
                >
                    <div onClick={() => setShowCover(false)} className="sr-close-btn position-absolute">
                        <span ><i className="fas fa-times"></i></span>
                    </div>
                    <div className="book-cover-container">
                        <div className="book-cover-wrapper">
                            <img
                                src={
                                    story.cover_image
                                        ? `/storage/${story.cover_image}`
                                        : "/assets/images/image-not-available.jpg"
                                }
                                className="book-cover-image"
                                alt={story.title}
                            />
                            <div className="book-cover-details">
                                <h1 className="book-title">{story.title}</h1>
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
            )} */}

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
                                                : "/assets/images/image-not-available.jpg"
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
                            {isPaginating ? (
                                <div className="text-center py-5">
                                    <div
                                        className="spinner-border text-primary"
                                        role="status"
                                    >
                                        <span className="visually-hidden">
                                            Loading...
                                        </span>
                                    </div>
                                    <p className="mt-3">
                                        Preparing your book...
                                    </p>
                                </div>
                            ) : (
                                <Book
                                    ref={bookRef}
                                    pages={storyPages.map((page, index) => (
                                        <div
                                            key={index}
                                            className="page-content"
                                            dangerouslySetInnerHTML={{
                                                __html: page,
                                            }}
                                        />
                                    ))}
                                    coverImage={
                                        story.cover_image
                                            ? `/storage/${story.cover_image}`
                                            : "/assets/images/default-cover.jpg"
                                    }
                                    backcoverImage={
                                        story.backcover_image
                                            ? `/storage/${story.backcover_image}`
                                            : "/assets/images/default-cover.jpg"
                                    }
                                    onInit={handleBookInit}
                                    onFlip={handleBookFlip}
                                    allowCloseAfterBackCover={story.allow_close_after_back_cover !== false}
                                />
                            )}

                            {/* Chapter Navigation */}
                            <div className="chapter-navigation">
                                <button
                                    className="btn btn-primary story-btn chapter-btn"
                                    onClick={flipPrev}
                                    disabled={currentPage <= 0}
                                >
                                    <i className="fas fa-chevron-left me-2"></i>{" "}
                                    Previous Page
                                </button>
                                <div className="chapter-indicator secondry-font">
                                    Page{" "}
                                    {currentPage + 1}{" "}
                                    of {totalPages}
                                </div>
                                <button
                                    className="btn btn-primary story-btn chapter-btn"
                                    onClick={flipNext}
                                    disabled={currentPage >= totalPages - 1}
                                >
                                    Next Page{" "}
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
                                    <div className="reading-stats d-flex align-items-center">
                                        <span className="fs-18 secondry-font">
                                            <i className="fas fa-eye me-2 text-primary-theme"></i>{" "}
                                            {story.read_count} {story.read_count > 1 ? 'Reads' : 'Read'}
                                        </span>
                                        <span className="ms-3 fs-18 secondry-font">
                                            <i className="fas fa-comment me-2 text-primary-theme"></i>{" "}
                                            {commentCount} {commentCount > 1 ? 'Comments' : 'Comment'}
                                        </span>
                                        <span className="ms-3 fs-18 secondry-font">
                                            <LikeButton storyId={story.id} className="fs-18 secondry-font" />
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
