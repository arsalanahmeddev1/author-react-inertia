import React, { useState, useEffect } from 'react'
import { Head, router, Link } from '@inertiajs/react'
import DashboardLayout from '../../../Layouts/DashboardLayout';
import { Icons } from '../../../utils/icons';
import Swal from 'sweetalert2';
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
  CBadge,
  CNav,
  CNavItem,
  CNavLink,
  CTabContent,
  CTabPane,
  CFormSelect,
} from '@coreui/react'

const Index = ({ communityStories, publishedStories, flash }) => {
  const [activeTab, setActiveTab] = useState('published');

  // Handle flash messages with SweetAlert
  useEffect(() => {
    if (flash?.success) {
      Swal.fire({
        icon: 'success',
        title: flash.success,
        showConfirmButton: false,
        timer: 1500,
        confirmButtonColor: '#C67C19',
        background: '#fff',
        customClass: {
          popup: 'swal2-custom-popup',
          title: 'swal2-custom-title',
          content: 'swal2-custom-content'
        }
      });
    }
  }, [flash?.success]);

  const confirmDelete = (story, type) => {
    Swal.fire({
      title: 'Confirm Delete',
      html: `Are you sure you want to delete the story: <strong>${story.title}</strong>?<br><br>This action cannot be undone and will remove all associated comments and likes.`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#6c757d',
      confirmButtonText: 'Delete Story',
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
        // Show loading state
        Swal.fire({
          title: 'Deleting story...',
          allowOutsideClick: false,
          didOpen: () => {
            Swal.showLoading();
          }
        });

        router.delete(route('user-dashboard.stories.destroy', story.id), {
          onSuccess: () => {
            Swal.fire({
              icon: 'success',
              title: 'Story deleted successfully!',
              showConfirmButton: false,
              timer: 1500,
              confirmButtonColor: '#C67C19',
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
              title: 'Error deleting story!',
              text: 'An unexpected error occurred.',
              confirmButtonColor: '#C67C19',
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

  const renderStoryTable = (stories, type) => {
    if (!stories || stories.data.length === 0) {
      return (
        <CTableRow>
          <CTableDataCell colSpan="7" className="text-center">
            No {type} stories found
          </CTableDataCell>
        </CTableRow>
      );
    }

    return stories.data.map((story) => (
      <CTableRow key={story.id}>
        <CTableDataCell>
          <div className="d-flex align-items-center">
            {story.cover_image ? (
              <img
                src={`/storage/${story.cover_image}`}
                alt={story.title}
                className="me-3"
                style={{ width: '50px', height: '50px', objectFit: 'cover', borderRadius: '8px' }}
                onError={(e) => {
                  e.target.src = '/assets/images/book-03.png';
                }}
              />
            ) : (
              <img
                src="/assets/images/book-03.png"
                alt="Default cover"
                className="me-3"
                style={{ width: '50px', height: '50px', objectFit: 'cover', borderRadius: '8px' }}
              />
            )}
            <div>
              <div className="fw-bold">{story.title || 'Untitled'}</div>
              <small className="text-muted">{story.genre || 'No genre'}</small>
            </div>
          </div>
        </CTableDataCell>
        <CTableDataCell>{story.author || 'Unknown'}</CTableDataCell>
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
            {/* <span className="text-muted">Reads: {story.read_count || 0}</span>
            <span className="text-muted">Likes: {story.likes_count || 0}</span>
            <span className="text-muted">Comments: {story.comment_count || 0}</span> */}
          </div>
        </CTableDataCell>
        <CTableDataCell>
          <CBadge color={story.status === 'approved' ? 'success' : story.status === 'pending' ? 'warning' : 'secondary'}>
            {story.status || 'Draft'}
          </CBadge>
        </CTableDataCell>
        {/* <CTableDataCell>
          <div className="d-flex gap-2">
            <CFormSelect
              size="sm"
              value={story.is_active ? "1" : "0"}
              onChange={(e) => {
                const newStatus = e.target.value === "1";
                router.put(`/user-dashboard/stories/${story.id}/toggle-status`, { 
                  is_active: newStatus 
                }, {
                  onSuccess: () => {
                    Swal.fire({
                      icon: 'success',
                      title: `Story ${newStatus ? 'activated' : 'deactivated'} successfully!`,
                      showConfirmButton: false,
                      timer: 1500,
                      confirmButtonColor: '#C67C19',
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
                      title: 'Error updating story status!',
                      text: 'An unexpected error occurred.',
                      confirmButtonColor: '#C67C19',
                      background: '#fff',
                      customClass: {
                        popup: 'swal2-custom-popup',
                        title: 'swal2-custom-title',
                        content: 'swal2-custom-content'
                      }
                    });
                  }
                });
              }}
              style={{ width: '120px' }}
            >
              <option value="1">Active</option>
              <option value="0">Inactive</option>
            </CFormSelect>
          </div>
        </CTableDataCell> */}
      </CTableRow>
    ));
  };

  const renderPagination = (stories, type) => {
    if (!stories || stories.last_page <= 1) return null;

    return (
      <CPagination align="center" className="mt-4">
        {stories.links.map((link, index) => (
          <CPaginationItem
            key={index}
            active={link.active}
            disabled={!link.url}
            onClick={() => {
              if (link.url) {
                const url = new URL(link.url);
                const page = url.searchParams.get('page');
                router.visit(route('user-dashboard.stories.index', { page, tab: type }));
              }
            }}
          >
            {link.label.replace('&laquo;', '«').replace('&raquo;', '»')}
          </CPaginationItem>
        ))}
      </CPagination>
    );
  };

  return (
    <DashboardLayout>
      <Head title="My Stories" />
      <CRow>
        <CCol xs={12}>
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <strong>My Stories</strong>
              {/* <Link href={route('user-dashboard.stories.create')}>
                <CButton className='custom-primary-btn' color="primary" size="sm" style={{ backgroundColor: '#fea257', borderColor: '#fea257' }}>
                  <Icons.Plus className="me-1" /> Create New Story
                </CButton>
              </Link> */}
            </CCardHeader>
            <CCardBody>
              <CNav variant="tabs" className="mb-4">
                <CNavItem>
                  <CNavLink
                    active={activeTab === 'published'}
                    onClick={() => setActiveTab('published')}
                    style={{ cursor: 'pointer' }}
                  >
                    Published Stories ({publishedStories?.total || 0})
                  </CNavLink>
                </CNavItem>
                <CNavItem>
                  <CNavLink
                    active={activeTab === 'community'}
                    onClick={() => setActiveTab('community')}
                    style={{ cursor: 'pointer' }}
                  >
                    Community Stories ({communityStories?.total || 0})
                  </CNavLink>
                </CNavItem>
              </CNav>

              <CTabContent>
                <CTabPane visible={activeTab === 'published'}>
                  <CTable hover responsive>
                    <CTableHead>
                      <CTableRow>
                        <CTableHeaderCell>Story</CTableHeaderCell>
                        <CTableHeaderCell>Author</CTableHeaderCell>
                        <CTableHeaderCell>Stats</CTableHeaderCell>
                        <CTableHeaderCell>Status</CTableHeaderCell>
                        {/* <CTableHeaderCell>Actions</CTableHeaderCell> */}
                      </CTableRow>
                    </CTableHead>
                    <CTableBody>
                      {renderStoryTable(publishedStories, 'published')}
                    </CTableBody>
                  </CTable>
                  {renderPagination(publishedStories, 'published')}
                </CTabPane>

                <CTabPane visible={activeTab === 'community'}>
                  <CTable hover responsive>
                    <CTableHead>
                      <CTableRow>
                        <CTableHeaderCell>Story</CTableHeaderCell>
                        <CTableHeaderCell>Author</CTableHeaderCell>
                        <CTableHeaderCell>Stats</CTableHeaderCell>
                        <CTableHeaderCell>Status</CTableHeaderCell>
                        {/* <CTableHeaderCell>Actions</CTableHeaderCell> */}
                      </CTableRow>
                    </CTableHead>
                    <CTableBody>
                      {renderStoryTable(communityStories, 'community')}
                    </CTableBody>
                  </CTable>
                  {renderPagination(communityStories, 'community')}
                </CTabPane>
              </CTabContent>
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </DashboardLayout>
  );
};

export default Index;
