import React from 'react'
import { AppSidebar, AppFooter, AppHeader } from '../components/admin/index'
import '../assets/admin/scss/style.scss'

const AdminLayout = ({ children }) => {
  return (
    <div>
      <AppSidebar />
      <div className="wrapper d-flex flex-column min-vh-100">
        <AppHeader />
        <div className="body flex-grow-1 px-4 py-3">
          <div className="container-fluid">
            {children}
          </div>
        </div>
        <AppFooter />
      </div>
    </div>
  )
}

export default AdminLayout
