import React from 'react'
import { Head, Link, router } from '@inertiajs/react'
import DashboardLayout from '../../../Layouts/DashboardLayout'
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
import { Icons } from '../../../utils/icons'
import { format } from 'date-fns'

const Show = ({ package: pkg }) => {
  const formatDate = (dateString) => {
    if (!dateString) return 'N/A'
    try {
      return format(new Date(dateString), 'MMM d, yyyy h:mm a')
    } catch (e) {
      return dateString
    }
  }

  const formatFeatures = (features) => {
    if (!features || !Array.isArray(features) || features.length === 0) {
      return <span className="text-muted">No features</span>;
    }
    
    return (
      <div className="features-list">
        {features.map((feature, index) => (
          <CBadge 
            key={index} 
            color="info" 
            className="me-1 mb-1"
            style={{ fontSize: '0.75rem' }}
          >
            {feature}
          </CBadge>
        ))}
      </div>
    );
  };

  const handleDelete = () => {
    if (confirm(`Are you sure you want to delete "${pkg.name}"? This action cannot be undone.`)) {
      router.delete(route('admin-dashboard.packages.destroy', pkg.id), {
        onSuccess: () => router.visit(route('admin-dashboard.packages.index')),
      })
    }
  }

  return (
    <DashboardLayout>
      <Head title={`Package: ${pkg.name}`} />
      <CRow>
        <CCol xs={12}>
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <div className="d-flex align-items-center">
                <Link href={route('admin-dashboard.packages.index')}>
                  <CButton color="primary" size="sm" variant="outline" className="me-2">
                    <Icons.ArrowLeft />
                  </CButton>
                </Link>
                <strong>Package Details</strong>
              </div>
              <CTooltip content="Delete Package">
                <CButton color="danger" size="sm" onClick={handleDelete}>
                  <Icons.Delete className="me-1" /> Delete Package
                </CButton>
              </CTooltip>
            </CCardHeader>
            <CCardBody>
              <div className="mb-4">
                <h2 className="mb-1">{pkg.name}</h2>
                <div className="text-medium-emphasis mb-3">
                  {pkg.price_cents !== null ? `$${(pkg.price_cents / 100).toFixed(2)}` : 'Free'} • {pkg.interval || 'N/A'} • Created {formatDate(pkg.created_at)}
                </div>
                <CBadge color={pkg.is_active ? 'success' : 'secondary'} className="mb-3">
                  {pkg.is_active ? 'Active Package' : 'Inactive Package'}
                </CBadge>
                <div className="d-flex gap-3 mb-4">
                  <div className="text-center">
                    <div className="fs-4 fw-bold">{pkg.price_cents !== null ? `$${(pkg.price_cents / 100).toFixed(2)}` : 'Free'}</div>
                    <div className="text-medium-emphasis">Price</div>
                  </div>
                  <div className="text-center">
                    <div className="fs-4 fw-bold">{pkg.interval || 'N/A'}</div>
                    <div className="text-medium-emphasis">Interval</div>
                  </div>
                  <div className="text-center">
                    <div className="fs-4 fw-bold">{Array.isArray(pkg.features) ? pkg.features.length : 0}</div>
                    <div className="text-medium-emphasis">Features</div>
                  </div>
                </div>
              </div>

              <div className="row">
                <div className="col-md-6 mb-4">
                  <h4>Package Information</h4>
                  <div className="border rounded p-3 bg-light">
                    <div className="mb-3">
                      <strong>Name:</strong>
                      <p className="mb-0">{pkg.name || 'N/A'}</p>
                    </div>
                    <div className="mb-3">
                      <strong>Price:</strong>
                      <p className="mb-0">
                        {pkg.price_cents !== null
                          ? `$${(pkg.price_cents / 100).toFixed(2)}`
                          : 'Free'}
                      </p>
                    </div>
                    <div className="mb-3">
                      <strong>Interval:</strong>
                      <p className="mb-0">{pkg.interval || 'N/A'}</p>
                    </div>
                    <div className="mb-3">
                      <strong>Status:</strong>
                      <p className="mb-0">
                        {pkg.is_active ? (
                          <CBadge color="success">Active</CBadge>
                        ) : (
                          <CBadge color="secondary">Inactive</CBadge>
                        )}
                      </p>
                    </div>
                    <div className="mb-3">
                      <strong>Stripe Price ID:</strong>
                      <p className="mb-0">
                        <code>{pkg.stripe_price_id || 'N/A'}</code>
                      </p>
                    </div>
                  </div>
                </div>

                <div className="col-md-6 mb-4">
                  <h4>Features</h4>
                  <div className="border rounded p-3 bg-light">
                    {formatFeatures(pkg.features)}
                  </div>
                </div>
              </div>

              <div className="row">
                <div className="col-12">
                  <h4>Package Details</h4>
                  <div className="border rounded p-3 bg-light">
                    <div className="row">
                      <div className="col-md-6">
                        <strong>Created At:</strong>
                        <p className="mb-2">{formatDate(pkg.created_at)}</p>
                      </div>
                      <div className="col-md-6">
                        <strong>Updated At:</strong>
                        <p className="mb-2">{formatDate(pkg.updated_at)}</p>
                      </div>
                    </div>
                    <div className="row">
                      <div className="col-md-6">
                        <strong>Package ID:</strong>
                        <p className="mb-2">{pkg.id}</p>
                      </div>
                      <div className="col-md-6">
                        <strong>Active Status:</strong>
                        <p className="mb-2">
                          {pkg.is_active ? (
                            <CBadge color="success">Active</CBadge>
                          ) : (
                            <CBadge color="secondary">Inactive</CBadge>
                          )}
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </DashboardLayout>
  )
}

export default Show
