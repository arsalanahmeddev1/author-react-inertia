import { useState, useEffect } from "react";

export default function usePaginateByHeight(htmlContent, pageWidth = 460, pageHeight = 600) {
  const [pages, setPages] = useState([]);
  const [isPaginating, setIsPaginating] = useState(true);

  useEffect(() => {
    if (!htmlContent) {
      setPages([]);
      setIsPaginating(false);
      return;
    }

    setIsPaginating(true);

    // Create offscreen container with EXACT styling that matches the book page
    const container = document.createElement("div");
    container.style.cssText = `
      position: absolute;
      left: -9999px;
      top: -9999px;
      width: ${pageWidth}px;
      height: auto;
      overflow: hidden;
      // font-family: 'Georgia', serif;
      line-height: 1.6;
      font-size: 17px;
      color: #333;
      // padding: 20px;
      // box-sizing: border-box;
      // background: #fefefe;
      // word-wrap: break-word;
      // text-align: justify;
    `;
    document.body.appendChild(container);

    try {
      const resultPages = [];
      const availableHeight = pageHeight - 10; // Very aggressive - use almost all space
      
      // Simple and reliable pagination approach
      // Split content into meaningful chunks (paragraphs, lists, etc.)
      const chunks = htmlContent.split(/(<(?:p|div|ul|ol|h[1-6])[^>]*>.*?<\/(?:p|div|ul|ol|h[1-6])>)/gi)
        .filter(chunk => chunk.trim() && !chunk.match(/^<\/?(p|div|ul|ol|h[1-6])[^>]*>$/));
      
      let currentPage = '';
      
      for (const chunk of chunks) {
        if (!chunk.trim()) continue;
        
        const testContent = currentPage + chunk;
        container.innerHTML = testContent;
        
        // Check if adding this chunk exceeds the page height (be very aggressive)
        if (container.scrollHeight > (availableHeight + 40) && currentPage.trim()) {
          // Page is full, save current page
          resultPages.push(currentPage.trim());
          currentPage = chunk;
          
          // Check if this single chunk is too long for one page
          container.innerHTML = currentPage;
          if (container.scrollHeight > (availableHeight + 40)) {
            // Split by sentences if the chunk is too long
            const sentences = chunk.split(/(?<=[.!?])\s+/);
            let partialContent = '';
            
            for (const sentence of sentences) {
              const testSentence = partialContent + (partialContent ? ' ' : '') + sentence;
              
              // Test with HTML wrapper if chunk has HTML tags
              let testHTML = testSentence;
              if (chunk.includes('<')) {
                const openTag = chunk.match(/<[^>]+>/)?.[0] || '';
                const closeTag = chunk.match(/<\/[^>]+>/)?.[0] || '';
                testHTML = openTag + testSentence + closeTag;
              }
              
              container.innerHTML = testHTML;
              
              if (container.scrollHeight > (availableHeight + 40) && partialContent.trim()) {
                // Save this partial page
                let finalHTML = partialContent;
                if (chunk.includes('<')) {
                  const openTag = chunk.match(/<[^>]+>/)?.[0] || '';
                  const closeTag = chunk.match(/<\/[^>]+>/)?.[0] || '';
                  finalHTML = openTag + partialContent + closeTag;
                }
                resultPages.push(finalHTML.trim());
                partialContent = sentence;
              } else {
                partialContent = testSentence;
              }
            }
            
            // Handle remaining content
            if (partialContent.trim()) {
              let finalHTML = partialContent;
              if (chunk.includes('<')) {
                const openTag = chunk.match(/<[^>]+>/)?.[0] || '';
                const closeTag = chunk.match(/<\/[^>]+>/)?.[0] || '';
                finalHTML = openTag + partialContent + closeTag;
              }
              currentPage = finalHTML;
            } else {
              currentPage = '';
            }
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
        pagePreview: validPages.map((page, index) => ({
          pageNumber: index + 1,
          contentPreview: page.replace(/<[^>]*>/g, '').substring(0, 150) + '...',
          contentLength: page.length,
          hasHTML: page.includes('<')
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
