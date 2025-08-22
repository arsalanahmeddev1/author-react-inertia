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

    // Create offscreen container with proper styling
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
    `;
    document.body.appendChild(container);

    try {
      const resultPages = [];
      
      // Simple approach: split by sentences and test height
      const sentences = htmlContent.split(/([.!?]\s+)/);
      let currentPage = '';
      
      for (let i = 0; i < sentences.length; i++) {
        const sentence = sentences[i];
        const testContent = currentPage + sentence;
        
        // Test if this content fits in the page
        container.innerHTML = testContent;
        
        if (container.scrollHeight > pageHeight && currentPage.trim()) {
          // Page is full, save it and start new one
          resultPages.push(currentPage.trim());
          currentPage = sentence;
        } else {
          // Add sentence to current page
          currentPage = testContent;
        }
      }
      
      // Add the last page if it has content
      if (currentPage.trim()) {
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
