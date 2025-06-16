import React, { useState } from 'react'
import { Head, Link, router } from '@inertiajs/react'
import DashboardLayout from '../../../Layouts/DashboardLayout'
import {
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CRow,
  CTable,
  CTableBody,
  CTableDataCell,
  CTableHead,
  CTableHeaderCell,
  CTableRow,
  CPagination,
  CPaginationItem,
  CButton,
  CTooltip,
  CModal,
  CModalHeader,
  CModalTitle,
  CModalBody,
  CModalFooter,
} from '@coreui/react'
import { FaEye, FaEdit, FaUserCircle, FaTrash, FaUserPlus } from 'react-icons/fa'

// Define theme colors
const themeColors = {
  primary: '#C67C19',
  secondary: '#74989E',
}

const UserIndex = ({ users, flash }) => {
  const toggleUserStatus = (userId) => {
    if (confirm('Are you sure you want to toggle this user\'s status?')) {
      router.post(route('admin.users.toggle-status', userId), {}, {
        preserveScroll: true,
      });
    }
  };
  
  const [deleteModal, setDeleteModal] = useState(false)
  const [userToDelete, setUserToDelete] = useState(null)

  const confirmDelete = (user) => {
    setUserToDelete(user)
    setDeleteModal(true)
  }

  const handleDelete = () => {
    if (userToDelete) {
      router.delete(route('admin.users.destroy', userToDelete.id), {
        onSuccess: () => {
          setDeleteModal(false)
          setUserToDelete(null)
        }
      })
    }
  }

  return (
    <DashboardLayout>
      <Head title="User Management" />
      <CRow>
        <CCol xs={12}>
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <strong className="d-flex align-items-center">
                <FaUserCircle className="me-2" /> Users
              </strong>
              <Link href={route('admin-dashboard.users.create')}>
                <CButton 
                  style={{ backgroundColor: themeColors.primary, borderColor: themeColors.primary }}
                  className="d-flex align-items-center" 
                  size="sm"
                >
                  <FaUserPlus className="me-2" /> <span>Create User</span>
                </CButton>
              </Link>
            </CCardHeader>
            <CCardBody>
              {flash?.success && (
                <div className="alert alert-success mb-3">{flash.success}</div>
              )}
              
              <CTable hover responsive>
                <CTableHead>
                  <CTableRow>
                    <CTableHeaderCell scope="col">ID</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Name</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Email</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Created</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Actions</CTableHeaderCell>
                  </CTableRow>
                </CTableHead>
                <CTableBody>
                  {users.data.length > 0 ? (
                    users.data.map((user) => (
                      <CTableRow key={user.id}>
                        <CTableHeaderCell scope="row">{user.id}</CTableHeaderCell>
                        <CTableDataCell>{user.name}</CTableDataCell>
                        <CTableDataCell>{user.email}</CTableDataCell>
                        <CTableDataCell>{new Date(user.created_at).toLocaleDateString()}</CTableDataCell>
                        <CTableDataCell>
                          <div className="d-flex gap-2">
                            <CTooltip content="View User">
                              <Link href={route('admin-dashboard.users.show', user.id)}>
                                <CButton 
                                  style={{ 
                                    color: themeColors.primary, 
                                    borderColor: themeColors.primary 
                                  }}
                                  size="sm"
                                  variant="outline"
                                  className="d-flex align-items-center justify-content-center"
                                >
                                  <FaEye />
                                </CButton>
                              </Link>
                            </CTooltip>
                            <CTooltip content="Edit User">
                              <Link href={route('admin-dashboard.users.edit', user.id)}>
                                <CButton 
                                  style={{ 
                                    color: themeColors.secondary, 
                                    borderColor: themeColors.secondary 
                                  }}
                                  size="sm"
                                  variant="outline"
                                  className="d-flex align-items-center justify-content-center"
                                >
                                  <FaEdit />
                                </CButton>
                              </Link>
                            </CTooltip>
                            <CTooltip content="Delete User">
                              <CButton 
                                color="danger" 
                                size="sm"
                                variant="outline"
                                onClick={() => confirmDelete(user)}
                                className="d-flex align-items-center justify-content-center"
                              >
                                <FaTrash />
                              </CButton>
                            </CTooltip>
                          </div>
                        </CTableDataCell>
                      </CTableRow>
                    ))
                  ) : (
                    <CTableRow>
                      <CTableDataCell colSpan="5" className="text-center">
                        No users found
                      </CTableDataCell>
                    </CTableRow>
                  )}
                </CTableBody>
              </CTable>

              {users.data.length > 0 && (
                <CPagination align="center" className="mt-3">
                  {users.links.map((link, index) => (
                    <CPaginationItem
                      key={index}
                      active={link.active}
                      style={link.active ? { 
                        backgroundColor: themeColors.primary, 
                        borderColor: themeColors.primary 
                      } : {}}
                      disabled={!link.url}
                      onClick={() => link.url && router.visit(link.url)}
                    >
                      <span dangerouslySetInnerHTML={{ __html: link.label }} />
                    </CPaginationItem>
                  ))}
                </CPagination>
              )}
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>

      {/* Delete Confirmation Modal */}
      <CModal visible={deleteModal} onClose={() => setDeleteModal(false)}>
        <CModalHeader onClose={() => setDeleteModal(false)}>
          <CModalTitle>Confirm Delete</CModalTitle>
        </CModalHeader>
        <CModalBody>
          Are you sure you want to delete the user: <strong>{userToDelete?.name}</strong>?
          <br />
          This action cannot be undone.
        </CModalBody>
        <CModalFooter>
          <CButton color="secondary" onClick={() => setDeleteModal(false)}>
            Cancel
          </CButton>
          <CButton 
            style={{ backgroundColor: 'var(--cui-danger)', borderColor: 'var(--cui-danger)' }} 
            onClick={handleDelete}
          >
            Delete
          </CButton>
        </CModalFooter>
      </CModal>
    </DashboardLayout>
  )
}

export default UserIndex 