import React from 'react';
import { Head, Link, router } from '@inertiajs/react';
import DashboardLayout from '../../../Layouts/DashboardLayout';
import Swal from 'sweetalert2';
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
import { FaArrowLeft, FaEdit, FaUserCircle, FaTrash } from 'react-icons/fa';

// Define theme colors
const themeColors = {
  primary: '#C67C19',
  secondary: '#74989E',
};

const Show = ({ user, flash }) => {
  const handleDelete = () => {
    Swal.fire({
      title: 'Confirm Delete',
      html: `Are you sure you want to delete the user: <strong>${user.name}</strong>?<br><br>This action cannot be undone.`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#6c757d',
      confirmButtonText: 'Delete User',
      cancelButtonText: 'Cancel',
      background: '#fff',
      customClass: {
        popup: 'swal2-custom-popup',
        title: 'swal2-custom-title',
        content: 'swal2-custom-content',
        confirmButton: 'swal2-confirm',
        cancelButton: 'swal2-cancel'
      }
    }).then((result) => {
      if (result.isConfirmed) {
        router.delete(route('admin-dashboard.users.destroy', user.id), {
          onSuccess: () => {
            Swal.fire({
              icon: 'success',
              title: 'User deleted successfully!',
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
          onError: () => {
            Swal.fire({
              icon: 'error',
              title: 'Error deleting user!',
              text: 'An unexpected error occurred.',
              confirmButtonColor: themeColors.primary,
              background: '#fff',
              customClass: {
                popup: 'swal2-custom-popup',
                title: 'swal2-custom-title',
                content: 'swal2-custom-content'
              }
            });
          }
        });
      }
    });
  };

  return (
    <DashboardLayout>
      <Head title={`User: ${user.name}`} />
      <CRow>
        <CCol xs={12}>
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <div className="c">
                <strong className='d-flex align-items-center'><FaUserCircle className="me-2" /> User Details</strong>
              </div>
              <div className="d-flex gap-2">
                <Link href={route('admin-dashboard.users.index')}>
                  <CButton 
                   color="primary" className='custom-primary-btn' size="sm" style={{ backgroundColor: '#fea257', borderColor: '#fea257' }}
                  >
                    <FaArrowLeft className="me-1" /> Back to Users
                  </CButton>
                </Link>
                <Link href={route('admin-dashboard.users.edit', user.id)}>
                  <CButton 
                    color="primary" className='custom-primary-btn' size="sm" style={{ backgroundColor: '#fea257', borderColor: '#fea257' }}
                  >
                    <FaEdit className="me-1" /> Edit User
                  </CButton>
                </Link>
                <CButton 
                  onClick={handleDelete}
                  color="primary" className='custom-primary-btn' size="sm" style={{ backgroundColor: '#fea257', borderColor: '#fea257' }}
                >
                  <FaTrash className="me-1" /> Delete User
                </CButton>
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
    </DashboardLayout>
  );
};

export default Show; 