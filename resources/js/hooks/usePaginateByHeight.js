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

    // Create offscreen container with proper styling that matches the book page exactly
    const container = document.createElement("div");
    container.style.cssText = `
      position: absolute;
      left: -9999px;
      top: -9999px;
      width: ${pageWidth}px;
      height: auto;
      overflow: hidden;
      font-family: 'Georgia', serif;
      line-height: 1.6;
      font-size: 17px;
      color: #333;
      box-sizing: border-box;
      background: #fefefe;
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
    `;
    document.body.appendChild(container);

    try {
      const resultPages = [];
      
      // Create a more intelligent pagination approach
      // First, split content into manageable chunks
      let contentChunks = [];
      
      // Split by major HTML elements (paragraphs, divs, etc.)
      const majorElements = htmlContent.split(/(<\/?(?:p|div|h[1-6]|br)[^>]*>)/i);
      let currentChunk = '';
      
      for (let i = 0; i < majorElements.length; i++) {
        const element = majorElements[i];
        if (element.trim()) {
          // If it's a closing tag or line break, add it to current chunk
          if (element.match(/<\/|<br/i)) {
            currentChunk += element;
            if (element.match(/<\/p>|<\/div>|<br/i)) {
              contentChunks.push(currentChunk);
              currentChunk = '';
            }
          } else {
            currentChunk += element;
          }
        }
      }
      
      // Add any remaining content
      if (currentChunk.trim()) {
        contentChunks.push(currentChunk);
      }
      
      // Now paginate based on these chunks
      let currentPage = '';
      const maxAttempts = 5; // Prevent infinite loops
      
      for (let i = 0; i < contentChunks.length; i++) {
        const chunk = contentChunks[i];
        const testContent = currentPage + chunk;
        
        // Test if this content fits in the page
        container.innerHTML = testContent;
        
        if (container.scrollHeight > pageHeight && currentPage.trim()) {
          // Page is full, save current page and try with the new chunk
          resultPages.push(currentPage.trim());
          currentPage = chunk;
          
          // Check if this single chunk is still too long
          container.innerHTML = currentPage;
          let attempts = 0;
          
          while (container.scrollHeight > pageHeight && attempts < maxAttempts) {
            attempts++;
            
            // Split chunk further by sentences if it's too long
            const sentences = currentPage.split(/([.!?]\s+)/);
            let tempPage = '';
            let remainder = '';
            
            for (let j = 0; j < sentences.length; j++) {
              const sentence = sentences[j];
              const testSentence = tempPage + sentence;
              
              container.innerHTML = testSentence;
              
              if (container.scrollHeight > pageHeight && tempPage.trim()) {
                // Save the current temp page and continue with remainder
                if (tempPage.trim()) {
                  resultPages.push(tempPage.trim());
                }
                tempPage = '';
                remainder = sentences.slice(j).join('');
                break;
              } else {
                tempPage = testSentence;
              }
            }
            
            currentPage = remainder || tempPage;
            container.innerHTML = currentPage;
          }
        } else {
          // Add chunk to current page
          currentPage = testContent;
        }
      }
      
      // Add the last page if it has content
      if (currentPage.trim()) {
        resultPages.push(currentPage.trim());
      }
      
      // Ensure we have pages and they're not empty
      const validPages = resultPages.filter(page => page && page.trim().length > 0);
      
      console.log('Pagination result:', {
        originalLength: htmlContent.length,
        pagesCreated: validPages.length,
        pageHeights: validPages.map((page, index) => {
          container.innerHTML = page;
          return {
            pageIndex: index,
            height: container.scrollHeight,
            contentLength: page.length
          };
        }),
        pages: validPages.map((page, index) => ({
          index: index,
          preview: page.substring(0, 100) + (page.length > 100 ? '...' : '')
        }))
      });
      
      setPages(validPages);
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
