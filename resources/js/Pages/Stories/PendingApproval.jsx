import React from 'react'
import { Head, Link, router } from '@inertiajs/react';
import InnerLayout from '@/Layouts/InnerLayout';
import { CRow, CCol, CCard, CCardBody, CBadge, CCardTitle, CCardText } from '@coreui/react';
import '@/assets/styles/stories.css';

const PendingApproval = ({ pendingStories }) => {
  return (
    <InnerLayout>
      <Head title="Pending Approval Stories" />
      <section className="py-100">
        <div className="container">
          <h1 style={{ color: 'var(--primary-theme, #C67C19)', marginBottom: '40px' }}>Stories Pending Approval</h1>
          
          {pendingStories && pendingStories.length > 0 ? (
            <CRow className="row-gap-40">
              {pendingStories.map(story => (
                <CCol key={story.id} sm={6} lg={4}>
                  <CCard className="h-100 story-card-professional">
                    <img
                      src={story.cover_image ? `/storage/${story.cover_image}` : '/assets/images/default-cover.jpg'}
                      className="card-img-top object-cover"
                      alt={story.title}
                      style={{ height: '200px' }}
                    />
                    <CCardBody className="d-flex flex-column justify-content-between">
                      <div>
                        <CCardTitle>{story.title}</CCardTitle>
                        <CCardText className="text-muted mb-2">By {story.author}</CCardText>
                        <CBadge
                          shape="rounded-pill"
                          style={{
                            backgroundColor: 'var(--secondry-theme, #74989E)',
                            color: '#fff',
                            padding: '5px 10px',
                            fontSize: '0.8em'
                          }}
                        >
                          Pending Approval
                        </CBadge>
                      </div>
                      <Link href={route('admin.stories.show', story.id)} className="btn btn-primary mt-3 align-self-start" style={{ backgroundColor: 'var(--primary-theme, #C67C19)', borderColor: 'var(--primary-theme, #C67C19)' }}>
                        View Details
                      </Link>
                    </CCardBody>
                  </CCard>
                </CCol>
              ))}
            </CRow>
          ) : (
            <div className="text-center py-5">
              <p className="lead">No stories pending approval at this time.</p>
            </div>
          )}
        </div>
      </section>
    </InnerLayout>
  );
};

export default PendingApproval;
