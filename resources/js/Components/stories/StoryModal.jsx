import { useState, useEffect } from 'react';
import { Tab, Nav } from 'react-bootstrap';

const StoryModal = ({ show, onHide, story }) => {
  const [activeTab, setActiveTab] = useState('continue');
  const [storyContent, setStoryContent] = useState('');
  const [selectedCharacter, setSelectedCharacter] = useState('');
  const [characterDetails, setCharacterDetails] = useState(null);
  const [savedDrafts, setSavedDrafts] = useState([]);
  const [isLoading, setIsLoading] = useState(false);

  // Reset state when modal is opened
  useEffect(() => {
    if (show) {
      setStoryContent('');
      setSelectedCharacter('');
    }
  }, [show]);

  // Handle character selection
  const handleCharacterChange = (e) => {
    const characterId = e.target.value;
    setSelectedCharacter(characterId);

    if (characterId && story?.characters) {
      const character = story.characters.find(c => c.id.toString() === characterId);
      setCharacterDetails(character || null);
    } else {
      setCharacterDetails(null);
    }
  };

  // Handle story content change
  const handleContentChange = (e) => {
    setStoryContent(e.target.value);
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
        character: characterDetails,
        characterId: selectedCharacter,
        date: new Date().toLocaleDateString()
      };

      setSavedDrafts([newDraft, ...savedDrafts]);
      setIsLoading(false);
    }, 500);
  };

  // Publish story
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
                  <label className="form-label secondry-font fs-18">Your Story</label>
                  <textarea
                    className="form-control story-textarea"
                    rows="10"
                    placeholder="Continue the story in your own words..."
                    value={storyContent}
                    onChange={handleContentChange}
                  ></textarea>
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
                        <div className="draft-character">
                          <i className="fas fa-user me-2"></i>
                          <span>Character: {draft.character?.name || 'Unknown'}</span>
                        </div>
                        <p className="draft-preview">{draft.content.substring(0, 150)}...</p>
                        <div className="draft-actions">
                          <button className="btn btn-sm btn-outline-secondary">
                            <i className="fas fa-edit me-1"></i> Edit
                          </button>
                          <button className="btn btn-sm btn-outline-primary">
                            <i className="fas fa-paper-plane me-1"></i> Publish
                          </button>
                          <button className="btn btn-sm btn-outline-danger">
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
