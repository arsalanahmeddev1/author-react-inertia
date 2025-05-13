import React from 'react'
import { Head, Link } from '@inertiajs/react'
import AdminLayout from '../../../Layouts/AdminLayout'
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
  CBadge
} from '@coreui/react'

const UserIndex = ({ users }) => {
  return (
    <AdminLayout>
      <Head title="User Management" />
      <CRow>
        <CCol xs={12}>
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <strong>Users</strong>
            </CCardHeader>
            <CCardBody>
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
                              <CButton 
                                color="info" 
                                size="sm"
                              >
                                View
                              </CButton>
                            </CTooltip>
                            <CTooltip content="Edit User">
                              <CButton 
                                color="warning" 
                                size="sm"
                              >
                                Edit
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
                      disabled={!link.url}
                      onClick={() => link.url && window.location.replace(link.url)}
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
    </AdminLayout>
  )
}

export default UserIndex 