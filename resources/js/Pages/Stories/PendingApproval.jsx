import React from 'react'
import { Head, Link, router } from '@inertiajs/react';
import InnerLayout from '@/Layouts/InnerLayout';

const PendingApproval = ({story}) => {
  return (
    <InnerLayout>
      <Head title="Pending Approval Stories" />
      <section className="py-100">
        <div className="container mx-auto">
          <div className="mt-16 px-4 text-center">
            <h1 className="text-[60px] font-bold mb-4 text-primary-theme">Story Under Review</h1>
            <p className="text-lg text-gray-700">
              Hi <span className="font-semibold">{story.author}</span>, your story titled
              <span className="font-semibold"> "{story.title}"</span> is currently under review.
              Once it is approved by our admin team, it will appear on the Community page.
            </p>
          </div>

        </div>
      </section>
    </InnerLayout>
  );
};

export default PendingApproval;
