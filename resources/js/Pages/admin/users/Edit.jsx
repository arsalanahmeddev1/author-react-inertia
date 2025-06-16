import React, { useState } from 'react';
import { Head, Link, useForm } from '@inertiajs/react';
import DashboardLayout from '../../../Layouts/DashboardLayout';
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

const Edit = ({ user }) => {
  const [error, setError] = useState('');
  const { data, setData, put, processing, errors } = useForm({
    name: user.name,
    email: user.email,
    password: '',
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    put(route('admin.users.update', user.id), {
      onError: (errors) => {
        if (Object.keys(errors).length === 0) {
          setError('An unexpected error occurred. Please try again.');
        }
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
                  style={{ 
                    color: themeColors.primary, 
                    borderColor: themeColors.primary 
                  }} 
                  variant="outline" 
                  size="sm"
                  className="d-flex align-items-center"
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
                    style={{ 
                      backgroundColor: themeColors.primary, 
                      borderColor: themeColors.primary 
                    }} 
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