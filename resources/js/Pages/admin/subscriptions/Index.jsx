import React from 'react'
import { Head, Link, router } from '@inertiajs/react'
import DashboardLayout from '../../../Layouts/DashboardLayout'
import { Icons } from '../../../utils/icons'
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
  CBadge,
} from '@coreui/react'

const Index = ({ subscriptions, stats, filters }) => {
  const getStatusBadge = (status) => {
    const statusConfig = {
      'active': { color: 'success', text: 'Active' },
      'trialing': { color: 'info', text: 'Trial' },
      'past_due': { color: 'warning', text: 'Past Due' },
      'canceled': { color: 'danger', text: 'Canceled' },
      'incomplete': { color: 'secondary', text: 'Incomplete' },
      'incomplete_expired': { color: 'danger', text: 'Expired' },
      'unpaid': { color: 'danger', text: 'Unpaid' },
    }
    
    const config = statusConfig[status] || { color: 'secondary', text: status }
    return <CBadge color={config.color}>{config.text}</CBadge>
  }

  const getStatusFilterUrl = (status) => {
    const params = new URLSearchParams()
    if (status !== 'all') params.set('status', status)
    return `/admin-dashboard/subscriptions?${params.toString()}`
  }

  return (
    <DashboardLayout>
      <Head title="Subscription Management" />
      
      {/* Statistics Cards */}
      <div className="d-flex flex-wrap gap-3 mb-4">
        <div className="flex-grow-1">
          <CCard className="text-center" style={{ minWidth: '120px' }}>
            <CCardBody>
              <h4 className="text-primary">{stats.total}</h4>
              <small className="text-muted">Total Subscriptions</small>
            </CCardBody>
          </CCard>
        </div>
        <div className="flex-grow-1">
          <CCard className="text-center" style={{ minWidth: '120px' }}>
            <CCardBody>
              <h4 className="text-success">{stats.active}</h4>
              <small className="text-muted">Active</small>
            </CCardBody>
          </CCard>
        </div>
        <div className="flex-grow-1">
          <CCard className="text-center" style={{ minWidth: '120px' }}>
            <CCardBody>
              <h4 className="text-info">{stats.trialing}</h4>
              <small className="text-muted">Trial</small>
            </CCardBody>
          </CCard>
        </div>
        <div className="flex-grow-1">
          <CCard className="text-center" style={{ minWidth: '120px' }}>
            <CCardBody>
              <h4 className="text-warning">{stats.past_due}</h4>
              <small className="text-muted">Past Due</small>
            </CCardBody>
          </CCard>
        </div>
        <div className="flex-grow-1">
          <CCard className="text-center" style={{ minWidth: '120px' }}>
            <CCardBody>
              <h4 className="text-danger">{stats.expired}</h4>
              <small className="text-muted">Expired</small>
            </CCardBody>
          </CCard>
        </div>
        {/* <div className="flex-shrink-0">
          <CCard className="text-center" style={{ minWidth: '120px' }}>
            <CCardBody>
              <Link to={route('admin-dashboard.subscriptions.users.with')} className="text-decoration-none">
                <h4 className="text-primary">View Users</h4>
                <small className="text-muted">With Subscriptions</small>
              </Link>
            </CCardBody>
          </CCard>
        </div> */}
      </div>

      {/* Filter Buttons */}
      <CRow className="mb-3">
        <CCol xs={12}>
          <div className="d-flex gap-2 flex-wrap">
            <CButton 
              color={!filters.status || filters.status === 'all' ? 'primary' : 'outline-primary'}
              size="sm"
              onClick={() => router.visit(getStatusFilterUrl('all'))}
            >
              All
            </CButton>
            <CButton 
              color={filters.status === 'active' ? 'success' : 'outline-success'}
              size="sm"
              onClick={() => router.visit(getStatusFilterUrl('active'))}
            >
              Active
            </CButton>
            <CButton 
              color={filters.status === 'trialing' ? 'info' : 'outline-info'}
              size="sm"
              onClick={() => router.visit(getStatusFilterUrl('trialing'))}
            >
              Trial
            </CButton>
            <CButton 
              color={filters.status === 'past_due' ? 'warning' : 'outline-warning'}
              size="sm"
              onClick={() => router.visit(getStatusFilterUrl('past_due'))}
            >
              Past Due
            </CButton>
            <CButton 
              color={filters.status === 'expired' ? 'danger' : 'outline-danger'}
              size="sm"
              onClick={() => router.visit(getStatusFilterUrl('expired'))}
            >
              Expired
            </CButton>
          </div>
        </CCol>
      </CRow>

      {/* Subscriptions Table */}
      <CRow>
        <CCol xs={12}>
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <strong className="d-flex align-items-center">
                <Icons.Subscription className="me-2" /> Subscriptions
              </strong>
            </CCardHeader>
            <CCardBody>
              <CTable hover responsive>
                <CTableHead>
                  <CTableRow>
                    <CTableHeaderCell scope="col">ID</CTableHeaderCell>
                    <CTableHeaderCell scope="col">User</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Package</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Status</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Created</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Expires</CTableHeaderCell>
                    <CTableHeaderCell scope="col">Actions</CTableHeaderCell>
                  </CTableRow>
                </CTableHead>
                <CTableBody>
                  {subscriptions.data.length > 0 ? (
                    subscriptions.data.map((subscription) => (
                      <CTableRow key={subscription.id}>
                        <CTableHeaderCell scope="row">{subscription.id}</CTableHeaderCell>
                        <CTableDataCell>
                          <div>
                            <div className="fw-medium">{subscription.user?.name || 'N/A'}</div>
                            <small className="text-muted">{subscription.user?.email || 'N/A'}</small>
                          </div>
                        </CTableDataCell>
                        <CTableDataCell>
                          {subscription.package?.name || 'N/A'}
                        </CTableDataCell>
                        <CTableDataCell>
                          {getStatusBadge(subscription.stripe_status)}
                        </CTableDataCell>
                        <CTableDataCell>
                          {subscription.created_at ? new Date(subscription.created_at).toLocaleDateString() : 'N/A'}
                        </CTableDataCell>
                        <CTableDataCell>
                          {subscription.ends_at ? new Date(subscription.ends_at).toLocaleDateString() : 'N/A'}
                        </CTableDataCell>
                        <CTableDataCell>
                          <div className="d-flex align-items-center gap-2">
                            <CTooltip content="View Subscription">
                              <Link href={route('admin-dashboard.subscriptions.show', subscription.id)}>
                                <CButton 
                                  className="p-0 d-flex align-items-center justify-content-center"
                                  size="sm"
                                >
                                  <Icons.View />
                                </CButton>
                              </Link>
                            </CTooltip>
                            <CTooltip content="View User">
                              <Link href={route('admin-dashboard.users.show', subscription.user_id)}>
                                <CButton 
                                  className="p-0 d-flex align-items-center justify-content-center"
                                  size="sm"
                                >
                                  <Icons.Profile />
                                </CButton>
                              </Link>
                            </CTooltip>
                          </div>
                        </CTableDataCell>
                      </CTableRow>
                    ))
                  ) : (
                    <CTableRow>
                      <CTableDataCell colSpan="7" className="text-center">
                        No subscriptions found
                      </CTableDataCell>
                    </CTableRow>
                  )}
                </CTableBody>
              </CTable>

              {/* Pagination */}
              {subscriptions.data.length > 0 && (
                <CPagination align="center" className="mt-3">
                  {subscriptions.links.map((link, index) => (
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
    </DashboardLayout>
  )
}

export default Index
