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
import { Link } from '@inertiajs/react'
const InertiaNavItem = ({ name, to, icon }) => (
  <CNavItem component={Link} to={to}>
    {icon}
    {name}
  </CNavItem>
)
const nav = [
  {
    component: CNavGroup,
    name: 'Dashboard',
    to: '/admin',
    icon: <CIcon icon={cilSpeedometer} customClassName="nav-icon" />,
  },

  {
    component: CNavGroup,
    name: 'Users',
    to: '/admin/users',
    icon: <CIcon icon={cilCursor} customClassName="nav-icon" />,
    items: [
      {
        component: InertiaNavItem,
        name: 'List',
        to: '/admin/users',
      },
    ],
  },
  {
    component: CNavGroup,
    name: 'Stories',
    to: '/admin/stories',
    icon: <CIcon icon={cilCursor} customClassName="nav-icon" />,
    items: [
      {
        component: CNavItem,
        name: 'List',
        to: '/admin/stories',
      },
      {
        component: CNavItem,
        name: 'Create',
        to: '/admin/stories/create',
      },
      {
        component: CNavItem,
        name: 'Community',
        to: '/admin/community/stories',
      },
    ],
  },
]

export default nav
