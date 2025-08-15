import React, { useState } from 'react';
import { Head, useForm, Link } from '@inertiajs/react';
import DashboardLayout from '../../../Layouts/DashboardLayout';
import { Icons } from '../../../utils/icons';
import {
  CButton,
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CForm,
  CFormInput,
  CFormLabel,
  CRow,
  CFormSelect,
  CAlert,
  CInputGroup,
  CInputGroupText,
  CBadge,
} from '@coreui/react';

const Edit = ({ package: pkg }) => {
  // Debug log to see what we're receiving
  console.log('Package data received:', pkg);
  console.log('Package features type:', typeof pkg.features);
  console.log('Package features value:', pkg.features);
  
  const { data, setData, post, processing, errors } = useForm({
    name: pkg.name || '',
    price_cents: pkg.price_cents || '',
    interval: pkg.interval || '',
    features: (() => {
      // Ensure features is always an array
      if (Array.isArray(pkg.features)) {
        return pkg.features.filter(f => f && typeof f === 'string');
      } else if (typeof pkg.features === 'string') {
        return pkg.features.split('\n').filter(f => f && f.trim());
      } else {
        return [''];
      }
    })(),
    stripe_price_id: pkg.stripe_price_id || '',
    is_active: pkg.is_active ? '1' : '0',
    _method: 'PUT', // For method spoofing (PUT request)
  });

  const [successMessage, setSuccessMessage] = useState('');
  const [validationErrors, setValidationErrors] = useState({});

  const addFeature = () => {
    setData('features', [...data.features, '']);
  };

  const removeFeature = (index) => {
    const newFeatures = data.features.filter((_, i) => i !== index);
    setData('features', newFeatures);
  };

  const updateFeature = (index, value) => {
    const newFeatures = [...data.features];
    newFeatures[index] = value;
    setData('features', newFeatures);
  };

  // Clear validation errors when data changes
  React.useEffect(() => {
    if (Object.keys(errors).length > 0) {
      setValidationErrors(errors);
    }
  }, [errors]);

  // Ensure features are properly initialized
  React.useEffect(() => {
    // If features is not properly set, initialize it
    if (!data.features && pkg.features) {
      if (Array.isArray(pkg.features)) {
        setData('features', pkg.features.filter(f => f && typeof f === 'string'));
      } else if (typeof pkg.features === 'string') {
        setData('features', pkg.features.split('\n').filter(f => f && f.trim()));
      }
    }
  }, [pkg.features]);

  const validateForm = () => {
    const newErrors = {};
    
    if (!data.name || data.name.trim() === '') {
      newErrors.name = 'Package name is required';
    }
    
    if (data.price_cents && (isNaN(data.price_cents) || data.price_cents < 0)) {
      newErrors.price_cents = 'Price must be a valid positive number';
    }
    
    if (data.interval && !['monthly', 'yearly', 'one-time', 'weekly', 'daily'].includes(data.interval)) {
      newErrors.interval = 'Please select a valid interval';
    }
    
    // Validate features - ensure it's not empty if provided
    if (data.features && Array.isArray(data.features) && data.features.filter(f => f && f.trim()).length === 0) {
      newErrors.features = 'At least one feature is required';
    }
    
    setValidationErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    
    console.log('Form submission started');
    console.log('Original data.features:', data.features);
    console.log('Original data.features type:', typeof data.features);
    
    // Validate form before submission
    if (!validateForm()) {
      return;
    }
    
    // Filter out empty features
    const featuresArray = data.features.filter(f => f && f.trim());
    
    // Update the form data with filtered features and other formatted data
    setData('features', featuresArray);
    setData('name', data.name.trim());
    // price_cents is already in cents from the onChange handler
    setData('is_active', data.is_active === '1');
    
    console.log('Updated form data with features as array:', featuresArray);
    
    // Use setTimeout to ensure state updates are processed before submission
    setTimeout(() => {
      console.log('Submitting form with updated data');
      post(route('admin-dashboard.packages.update', pkg.id), {
        preserveScroll: true,
        onSuccess: () => {
          setSuccessMessage('Package updated successfully!');
          setValidationErrors({});
          setTimeout(() => setSuccessMessage(''), 3000);
        },
        onError: (errors) => {
          console.error('Update failed:', errors);
          setValidationErrors(errors);
        },
      });
    }, 100); // Small delay to ensure state updates are processed
  };

  const intervalOptions = [
    { value: '', label: 'Select an interval' },
    { value: 'monthly', label: 'Monthly' },
    { value: 'yearly', label: 'Yearly' },
    { value: 'one-time', label: 'One Time' },
    { value: 'weekly', label: 'Weekly' },
    { value: 'daily', label: 'Daily' },
  ];

  const statusOptions = [
    { value: '1', label: 'Active' },
    { value: '0', label: 'Inactive' },
  ];

  return (
    <DashboardLayout>
      <Head title="Edit Package" />
      <CRow>
        <CCol xs={12}>
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <div className="d-flex align-items-center">
                <Link href={route('admin-dashboard.packages.index')}>
                  <CButton color="primary" size="sm" variant="outline" className="me-2">
                    <Icons.ArrowLeft />
                  </CButton>
                </Link>
                <strong>Edit Package: {pkg.name}</strong>
              </div>
              <Link href={route('admin-dashboard.packages.show', pkg.id)}>
                <CButton color="info" size="sm" variant="outline">
                  <Icons.View className="me-1" /> View Package
                </CButton>
              </Link>
            </CCardHeader>
            <CCardBody>
              {successMessage && (
                <CAlert color="success" dismissible>
                  {successMessage}
                </CAlert>
              )}
              
              <CForm onSubmit={handleSubmit}>
                <CRow className="mb-3">
                  <CCol md={6}>
                    <CFormLabel htmlFor="name">Package Name</CFormLabel>
                    <CFormInput
                      id="name"
                      value={data.name}
                      onChange={(e) => setData('name', e.target.value)}
                      invalid={!!errors.name}
                      placeholder="Enter package name"
                    />
                    {errors.name && (
                      <div className="text-danger">{errors.name}</div>
                    )}
                    {validationErrors.name && (
                      <div className="text-danger">{validationErrors.name}</div>
                    )}
                  </CCol>
                  
                  <CCol md={6}>
                    <CFormLabel htmlFor="price_cents">Price ($)</CFormLabel>
                    <CInputGroup>
                      <CInputGroupText>$</CInputGroupText>
                      <CFormInput
                        id="price_cents"
                        type="number"
                        value={data.price_cents ? (data.price_cents / 100).toFixed(2) : ''}
                        onChange={(e) => {
                          const value = e.target.value;
                          if (value === '' || value === '0') {
                            setData('price_cents', '');
                          } else {
                            const cents = Math.round(parseFloat(value) * 100);
                            setData('price_cents', cents);
                          }
                        }}
                        invalid={!!errors.price_cents}
                        placeholder="10.30 for $10.30"
                        min="0"
                        step="0.01"
                      />
                    </CInputGroup>
                    <small className="text-muted">Enter price in dollars (e.g., 10.30 for $10.30)</small>
                                         {errors.price_cents && (
                       <div className="text-danger">{errors.price_cents}</div>
                     )}
                     {validationErrors.price_cents && (
                       <div className="text-danger">{validationErrors.price_cents}</div>
                     )}
                  </CCol>
                </CRow>
                
                <CRow className="mb-3">
                  <CCol md={6}>
                    <CFormLabel htmlFor="interval">Billing Interval</CFormLabel>
                    <CFormSelect
                      id="interval"
                      value={data.interval}
                      onChange={(e) => setData('interval', e.target.value)}
                      invalid={!!errors.interval}
                      options={intervalOptions}
                    />
                                         {errors.interval && (
                       <div className="text-danger">{errors.interval}</div>
                     )}
                     {validationErrors.interval && (
                       <div className="text-danger">{validationErrors.interval}</div>
                     )}
                  </CCol>
                  
                  <CCol md={6}>
                    <CFormLabel htmlFor="is_active">Status</CFormLabel>
                    <CFormSelect
                      id="is_active"
                      value={data.is_active}
                      onChange={(e) => setData('is_active', e.target.value)}
                      invalid={!!errors.is_active}
                      options={statusOptions}
                    />
                                         {errors.is_active && (
                       <div className="text-danger">{errors.is_active}</div>
                     )}
                     {validationErrors.is_active && (
                       <div className="text-danger">{validationErrors.is_active}</div>
                     )}
                  </CCol>
                </CRow>
                
                <CRow className="mb-3">
                  <CCol md={12}>
                    <CFormLabel htmlFor="stripe_price_id">Stripe Price ID</CFormLabel>
                    <CFormInput
                      id="stripe_price_id"
                      value={data.stripe_price_id}
                      onChange={(e) => setData('stripe_price_id', e.target.value)}
                      invalid={!!errors.stripe_price_id}
                      placeholder="Enter Stripe price ID (optional)"
                    />
                    <small className="text-muted">Optional: Enter the Stripe price ID if you have one</small>
                                         {errors.stripe_price_id && (
                       <div className="text-danger">{errors.stripe_price_id}</div>
                     )}
                     {validationErrors.stripe_price_id && (
                       <div className="text-danger">{validationErrors.stripe_price_id}</div>
                     )}
                  </CCol>
                </CRow>
                
                <CRow className="mb-3">
                  <CCol md={12}>
                    <CFormLabel htmlFor="features">Features</CFormLabel>
                    {data.features.map((feature, index) => (
                      <div key={index} className="d-flex gap-2 mb-2">
                        <CFormInput
                          id={`feature-${index}`}
                          value={feature}
                          onChange={(e) => updateFeature(index, e.target.value)}
                          placeholder={`Feature ${index + 1}`}
                          className="flex-grow-1"
                        />
                        {data.features.length > 1 && (
                          <CButton
                            color="danger"
                            size="sm"
                            variant="outline"
                            onClick={() => removeFeature(index)}
                            type="button"
                          >
                            Remove
                          </CButton>
                        )}
                      </div>
                    ))}
                    <CButton
                      color="success"
                      size="sm"
                      variant="outline"
                      onClick={addFeature}
                      type="button"
                      className="mt-2"
                    >
                      + Add More Feature
                    </CButton>
                    <small className="text-muted d-block mt-2">Add features one by one. Each feature will be displayed as a bullet point.</small>
                    {errors.features && (
                      <div className="text-danger">{errors.features}</div>
                    )}
                    {validationErrors.features && (
                      <div className="text-danger">{validationErrors.features}</div>
                    )}
                  </CCol>
                </CRow>

                {/* Preview Section */}
                <CRow className="mb-4">
                  <CCol md={12}>
                    <h5>Preview</h5>
                    <div className="border rounded p-3 bg-light">
                      <div className="row">
                        <div className="col-md-6">
                          <strong>Package Name:</strong>
                          <p className="mb-2">{data.name || 'N/A'}</p>
                        </div>
                        <div className="col-md-6">
                          <strong>Price:</strong>
                          <p className="mb-2">
                            {data.price_cents ? `$${(data.price_cents / 100).toFixed(2)}` : 'Free'}
                          </p>
                        </div>
                        <div className="col-md-6">
                          <strong>Interval:</strong>
                          <p className="mb-2">{data.interval || 'N/A'}</p>
                        </div>
                        <div className="col-md-6">
                          <strong>Status:</strong>
                          <p className="mb-2">
                            {data.is_active === '1' ? (
                              <CBadge color="success">Active</CBadge>
                            ) : (
                              <CBadge color="secondary">Inactive</CBadge>
                            )}
                          </p>
                        </div>
                        <div className="col-12">
                          <strong>Features:</strong>
                          {data.features && data.features.length > 0 ? (
                            <div className="mt-2">
                              {data.features.filter(f => f && f.trim()).map((feature, index) => (
                                <CBadge 
                                  key={index} 
                                  color="info" 
                                  className="me-1 mb-1"
                                >
                                  {feature.trim()}
                                </CBadge>
                              ))}
                            </div>
                          ) : (
                            <p className="text-muted mb-0">No features</p>
                          )}
                        </div>
                      </div>
                    </div>
                  </CCol>
                </CRow>
                
                <CRow>
                  <CCol md={12} className="d-flex gap-2">
                    <CButton 
                      type="submit" 
                      color="primary" 
                      disabled={processing}
                      style={{ backgroundColor: '#fea257', borderColor: '#fea257' }}
                    >
                      {processing ? 'Updating...' : 'Update Package'}
                    </CButton>
                    <Link href={route('admin-dashboard.packages.index')}>
                      <CButton color="secondary" variant="outline">
                        Cancel
                      </CButton>
                    </Link>
                  </CCol>
                </CRow>
              </CForm>
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </DashboardLayout>
  );
};

export default Edit;
