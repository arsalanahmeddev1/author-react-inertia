import React, { useState } from 'react';
import { Head, useForm } from '@inertiajs/react';
import AdminLayout from '../../../Layouts/AdminLayout';
import {
  CButton,
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CForm,
  CFormInput,
  CFormLabel,
  CFormTextarea,
  CRow,
  CFormSelect,
  CAlert,
  CListGroup,
  CListGroupItem,
  CInputGroup,
  CInputGroupText,
} from '@coreui/react';
import ReactQuill from 'react-quill';
// import 'react-quill/dist/quill.snow.css';

const Create = () => {
  const { data, setData, post, processing, errors, reset } = useForm({
    title: '',
    description: '',
    author: '',
    genre: '',
    style: '',
    content: '',
    cover_image: null,
    characters: []
  });

  const [newCharacter, setNewCharacter] = useState({ name: '', description: '' });
  const [preview, setPreview] = useState(null);
  const [successMessage, setSuccessMessage] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    
    post(route('admin.stories.store'), {
      preserveScroll: true,
      onSuccess: () => {
        reset();
        setPreview(null);
        setSuccessMessage('Story created successfully!');
        setTimeout(() => setSuccessMessage(''), 3000);
      },
    });
  };

  const handleContentChange = (content) => {
    setData('content', content);
  };

  const handleCoverImageChange = (e) => {
    if (e.target.files[0]) {
      setData('cover_image', e.target.files[0]);
      setPreview(URL.createObjectURL(e.target.files[0]));
    }
  };

  const handleAddCharacter = () => {
    if (newCharacter.name.trim() === '') return;
    
    setData('characters', [...data.characters, { ...newCharacter }]);
    setNewCharacter({ name: '', description: '' });
  };

  const handleRemoveCharacter = (index) => {
    const updatedCharacters = [...data.characters];
    updatedCharacters.splice(index, 1);
    setData('characters', updatedCharacters);
  };

  const genreOptions = [
    { value: '', label: 'Select a genre' },
    { value: 'Mystery', label: 'Mystery' },
    { value: 'Romance', label: 'Romance' },
    { value: 'Fantasy', label: 'Fantasy' },
    { value: 'Science Fiction', label: 'Science Fiction' },
    { value: 'Thriller', label: 'Thriller' },
    { value: 'Horror', label: 'Horror' },
    { value: 'Historical Fiction', label: 'Historical Fiction' },
  ];

  return (
    <AdminLayout>
      <Head title="Create Story" />
      <CRow>
        <CCol xs={12}>
          <CCard className="mb-4">
            <CCardHeader>
              <strong>Create New Story</strong>
            </CCardHeader>
            <CCardBody>
              {successMessage && (
                <CAlert color="success" dismissible>
                  {successMessage}
                </CAlert>
              )}
              
              <CForm onSubmit={handleSubmit} encType="multipart/form-data">
                <CRow className="mb-3">
                  <CCol md={6}>
                    <CFormLabel htmlFor="title">Title</CFormLabel>
                    <CFormInput
                      id="title"
                      value={data.title}
                      onChange={(e) => setData('title', e.target.value)}
                      invalid={errors.title}
                      feedback={errors.title}
                    />
                   
                  </CCol>
                  
                  <CCol md={6}>
                    <CFormLabel htmlFor="author">Author</CFormLabel>
                    <CFormInput
                      id="author"
                      value={data.author}
                      onChange={(e) => setData('author', e.target.value)}
                      invalid={errors.author}
                      feedback={errors.author}
                    />
                   
                  </CCol>
                </CRow>
                
                <CRow className="mb-3">
                  <CCol md={6}>
                    <CFormLabel htmlFor="genre">Genre</CFormLabel>
                    <CFormSelect
                      id="genre"
                      value={data.genre}
                      onChange={(e) => setData('genre', e.target.value)}
                      invalid={errors.genre}
                      feedback={errors.genre}
                      options={genreOptions}
                    />
                    
                  </CCol>
                  
                  <CCol md={6}>
                    <CFormLabel htmlFor="style">Writing Style</CFormLabel>
                    <CFormInput
                      id="style"
                      value={data.style}
                      onChange={(e) => setData('style', e.target.value)}
                      invalid={errors.style}
                      feedback={errors.style}
                      placeholder="e.g., Gothic, Victorian, Modern, etc."
                    />
                   
                  </CCol>
                </CRow>
                
                <CRow className="mb-3">
                  <CCol md={12}>
                    <CFormLabel htmlFor="description">Description</CFormLabel>
                    <CFormTextarea
                      id="description"
                      rows={3}
                      value={data.description}
                      onChange={(e) => setData('description', e.target.value)}
                      invalid={errors.description}
                      feedback={errors.description}
                    />
                   
                  </CCol>
                </CRow>
                
                <CRow className="mb-3">
                  <CCol md={12}>
                    <CFormLabel htmlFor="cover_image">Cover Image</CFormLabel>
                    <CFormInput
                      type="file"
                      id="cover_image"
                      onChange={handleCoverImageChange}
                      invalid={errors.cover_image}
                      feedback={errors.cover_image}
                      accept="image/*"
                    />
                   
                    
                    {preview && (
                      <div className="mt-2">
                        <img 
                          src={preview} 
                          alt="Cover preview" 
                          style={{ maxWidth: '200px', maxHeight: '200px', objectFit: 'cover' }} 
                        />
                      </div>
                    )}
                  </CCol>
                </CRow>

                <CRow className="mb-3">
                  <CCol md={12}>
                    <CFormLabel>Story Characters</CFormLabel>
                    
                    <CInputGroup className="mb-3">
                      <CInputGroupText>Name</CInputGroupText>
                      <CFormInput
                        value={newCharacter.name}
                        onChange={(e) => setNewCharacter({...newCharacter, name: e.target.value})}
                        placeholder="Character name"
                      />
                      <CInputGroupText>Description</CInputGroupText>
                      <CFormInput
                        value={newCharacter.description}
                        onChange={(e) => setNewCharacter({...newCharacter, description: e.target.value})}
                        placeholder="Brief character description"
                      />
                      <CButton 
                        type="button" 
                        color="primary"
                        onClick={handleAddCharacter}
                      >
                        Add Character
                      </CButton>
                    </CInputGroup>
                    
                    {data.characters.length > 0 && (
                      <CListGroup className="mb-3">
                        {data.characters.map((char, index) => (
                          <CListGroupItem key={index} className="d-flex justify-content-between align-items-center">
                            <div>
                              <strong>{char.name}</strong>
                              {char.description && (
                                <p className="mb-0 text-muted small">{char.description}</p>
                              )}
                            </div>
                            <CButton 
                              color="danger" 
                              size="sm" 
                              onClick={() => handleRemoveCharacter(index)}
                            >
                              Remove
                            </CButton>
                          </CListGroupItem>
                        ))}
                      </CListGroup>
                    )}
                    
                    {errors.characters && (
                      <div className="text-danger">{errors.characters}</div>
                    )}
                  </CCol>
                </CRow>
                
                <CRow className="mb-3">
                  <CCol md={12}>
                    <CFormLabel htmlFor="content">Story Content</CFormLabel>
                    <div className={errors.content ? 'is-invalid' : ''}>
                      <ReactQuill
                        theme="snow"
                        value={data.content}
                        onChange={handleContentChange}
                        style={{ minHeight: '300px', marginBottom: '50px' }}
                      />
                    </div>
                    
                  </CCol>
                </CRow>
                
                <CRow>
                  <CCol xs={12} className="d-flex justify-content-end">
                    <CButton type="submit" color="primary" disabled={processing}>
                      {processing ? 'Saving...' : 'Create Story'}
                    </CButton>
                  </CCol>
                </CRow>
              </CForm>
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </AdminLayout>
  );
};

export default Create;