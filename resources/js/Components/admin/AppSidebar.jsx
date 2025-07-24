import React, { useState } from 'react'
import { usePage } from '@inertiajs/react'
import {
  CCloseButton,
  CSidebar,
  CSidebarBrand,
  CSidebarFooter,
  CSidebarHeader,
  CSidebarToggler,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'

import { AppSidebarNav } from './AppSidebarNav'

import { logo } from '../../assets/admin/brand/logo';
import { sygnet } from '../../assets/admin/brand/sygnet'

// sidebar nav config
import { getNavItems } from '../../constants/nav'

const AppSidebar = () => {
  const {
    auth: { user },
  } = usePage().props;
  const [sidebarShow, setSidebarShow] = useState(true)
  const [unfoldable, setUnfoldable] = useState(false)

  return (
    <CSidebar
      className="border-end"
      colorScheme="dark"
      position="fixed"
      unfoldable={unfoldable}
      visible={sidebarShow}
      onVisibleChange={(visible) => {
        setSidebarShow(visible)
      }}
    >
      <CSidebarHeader className="border-bottom">
        <CSidebarBrand href="/admin-dashboard">
          <CIcon customClassName="sidebar-brand-full" icon={logo} height={32} />
          <CIcon customClassName="sidebar-brand-narrow" icon={sygnet} height={32} />
        </CSidebarBrand>
        <CCloseButton
          className="d-lg-none"
          dark
          onClick={() => setSidebarShow(false)}
        />
      </CSidebarHeader>
      <AppSidebarNav items={getNavItems(user?.role)} />
      <CSidebarFooter className="border-top d-none d-lg-flex">
        <CSidebarToggler
          onClick={() => setUnfoldable(!unfoldable)}
        />
      </CSidebarFooter>
    </CSidebar>
  )
}

export default React.memo(AppSidebar)
