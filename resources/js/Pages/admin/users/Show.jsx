import React from 'react';
import { Head, Link } from '@inertiajs/react';
import AdminLayout from '../../../Layouts/AdminLayout';
import {
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CRow,
  CListGroup,
  CListGroupItem,
  CButton,
} from '@coreui/react';
import { FaArrowLeft, FaEdit, FaUserCircle } from 'react-icons/fa';

// Define theme colors
const themeColors = {
  primary: '#C67C19',
  secondary: '#74989E',
};

const Show = ({ user }) => {
  return (
    <AdminLayout>
      <Head title={`User: ${user.name}`} />
      <CRow>
        <CCol xs={12}>
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <div className="d-flex align-items-center">
                <strong><FaUserCircle className="me-2" /> User Details</strong>
              </div>
              <div className="d-flex gap-2">
                <Link href={route('admin.users.index')}>
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
                <Link href={route('admin.users.edit', user.id)}>
                  <CButton 
                    style={{ 
                      color: themeColors.secondary, 
                      borderColor: themeColors.secondary 
                    }} 
                    variant="outline" 
                    size="sm"
                    className="d-flex align-items-center"
                  >
                    <FaEdit className="me-1" /> Edit User
                  </CButton>
                </Link>
              </div>
            </CCardHeader>
            <CCardBody>
              <CListGroup>
                <CListGroupItem>
                  <strong>ID:</strong> {user.id}
                </CListGroupItem>
                <CListGroupItem>
                  <strong>Name:</strong> {user.name}
                </CListGroupItem>
                <CListGroupItem>
                  <strong>Email:</strong> {user.email}
                </CListGroupItem>
                <CListGroupItem>
                  <strong>Created:</strong> {new Date(user.created_at).toLocaleString()}
                </CListGroupItem>
                <CListGroupItem>
                  <strong>Updated:</strong> {new Date(user.updated_at).toLocaleString()}
                </CListGroupItem>
              </CListGroup>
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </AdminLayout>
  );
};

export default Show; 