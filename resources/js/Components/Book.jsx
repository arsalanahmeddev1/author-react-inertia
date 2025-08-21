import React, { forwardRef } from "react";
import HTMLFlipBook from "react-pageflip";
import "../../css/book.css";

const Book = forwardRef(({ pages = [], onInit, onFlip }, bookRef) => {
    return (
        <div className="turn-book-wrapper">
            <HTMLFlipBook
                ref={bookRef}
                width={460}
                height={500}
                showCover={false}
                mobileScrollSupport={true}
                onInit={onInit}
                onFlip={onFlip}
            >
                {pages.map((content, index) => (
                    <div key={index} className="demoPage">
                        {content}
                    </div>
                ))}
            </HTMLFlipBook>
        </div>
    );
});

export default Book;
