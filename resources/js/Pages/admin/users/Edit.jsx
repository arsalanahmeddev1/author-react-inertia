import React, { useState, useEffect } from 'react';
import { Head, Link, useForm } from '@inertiajs/react';
import DashboardLayout from '../../../Layouts/DashboardLayout';
import Swal from 'sweetalert2';
import {
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CRow,
  CForm,
  CFormLabel,
  CFormInput,
  CButton,
  CAlert,
} from '@coreui/react';
import { FaArrowLeft, FaSave, FaUserCircle } from 'react-icons/fa';

// Define theme colors
const themeColors = {
  primary: '#C67C19',
  secondary: '#74989E',
};

const Edit = ({ user, flash }) => {
  const [error, setError] = useState('');
  const { data, setData, put, processing, errors } = useForm({
    name: user.name,
    email: user.email,
    password: '',
  });

  // Handle flash messages with SweetAlert
  useEffect(() => {
    if (flash?.success) {
      Swal.fire({
        icon: 'success',
        title: flash.success,
        showConfirmButton: false,
        timer: 1500,
      });
    }
  }, [flash?.success]);

  // Warn user about unsaved changes
  useEffect(() => {
    const handleBeforeUnload = (e) => {
      if (data.name !== user.name || data.email !== user.email || data.password) {
        e.preventDefault();
        e.returnValue = '';
      }
    };

    window.addEventListener('beforeunload', handleBeforeUnload);
    return () => window.removeEventListener('beforeunload', handleBeforeUnload);
  }, [data, user]);

  const handleSubmit = (e) => {
    e.preventDefault();
    
    // Show loading state
    Swal.fire({
      title: 'Updating user...',
      allowOutsideClick: false,
      didOpen: () => {
        Swal.showLoading();
      }
    });

    put(route('admin-dashboard.users.update', user.id), {
      onSuccess: () => {
        Swal.fire({
          icon: 'success',
          title: 'User updated successfully!',
          text: 'Redirecting to users list...',
          showConfirmButton: false,
          timer: 1500,
          confirmButtonColor: themeColors.primary,
          background: '#fff',
          customClass: {
            popup: 'swal2-custom-popup',
            title: 'swal2-custom-title',
            content: 'swal2-custom-content'
          }
        });
      },
      onError: (errors) => {
        if (Object.keys(errors).length === 0) {
          setError('An unexpected error occurred. Please try again.');
        }
        
        // Show specific error messages
        let errorMessage = 'Please check your input.';
        if (errors.name) errorMessage = errors.name;
        else if (errors.email) errorMessage = errors.email;
        else if (errors.password) errorMessage = errors.password;
        
        Swal.fire({
          icon: 'error',
          title: 'Error updating user!',
          text: errorMessage,
          showConfirmButton: true,
          confirmButtonColor: themeColors.primary,
          background: '#fff',
          customClass: {
            popup: 'swal2-custom-popup',
            title: 'swal2-custom-title',
            content: 'swal2-custom-content'
          }
        });
      },
    });
  };

  return (
    <DashboardLayout>
      <Head title={`Edit User: ${user.name}`} />
      <CRow>
        <CCol xs={12} md={8} lg={6} className="mx-auto">
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <div className="d-flex align-items-center">
                <strong><FaUserCircle className="me-2" /> Edit User</strong>
              </div>
              <Link href={route('admin-dashboard.users.index')}>
                <CButton 
                  color="primary" size="sm" style={{ backgroundColor: '#fea257', borderColor: '#fea257' }}
                >
                  <FaArrowLeft className="me-1" /> Back to Users
                </CButton>

                
              </Link>
            </CCardHeader>
            <CCardBody>
              {error && <CAlert color="danger">{error}</CAlert>}

              <CForm onSubmit={handleSubmit}>
                <div className="mb-3">
                  <CFormLabel htmlFor="name">Name</CFormLabel>
                  <CFormInput
                    id="name"
                    value={data.name}
                    onChange={(e) => setData('name', e.target.value)}
                    invalid={errors.name ? true : false}
                    feedback={errors.name}
                  />
                  {errors.name && <div className="text-danger">{errors.name}</div>}
                </div>

                <div className="mb-3">
                  <CFormLabel htmlFor="email">Email</CFormLabel>
                  <CFormInput
                    type="email"
                    id="email"
                    value={data.email}
                    onChange={(e) => setData('email', e.target.value)}
                    invalid={errors.email ? true : false}
                  />
                  {errors.email && <div className="text-danger">{errors.email}</div>}
                </div>

                <div className="mb-3">
                  <CFormLabel htmlFor="password">
                    Password <small className="text-muted">(Leave blank to keep current password)</small>
                  </CFormLabel>
                  <CFormInput
                    type="password"
                    id="password"
                    value={data.password}
                    onChange={(e) => setData('password', e.target.value)}
                    invalid={errors.password ? true : false}
                  />
                  {errors.password && <div className="text-danger">{errors.password}</div>}
                </div>

                <div className="d-flex justify-content-end">
                  <CButton 
                    color="primary" size="sm" style={{ backgroundColor: '#fea257', borderColor: '#fea257' }}
                    type="submit" 
                    disabled={processing}
                    className="d-flex align-items-center"
                  >
                    <FaSave className="me-1" /> Save Changes
                  </CButton>
                </div>
              </CForm>
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </DashboardLayout>
  );
};

export default Edit; 