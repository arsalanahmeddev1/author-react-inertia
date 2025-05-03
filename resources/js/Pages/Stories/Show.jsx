import { useState } from 'react';
import { Head, Link } from '@inertiajs/react';
import InnerLayout from '@/Layouts/InnerLayout';
import StoryModal from '@/Components/stories/StoryModal';
import CharacterModal from '@/Components/stories/CharacterModal';
import '@/assets/styles/stories.css';
import '@/assets/styles/story-modal.css';
import '@/assets/styles/character-modal.css';

export default function Show({ story }) {
  const [showModal, setShowModal] = useState(false);
  const [showCharacterModal, setShowCharacterModal] = useState(false);
  const [selectedCharacter, setSelectedCharacter] = useState(null);

  const handleOpenModal = () => {
    setShowModal(true);
  };

  const handleCloseModal = () => {
    setShowModal(false);
  };

  const handleOpenCharacterModal = (character) => {
    setSelectedCharacter(character);
    setShowCharacterModal(true);
  };

  const handleCloseCharacterModal = () => {
    setShowCharacterModal(false);
    setSelectedCharacter(null);
  };

  return (
    <InnerLayout>
      <Head title={story.title} />

      <section className="py-100 sec-bg">
        <div className="container">
          <div className="row">
            <div className="col-lg-10 mx-auto">
              <div className="bg-white p-4 p-md-5 rounded-4 shadow-sm">
                <div className="row">
                  <div className="col-md-4 mb-4 mb-md-0">
                    <img
                      src={`/${story.cover_image}`}
                      alt={story.title}
                      className="img-fluid rounded-3 mb-3"
                    />
                    <div className="d-flex justify-content-between align-items-center mb-3">
                      <span className="fs-18 secondry-font">
                        <i className="fas fa-eye me-2 text-primary-theme"></i> {story.read_count} reads
                      </span>
                      <span className="fs-18 secondry-font">
                        <i className="fas fa-comment me-2 text-primary-theme"></i> {story.comment_count}
                      </span>
                    </div>
                    <div className="mb-3">
                      <span className="label bg-secondry-theme text-white fs-16 py-10 px-20 radius-60 d-inline-block">
                        {story.genre}
                      </span>
                    </div>
                    {story.style && (
                      <div className="mb-3">
                        <span className="label bg-primary-theme text-white fs-16 py-10 px-20 radius-60 d-inline-block">
                          In Style of: {story.style}
                        </span>
                      </div>
                    )}

                    {/* Characters Section */}
                    <div className="story-characters mt-4">
                      <h5 className="secondry-font fs-20 mb-3">Characters</h5>
                      <div className="character-list">
                        {story.characters && story.characters.length > 0 ? (
                          story.characters.map(character => (
                            <div
                              key={character.id}
                              className="character-item mb-3 cursor-pointer"
                              onClick={() => handleOpenCharacterModal(character)}
                            >
                              <div className="character-name">
                                <i className="fas fa-user-circle me-2 text-primary-theme"></i>
                                <span className="fs-18 fw-500">{character.name}</span>
                                <i className="fas fa-info-circle ms-auto text-secondry-theme"></i>
                              </div>
                            </div>
                          ))
                        ) : (
                          <p className="fs-16">No characters available</p>
                        )}
                      </div>
                    </div>
                  </div>
                  <div className="col-md-8">
                    <h1 className="heading mb-3">{story.title}</h1>
                    <h4 className="fs-24 text-primary-theme mb-3">By {story.author}</h4>
                    <div className="story-description secondry-font fs-20 mb-4">
                      {story.description.split('\n').map((paragraph, index) => (
                        <p key={index} className="mb-3">{paragraph}</p>
                      ))}
                    </div>
                    <div className="d-flex flex-wrap gap-3 mt-4">
                      <Link href={route('stories.index')} className="btn btn-secondary d-flex align-items-center gap-1 story-btn back-btn">
                        <i className="fas fa-arrow-left me-2"></i> Back to Stories
                      </Link>
                      <button
                        className="btn btn-primary story-btn continue-btn"
                        onClick={handleOpenModal}
                      >
                        <i className="fas fa-book-open me-2"></i> Continue This Story
                      </button>

                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Story Modal */}
      <StoryModal
        show={showModal}
        onHide={handleCloseModal}
        story={story}
      />

      <CharacterModal
        show={showCharacterModal}
        onHide={handleCloseCharacterModal}
        character={selectedCharacter}
      />
    </InnerLayout>
  );
}
