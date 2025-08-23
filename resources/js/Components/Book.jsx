import React, { forwardRef } from "react";
import HTMLFlipBook from "react-pageflip";
import "../../css/book.css";


const Book = forwardRef(({ pages = [], onInit, onFlip, coverImage }, bookRef) => {
    const allPages = [
        // Front Cover
        <div key="front-cover" className="book-cover front-cover">
            <img
                src={coverImage || "/assets/images/default-cover.jpg"}
                alt="Front Cover"
                className="cover-image"
            />
        </div>,

        // Story Pages
        ...pages.map((content, index) => (
            <div key={index} className="demoPage">
                {content}
            </div>
        )),

        // Back Cover
        <div key="back-cover" className="book-cover back-cover">
            <img
                src={coverImage || "/assets/images/default-cover.jpg"}
                alt="Back Cover"
                className="cover-image"
            />
        </div>,
    ];

    return (
        <div className="turn-book-wrapper">
            <HTMLFlipBook
                ref={bookRef}
                width={460}
                height={600}
                showCover={true}   // covers enable
                mobileScrollSupport={true}
                onInit={onInit}
                onFlip={onFlip}
                useMouseEvents={true}
                drawShadow={true}
                maxShadowOpacity={0.5}
                flippingTime={1000}
                startPage={1}
                size="stretch"
                minWidth={315}
                maxWidth={1000}
                minHeight={400}
                maxHeight={1536}
                showPageCorners={true}
                disableFlipByClick={false}
            >
                {allPages}
            </HTMLFlipBook>
        </div>
    );
});

export default Book;
