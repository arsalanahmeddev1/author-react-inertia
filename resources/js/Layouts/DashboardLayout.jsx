import React from 'react'
import '../assets/admin/scss/style.scss';
import { AppSidebar, AppFooter, AppHeader } from '../Components/admin/index'

import { CContainer } from '@coreui/react';

const DefaultLayout = ({ children }) => {
  return (
    <div>
      <AppSidebar />
      <div className="wrapper d-flex flex-column min-vh-100">
        <AppHeader />
        <div className="body flex-grow-1">
          <CContainer style={{ padding: '16px' }} className="" fluid>
            {children}
          </CContainer>
        </div>
        <AppFooter />
      </div>
    </div>
  )
}

export default DefaultLayout
