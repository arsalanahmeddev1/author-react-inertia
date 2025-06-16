import React, { useState } from 'react'
import { Head, router } from '@inertiajs/react'
import DashboardLayout from '../../../Layouts/DashboardLayout';
import { Icons } from '../../../utils/icons';
import {
  CButton,
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CPagination,
  CPaginationItem,
  CRow,
  CTable,
  CTableBody,
  CTableDataCell,
  CTableHead,
  CTableHeaderCell,
  CTableRow,
  CTooltip,
  CModal,
  CModalHeader,
  CModalTitle,
  CModalBody,
  CModalFooter,
  CBadge,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
// import { cilTrash, cilEye } from '@coreui/icons'
// import { format } from 'date-fns'

const Index = ({ stories }) => {
  const [deleteModal, setDeleteModal] = useState(false)
  const [storyToDelete, setStoryToDelete] = useState(null)

  const confirmDelete = (story) => {
    setStoryToDelete(story)
    setDeleteModal(true)
  }

  const handleDelete = () => {
    if (storyToDelete) {
      router.delete(route('admin.stories.destroy', storyToDelete.id), {
        onSuccess: () => {
          setDeleteModal(false)
          setStoryToDelete(null)
        }
      })
    }
  }

  return (
    <DashboardLayout>
      <Head title="Story Management" />
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
                            <CBadge className="d-flex gap-2" color="primary" title="Reads">
                              <Icons.View /> {story.read_count}
                            </CBadge>
                            <CBadge className="d-flex gap-2" color="danger" title="Likes">
                              <Icons.Like /> {story.likes_count}
                            </CBadge>
                            <CBadge className="d-flex gap-2" color="dark" title="Comments">
                              <Icons.Comment /> {story.comment_count}
                            </CBadge>
                          </div>
                        </CTableDataCell>
                        <CTableDataCell>{story.created_at_formatted}</CTableDataCell>
                        <CTableDataCell>
                          <div className="d-flex gap-2">
                            {[
                              <CTooltip key="view" content="View Story">
                                <CButton
                                  color="info"
                                  size="sm"
                                  onClick={() => router.visit(route('admin.stories.show', story.id))}
                                >
                                  {/* <CIcon icon={cilEye} /> View */}
                                  <Icons.View />
                                </CButton>
                              </CTooltip>,
                              <CTooltip key="edit" content="Edit Story">
                                <CButton
                                  color="warning"
                                  size="sm"
                                  onClick={() => router.visit(route('admin.stories.edit', story.id))}
                                >
                                  <Icons.Edit />
                                </CButton>
                              </CTooltip>,
                              <CTooltip key="delete" content="Delete Story">
                                <CButton
                                  color="danger"
                                  size="sm"
                                  onClick={() => confirmDelete(story)}
                                >
                                  <Icons.Delete />
                                </CButton>
                              </CTooltip>,
                              story.is_community && story.status === 'pending' && (
                                <>
                                  <CTooltip key="approve" content="Approve Story">
                                    <CButton
                                      color="success"
                                      size="sm"
                                      onClick={() => router.post(route('admin.stories.approve', story.id))}
                                    >
                                      ✅
                                    </CButton>
                                  </CTooltip>
                                  <CTooltip key="reject" content="Reject Story">
                                    <CButton
                                      color="warning"
                                      size="sm"
                                      onClick={() => router.post(route('admin.stories.reject', story.id))}
                                    >
                                      ❌
                                    </CButton>
                                  </CTooltip>
                                </>
                              ),
                            ].filter(Boolean)}
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
    </DashboardLayout>
  )
}

export default Index