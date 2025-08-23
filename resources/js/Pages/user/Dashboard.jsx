import React from 'react'
import DashboardLayout from '../../Layouts/DashboardLayout'
import { usePage } from '@inertiajs/react'
import { CCard, CCardBody, CRow, CCol } from '@coreui/react'
import { Icons } from '../../utils/icons'

const UserDashboard = () => {
  const {user, metrics} = usePage().props;
  // const { user, metrics } = usePage().props

  return (
    <DashboardLayout>
      <div className="row">
        <div className="col-md-4 col-lg-3">
          <div className='dashboard-card-wrapper d-flex align-items-center gap-2'>
            <div>
              <div className="dcw-icon">
                <Icons.Book />
              </div>
            </div>
            <div>
              <h4 id="traffic" className="card-title mb-0 fw-medium">
                Written Stories
              </h4>
              <div className="small text-body-secondary">{metrics?.totalStories || 0}</div>
            </div>
          </div>
        </div>
        <div className="col-md-4 col-lg-3">
          <div className='dashboard-card-wrapper d-flex align-items-center gap-2'>
            <div>
              <div className="dcw-icon">
                <Icons.AutoStories />
              </div>
            </div>
            <div>
              <h4 id="traffic" className="card-title mb-0 fw-medium">
                Stories published
              </h4>
              <div className="small text-body-secondary">{metrics?.publishedStories || 0}</div>
            </div>
          </div>
        </div>
        <div className="col-md-4 col-lg-3">
          <div className='dashboard-card-wrapper d-flex align-items-center gap-2'>
            <div>
              <div className="dcw-icon">
                <Icons.Readme />
              </div>
            </div>
            <div>
              <h4 id="traffic" className="card-title mb-0 fw-medium">
                Total reads
              </h4>
              <div className="small text-body-secondary">{metrics?.totalReads || 0}</div>
            </div>
          </div>
        </div>
        <div className="col-md-4 col-lg-3">
          <div className='dashboard-card-wrapper d-flex align-items-center gap-2'>
            <div>
              <div className="dcw-icon">
                <Icons.Payment />
              </div>
            </div>
            <div>
              <h4 id="traffic" className="card-title mb-0 fw-medium">
                Subscription status
              </h4>
              <div className="small text-body-secondary">Active</div>
            </div>
          </div>
        </div>
      </div>

      {/* Add more sections: recent stories, profile links, etc. */}
    </DashboardLayout>
  )
}

export default UserDashboard
