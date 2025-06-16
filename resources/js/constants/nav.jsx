import React from 'react'
import CIcon from '@coreui/icons-react'
import {
  cilBell,
  cilCalculator,
  cilChartPie,
  cilCursor,
  cilDescription,
  cilDrop,
  cilExternalLink,
  cilNotes,
  cilPencil,
  cilPuzzle,
  cilSpeedometer,
  cilStar,
} from '@coreui/icons'
import { CNavGroup, CNavItem, CNavTitle } from '@coreui/react'
import { Link, usePage } from '@inertiajs/react';



 
const InertiaNavItem = ({ name, to, icon }) => (
  
  <CNavItem component={Link} to={to}>
    {icon}
    {name}
  </CNavItem>
)

const adminNav = [
  
  {
    component: CNavGroup,
    name: 'Dashboard',
    to: '/admin-dashboard',
    icon: <CIcon icon={cilSpeedometer} customClassName="nav-icon" />,
  },

  {
    component: CNavGroup,
    name: 'Users',
    to: '/admin-dashboard/users',
    icon: <CIcon icon={cilCursor} customClassName="nav-icon" />,
    items: [
      {
        component: InertiaNavItem,
        name: 'List',
        to: '/admin-dashboard/users',
      },
    ],
  },
  {
    component: CNavGroup,
    name: 'Stories',
    to: '/admin-dashboard/stories',
    icon: <CIcon icon={cilCursor} customClassName="nav-icon" />,
    items: [
      {
        component: CNavItem,
        name: 'List',
        to: '/admin-dashboard/stories',
      },
      {
        component: CNavItem,
        name: 'Create',
        to: '/admin-dashboard/stories/create',
      },
      {
        component: CNavItem,
        name: 'Community',
        to: '/admin-dashboard/community/stories',
      },
    ],
  },
]

const userNav = [
  {
    component: CNavItem,
    name: 'User Dashboard',
    to: '/dashboard',
    icon: <CIcon icon={cilSpeedometer} customClassName="nav-icon" />,
  },

  {
    component: CNavGroup,
    name: 'Stories',
    to: '/user-dashboard/stories',
    icon: <CIcon icon={cilCursor} customClassName="nav-icon" />,
    items: [
      {
        component: InertiaNavItem,
        name: 'List',
        to: '/user-dashboard/stories',
      },
    ],
  },

]

export const getNavItems = (role) => {
  return role === 'admin' ? adminNav : userNav
}

