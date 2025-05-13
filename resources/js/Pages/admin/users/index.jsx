import React from 'react'
import AdminLayout from '../../../Layouts/AdminLayout'
import {
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CRow,
  CTable,
  CTableBody,
  CTableCaption,
  CTableDataCell,
  CTableHead,
  CTableHeaderCell,
  CTableRow,
} from '@coreui/react'
const index = () => {
  return (
    <AdminLayout>
      {/* <Head title="Story Management" /> */}
      <CRow>
        <CCol xs={12}>
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <strong>Stories</strong>
            </CCardHeader>
            <CCardBody>
              <CTable hover responsive>
                <CTableHead>
                  <CTableRow>
                    <CTableHeaderCell scope="col">ID</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Title</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Author</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Genre</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Type</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Stats</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Created</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Actions</CTableHeaderCell>
                  </CTableRow>
                </CTableHead>
                <CTableBody>
                  {stories.data.length > 0 ? (
                    stories.data.map((story) => (
                      <CTableRow key={story.id}>
                        <CTableHeaderCell scope="row">{story.id}</CTableHeaderCell>
                        <CTableDataCell>{story.title}</CTableDataCell>
                        <CTableDataCell>{story.author}</CTableDataCell>
                        <CTableDataCell>{story.genre}</CTableDataCell>
                        <CTableDataCell>
                          <CBadge color={story.is_community ? 'info' : 'success'}>
                            {story.is_community ? 'Community' : 'Standard'}
                          </CBadge>
                        </CTableDataCell>
                        <CTableDataCell>
                          <div className="d-flex gap-2">
                            <CBadge color="primary" title="Reads">
                              👁️ {story.read_count}
                            </CBadge>
                            <CBadge color="danger" title="Likes">
                              ❤️ {story.likes_count}
                            </CBadge>
                            <CBadge color="dark" title="Comments">
                              💬 {story.comment_count}
                            </CBadge>
                          </div>
                        </CTableDataCell>
                        <CTableDataCell>{formatDate(story.created_at)}</CTableDataCell>
                        <CTableDataCell>
                          <div className="d-flex gap-2">
                            <CTooltip content="View Story">
                              <CButton 
                                color="info" 
                                size="sm" 
                                onClick={() => router.visit(route('admin.stories.show', story.id))}
                              >
                                {/* <CIcon icon={cilEye} /> View */}
                              </CButton>
                            </CTooltip>
                            <CTooltip content="Delete Story">
                              <CButton 
                                color="danger" 
                                size="sm" 
                                onClick={() => confirmDelete(story)}
                              >
                                {/* <CIcon icon={cilTrash} /> Delete */}
                              </CButton>
                            </CTooltip>
                          </div>
                        </CTableDataCell>
                      </CTableRow>
                    ))
                  ) : (
                    <CTableRow>
                      <CTableDataCell colSpan="8" className="text-center">
                        No stories found
                      </CTableDataCell>
                    </CTableRow>
                  )}
                </CTableBody>
              </CTable>

              {stories.data.length > 0 && (
                <CPagination align="center" className="mt-3">
                  {stories.links.map((link, index) => (
                    <CPaginationItem
                      key={index}
                      active={link.active}
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
          Are you sure you want to delete the story: <strong>{storyToDelete?.title}</strong>?
          <br />
          This action cannot be undone and will remove all associated comments and likes.
        </CModalBody>
        <CModalFooter>
          <CButton color="secondary" onClick={() => setDeleteModal(false)}>
            Cancel
          </CButton>
          <CButton color="danger" onClick={handleDelete}>
            Delete
          </CButton>
        </CModalFooter>
      </CModal>
    </AdminLayout>
  )
}

export default index
