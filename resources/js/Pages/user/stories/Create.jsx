import React from 'react'
import { Head, Link } from '@inertiajs/react'
import DashboardLayout from '../../../Layouts/DashboardLayout';
import { Icons } from '../../../utils/icons';

const Create = () => {
  return (
    <DashboardLayout>
      <Head title="Create Story" />
      <div className="container">
        <div className="row">
          <div className="col-12">
            <div className="card">
              <div className="card-header d-flex justify-content-between align-items-center">
                <div className="d-flex align-items-center">
                  <Link href={route('user-dashboard.stories.index')}>
                    <button className="btn btn-outline-primary me-2 arrow-redirect-btn">
                      <Icons.ArrowLeft />
                    </button>
                  </Link>
                  <strong>Create New Story</strong>
                </div>
              </div>
              <div className="card-body">
                <p>Story creation form will be implemented here.</p>
                <p>This component will allow users to create new stories.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </DashboardLayout>
  )
}

export default Create
