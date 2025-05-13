import React from 'react'
import { Head, Link, router } from '@inertiajs/react'
import AdminLayout from '../../../Layouts/AdminLayout'
import {
  CButton,
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CRow,
  CTooltip,
  CBadge,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import { cilArrowLeft, cilTrash } from '@coreui/icons'
import { format } from 'date-fns'

const Show = ({ story }) => {
  const formatDate = (dateString) => {
    if (!dateString) return 'N/A'
    try {
      return format(new Date(dateString), 'MMM d, yyyy h:mm a')
    } catch (e) {
      return dateString
    }
  }

  const handleDelete = () => {
    if (confirm(`Are you sure you want to delete "${story.title}"? This action cannot be undone.`)) {
      router.delete(route('admin.stories.destroy', story.id), {
        onSuccess: () => router.visit(route('admin.stories.index')),
      })
    }
  }

  return (
    <AdminLayout>
      <Head title={`Story: ${story.title}`} />
      <CRow>
        <CCol xs={12}>
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <div className="d-flex align-items-center">
                <Link href={route('admin.stories.index')}>
                  <CButton color="primary" size="sm" variant="outline" className="me-2">
                    <CIcon icon={cilArrowLeft} />
                  </CButton>
                </Link>
                <strong>Story Details</strong>
              </div>
              <CTooltip content="Delete Story">
                <CButton color="danger" size="sm" onClick={handleDelete}>
                  <CIcon icon={cilTrash} className="me-1" /> Delete Story
                </CButton>
              </CTooltip>
            </CCardHeader>
            <CCardBody>
              <div className="mb-4">
                <h2 className="mb-1">{story.title}</h2>
                <div className="text-medium-emphasis mb-3">
                  By {story.author} • {story.genre} • Created {formatDate(story.created_at)}
                </div>
                <CBadge color={story.is_community ? 'info' : 'success'} className="mb-3">
                  {story.is_community ? 'Community Story' : 'Standard Story'}
                </CBadge>
                <div className="d-flex gap-3 mb-4">
                  <div className="text-center">
                    <div className="fs-4 fw-bold">{story.read_count}</div>
                    <div className="text-medium-emphasis">Reads</div>
                  </div>
                  <div className="text-center">
                    <div className="fs-4 fw-bold">{story.likes_count}</div>
                    <div className="text-medium-emphasis">Likes</div>
                  </div>
                  <div className="text-center">
                    <div className="fs-4 fw-bold">{story.comment_count}</div>
                    <div className="text-medium-emphasis">Comments</div>
                  </div>
                </div>
              </div>

              <h4>Story Description</h4>
              <p className="mb-4">{story.description || 'No description available.'}</p>

              <h4>Story Content</h4>
              <div className="border rounded p-3 bg-light">
                <div style={{ maxHeight: '400px', overflow: 'auto' }}>
                  {story.content ? (
                    <div dangerouslySetInnerHTML={{ __html: story.content }} />
                  ) : (
                    <p className="text-muted">No content available.</p>
                  )}
                </div>
              </div>
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </AdminLayout>
  )
}

export default Show 