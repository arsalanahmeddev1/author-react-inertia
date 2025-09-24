import { useState, useEffect } from "react";

export default function usePaginateByHeight(htmlContent, pageWidth = 460, pageHeight = 500) {
  const [pages, setPages] = useState([]);
  const [isPaginating, setIsPaginating] = useState(true);

  useEffect(() => {
    if (!htmlContent) {
      setPages([]);
      setIsPaginating(false);
      return;
    }

    setIsPaginating(true);

    // Create offscreen container with proper styling that matches the book page
    const container = document.createElement("div");
    container.style.cssText = `
      position: absolute;
      left: -9999px;
      top: -9999px;
      width: ${pageWidth}px;
      height: auto;
      overflow: visible;
      font-family: 'Georgia', serif;
      line-height: 1.6;
      font-size: 17px;
      color: #333;
      padding: 20px;
      box-sizing: border-box;
      background: #fefefe;
    `;
    document.body.appendChild(container);

    try {
      const resultPages = [];
      
      // Better approach: split by paragraphs first, then by sentences
      const paragraphs = htmlContent.split(/(<\/p>|<br\s*\/?>|<\/div>)/);
      let currentPage = '';
      
      for (let i = 0; i < paragraphs.length; i++) {
        const paragraph = paragraphs[i];
        const testContent = currentPage + paragraph;
        
        // Test if this content fits in the page
        container.innerHTML = testContent;
        
        if (container.scrollHeight > pageHeight && currentPage.trim()) {
          // Page is full, save it and start new one
          resultPages.push(currentPage.trim());
          currentPage = paragraph;
        } else {
          // Add paragraph to current page
          currentPage = testContent;
        }
      }
      
      // If still too long, split by sentences
      if (currentPage && container.scrollHeight > pageHeight) {
        const sentences = currentPage.split(/([.!?]\s+)/);
        let tempPage = '';
        
        for (let j = 0; j < sentences.length; j++) {
          const sentence = sentences[j];
          const testSentence = tempPage + sentence;
          
          container.innerHTML = testSentence;
          
          if (container.scrollHeight > pageHeight && tempPage.trim()) {
            resultPages.push(tempPage.trim());
            tempPage = sentence;
          } else {
            tempPage = testSentence;
          }
        }
        
        if (tempPage.trim()) {
          resultPages.push(tempPage.trim());
        }
      } else if (currentPage.trim()) {
        // Add the last page if it has content
        resultPages.push(currentPage.trim());
      }
      
      console.log('Pagination result:', {
        originalLength: htmlContent.length,
        pagesCreated: resultPages.length,
        pageHeights: resultPages.map(page => {
          container.innerHTML = page;
          return container.scrollHeight;
        })
      });
      
      setPages(resultPages);
    } catch (error) {
      console.error('Error during pagination:', error);
      setPages([]);
    } finally {
      document.body.removeChild(container);
      setIsPaginating(false);
    }
  }, [htmlContent, pageWidth, pageHeight]);

  return { pages, isPaginating };
}
