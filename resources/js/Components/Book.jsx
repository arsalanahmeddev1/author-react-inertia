import React, { useEffect, useRef } from "react";
import "../../css/book.css";
import "../../css/steve-jobs.css";
const Book = () => {
    const bookRef = useRef(null);

    useEffect(() => {
        const loadScript = (src) =>
            new Promise((resolve, reject) => {
                const script = document.createElement("script");
                script.src = src;
                script.onload = resolve;
                script.onerror = reject;
                document.body.appendChild(script);
            });

        const init = async () => {
            await loadScript("https://code.jquery.com/jquery-3.6.0.min.js");
            window.$ = window.jQuery = window.$ || window.jQuery;

            await loadScript("/assets/turn/turn.min.js");
            await loadScript("/assets/turn/steve-jobs.js");

            if (bookRef.current && window.$(bookRef.current).turn) {
                window.$(bookRef.current).turn({
                    width: 800,
                    height: 600,
                    autoCenter: true,
                    display: "double",
                    gradients: true,
                    acceleration: true,
                    when: {
                        turning: function (event, page, view) {
                            console.log("Turning to page:", page);
                        },
                    },
                });

                // keyboard support
                document.addEventListener("keydown", (e) => {
                    if (e.key === "ArrowRight") {
                        window.$(bookRef.current).turn("next");
                    } else if (e.key === "ArrowLeft") {
                        window.$(bookRef.current).turn("previous");
                    }
                });
            } else {
                console.error("turn.js did not attach to jQuery");
            }
        };

        init();
    }, []);

    return (
        <div className="book-container">
            <div ref={bookRef} className="flipbook">
                <div class="sj-book"></div>
                <div className="page">Page 1: Welcome to StoryVault</div>
                <div className="page">Page 2: Your story begins here</div>
                <div className="page">Page 3: Another chapter</div>
                <div className="page">Page 4: The End</div>
            </div>

            <div className="controls">
                <button
                    onClick={() => window.$(bookRef.current).turn("previous")}
                >
                    ◀ Prev
                </button>
                <button onClick={() => window.$(bookRef.current).turn("next")}>
                    Next ▶
                </button>
            </div>
        </div>
    );
};

export default Book;
