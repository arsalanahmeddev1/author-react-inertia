import { useState, useEffect, useRef } from 'react';
import { Tab, Nav } from 'react-bootstrap';

const StoryModal = ({ show, onHide, story }) => {
  const [activeTab, setActiveTab] = useState('continue');
  const [storyContent, setStoryContent] = useState('');
  const [wordCount, setWordCount] = useState(0);
  const editorRef = useRef(null);
  const [selectedCharacter, setSelectedCharacter] = useState('');
  const [characterDetails, setCharacterDetails] = useState(null);
  const [savedDrafts, setSavedDrafts] = useState([]);
  const [isLoading, setIsLoading] = useState(false);

  // Reset state when modal is opened
  useEffect(() => {
    if (show) {
      setStoryContent('');
      setWordCount(0);
      setSelectedCharacter('');
      setCharacterDetails(null);
      if (editorRef.current) {
        editorRef.current.innerHTML = '';
      }
    }
  }, [show]);

  // Initialize editor
  useEffect(() => {
    if (editorRef.current) {
      editorRef.current.addEventListener('input', handleEditorChange);
    }

    return () => {
      if (editorRef.current) {
        editorRef.current.removeEventListener('input', handleEditorChange);
      }
    };
  }, []);

  // Handle character selection
  const handleCharacterChange = (e) => {
    const characterId = e.target.value;
    setSelectedCharacter(characterId);

    if (characterId && story?.characters) {
      const character = story.characters.find(c => c.id.toString() === characterId);
      setCharacterDetails(character || null);

      // Add original story text to the editor when a character is selected
      if (character && editorRef.current) {
        // Create a formatted story starter with the character's perspective
        const storyStarter = `
          <p><strong>${story.title}</strong> - Continued from ${character.name}'s perspective</p>
          <p><em>${story.description.substring(0, 200)}...</em></p>
          <hr>
          <p>As ${character.name}, I...</p>
        `;

        // Set the HTML content in the editor
        editorRef.current.innerHTML = storyStarter;

        // Update the story content and word count
        const content = editorRef.current.innerText;
        setStoryContent(content);
        const words = content.trim() ? content.trim().split(/\s+/) : [];
        setWordCount(words.length);
      }
    } else {
      setCharacterDetails(null);

      // Clear the editor if no character is selected
      if (editorRef.current) {
        editorRef.current.innerHTML = '';
        setStoryContent('');
        setWordCount(0);
      }
    }
  };

  // Handle editor content change
  const handleEditorChange = () => {
    if (editorRef.current) {
      const content = editorRef.current.innerText;
      setStoryContent(content);

      // Calculate word count
      const words = content.trim() ? content.trim().split(/\s+/) : [];
      setWordCount(words.length);
    }
  };

  // Format text
  const formatText = (command, value = null) => {
    document.execCommand(command, false, value);
    editorRef.current.focus();
  };

  // Save draft
  const handleSaveDraft = () => {
    // This would connect to your backend in a real implementation
    setIsLoading(true);

    // Simulate API call
    setTimeout(() => {
      const newDraft = {
        id: Date.now(),
        title: `Draft of ${story.title}`,
        content: storyContent,
        htmlContent: editorRef.current ? editorRef.current.innerHTML : '',
        character: characterDetails,
        characterId: selectedCharacter,
        date: new Date().toLocaleDateString(),
        wordCount: wordCount
      };

      setSavedDrafts([newDraft, ...savedDrafts]);
      setIsLoading(false);
    }, 500);
  };

  // Publish story from editor
  const handlePublish = () => {
    // This would connect to your backend in a real implementation
    setIsLoading(true);

    // Simulate API call
    setTimeout(() => {
      alert('Your story has been published!');
      setIsLoading(false);
      onHide();
    }, 500);
  };

  // Publish draft
  const handlePublishDraft = (draft) => {
    // This would connect to your backend in a real implementation
    setIsLoading(true);

    // Simulate API call
    setTimeout(() => {
      alert(`Your draft "${draft.title}" has been published!`);
      setIsLoading(false);

      // Remove from drafts after publishing
      setSavedDrafts(savedDrafts.filter(d => d.id !== draft.id));
    }, 500);
  };

  // Edit draft
  const handleEditDraft = (draft) => {
    setActiveTab('continue');
    setSelectedCharacter(draft.characterId);

    // Find the character
    if (story?.characters) {
      const character = story.characters.find(c => c.id.toString() === draft.characterId);
      setCharacterDetails(character || null);
    }

    // Set HTML content in editor
    if (editorRef.current) {
      if (draft.htmlContent) {
        editorRef.current.innerHTML = draft.htmlContent;
      } else {
        // If no HTML content, create a basic formatted version
        editorRef.current.innerHTML = `<p>${draft.content}</p>`;
      }

      // Update content and word count
      const content = editorRef.current.innerText;
      setStoryContent(content);

      // Use the saved word count or recalculate
      if (draft.wordCount) {
        setWordCount(draft.wordCount);
      } else {
        const words = content.trim() ? content.trim().split(/\s+/) : [];
        setWordCount(words.length);
      }
    }
  };

  return (
    <div className={`story-modal-overlay ${show ? 'show' : ''}`} onClick={onHide}>
      <div className="story-modal-content" onClick={e => e.stopPropagation()}>
        <div className="story-modal-header">
          <h3 className="mb-0 primary-font">{story?.title}</h3>
          <button className="close-btn" onClick={onHide}>
            <i className="fas fa-times"></i>
          </button>
        </div>

        <Tab.Container activeKey={activeTab} onSelect={setActiveTab}>
          <div className="story-modal-tabs">
            <Nav variant="tabs">
              <Nav.Item>
                <Nav.Link eventKey="continue" className="secondry-font">Continue Story</Nav.Link>
              </Nav.Item>
              <Nav.Item>
                <Nav.Link eventKey="drafts" className="secondry-font">My Drafts</Nav.Link>
              </Nav.Item>
              <Nav.Item>
                <Nav.Link eventKey="published" className="secondry-font">My Published</Nav.Link>
              </Nav.Item>
            </Nav>
          </div>

          <div className="story-modal-body">
            <Tab.Content>
              <Tab.Pane eventKey="continue">
                <div className="mb-4">
                  <label className="form-label secondry-font fs-18">Select Character</label>
                  <select
                    className="form-select character-select mb-3"
                    value={selectedCharacter}
                    onChange={handleCharacterChange}
                  >
                    <option value="">Choose Character</option>
                    {story?.characters?.map(character => (
                      <option key={character.id} value={character.id}>
                        {character.name}
                      </option>
                    ))}
                  </select>

                  {characterDetails && (
                    <div className="character-details p-3 mb-3 rounded-3">
                      <h6 className="secondry-font fs-18 mb-2">{characterDetails.name}</h6>
                      <p className="fs-16 mb-0">{characterDetails.description}</p>
                    </div>
                  )}
                </div>

                <div className="mb-4">
                  <div className="d-flex justify-content-between align-items-center mb-2">
                    <label className="form-label secondry-font fs-18 mb-0">Your Story</label>
                    <div className="word-count">
                      <span className="fs-16 text-muted">{wordCount} words</span>
                    </div>
                  </div>
                  <div className="editor-container">
                    <div
                      ref={editorRef}
                      className="form-control story-textarea"
                      contentEditable="true"
                      placeholder="Continue the story in your own words..."
                      suppressContentEditableWarning={true}
                    ></div>
                    <div className="editor-toolbar">
                      <button type="button" className="editor-btn" onClick={() => formatText('bold')}>
                        <i className="fas fa-bold"></i>
                      </button>
                      <button type="button" className="editor-btn" onClick={() => formatText('italic')}>
                        <i className="fas fa-italic"></i>
                      </button>
                      <button type="button" className="editor-btn" onClick={() => formatText('underline')}>
                        <i className="fas fa-underline"></i>
                      </button>
                      <span className="editor-divider"></span>
                      <button type="button" className="editor-btn" onClick={() => formatText('justifyLeft')}>
                        <i className="fas fa-align-left"></i>
                      </button>
                      <button type="button" className="editor-btn" onClick={() => formatText('justifyCenter')}>
                        <i className="fas fa-align-center"></i>
                      </button>
                      <button type="button" className="editor-btn" onClick={() => formatText('justifyRight')}>
                        <i className="fas fa-align-right"></i>
                      </button>
                      <span className="editor-divider"></span>
                      <button type="button" className="editor-btn" onClick={() => formatText('insertUnorderedList')}>
                        <i className="fas fa-list-ul"></i>
                      </button>
                      <button type="button" className="editor-btn" onClick={() => formatText('insertOrderedList')}>
                        <i className="fas fa-list-ol"></i>
                      </button>
                    </div>
                  </div>
                </div>

                <div className="d-flex justify-content-end gap-3">
                  <button
                    className="btn btn-secondary story-btn"
                    onClick={handleSaveDraft}
                    disabled={isLoading || !storyContent.trim() || !selectedCharacter}
                  >
                    {isLoading ? <i className="fas fa-spinner fa-spin me-2"></i> : <i className="fas fa-save me-2"></i>}
                    Save Draft
                  </button>
                  <button
                    className="btn btn-primary story-btn"
                    onClick={handlePublish}
                    disabled={isLoading || !storyContent.trim() || !selectedCharacter}
                  >
                    {isLoading ? <i className="fas fa-spinner fa-spin me-2"></i> : <i className="fas fa-paper-plane me-2"></i>}
                    Publish
                  </button>
                </div>
              </Tab.Pane>

              <Tab.Pane eventKey="drafts">
                {savedDrafts.length > 0 ? (
                  <div className="drafts-list">
                    {savedDrafts.map(draft => (
                      <div key={draft.id} className="draft-item">
                        <div className="draft-header">
                          <h5 className="secondry-font">{draft.title}</h5>
                          <span className="draft-date">{draft.date}</span>
                        </div>
                        <div className="draft-info d-flex gap-3 mb-2">
                          <div className="draft-character">
                            <i className="fas fa-user me-2"></i>
                            <span>Character: {draft.character?.name || 'Unknown'}</span>
                          </div>
                          <div className="draft-word-count">
                            <i className="fas fa-file-word me-2"></i>
                            <span>{draft.wordCount} words</span>
                          </div>
                        </div>
                        <p className="draft-preview">{draft.content.substring(0, 150)}...</p>
                        <div className="draft-actions">
                          <button
                            className="btn btn-sm btn-outline-secondary"
                            onClick={() => handleEditDraft(draft)}
                          >
                            <i className="fas fa-edit me-1"></i> Edit
                          </button>
                          <button
                            className="btn btn-sm btn-outline-primary"
                            onClick={() => handlePublishDraft(draft)}
                            disabled={isLoading}
                          >
                            {isLoading ? <i className="fas fa-spinner fa-spin me-1"></i> : <i className="fas fa-paper-plane me-1"></i>}
                            Publish
                          </button>
                          <button
                            className="btn btn-sm btn-outline-danger"
                            onClick={() => setSavedDrafts(savedDrafts.filter(d => d.id !== draft.id))}
                          >
                            <i className="fas fa-trash me-1"></i> Delete
                          </button>
                        </div>
                      </div>
                    ))}
                  </div>
                ) : (
                  <div className="empty-state">
                    <i className="fas fa-file-alt empty-icon"></i>
                    <h5 className="secondry-font">No Drafts Yet</h5>
                    <p>Your saved drafts will appear here</p>
                  </div>
                )}
              </Tab.Pane>

              <Tab.Pane eventKey="published">
                <div className="empty-state">
                  <i className="fas fa-book empty-icon"></i>
                  <h5 className="secondry-font">No Published Stories Yet</h5>
                  <p>Your published stories will appear here</p>
                </div>
              </Tab.Pane>
            </Tab.Content>
          </div>
        </Tab.Container>
      </div>
    </div>
  );
};

export default StoryModal;
