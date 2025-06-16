import React from 'react'
import DashboardLayout from '../../Layouts/DashboardLayout'
import { usePage } from '@inertiajs/react'
import { CCard, CCardBody, CRow, CCol } from '@coreui/react'

const UserDashboard = () => {
  
  // const { user, metrics } = usePage().props

  return (
    <DashboardLayout>
      <CCard className="mb-4">
        <CCardBody>
          
        </CCardBody>
      </CCard>

      {/* Add more sections: recent stories, profile links, etc. */}
    </DashboardLayout>
  )
}

export default UserDashboard
