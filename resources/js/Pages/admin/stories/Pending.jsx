import { router } from '@inertiajs/react';

export default function Pending({ stories }) {
  const approveStory = (id) => {
    router.post(route('admin-dashboard.stories.approve', id));
  };

  const rejectStory = (id) => {
    router.post(route('admin-dashboard.stories.reject', id));
  };

  return (
    <div>
      <h1 className="text-2xl mb-4">Pending Stories</h1>
      {stories.data.length === 0 ? (
        <p>No pending stories.</p>
      ) : (
        stories.data.map((story) => (
          <div key={story.id} className="p-4 border mb-4">
            <h2 className="font-bold">{story.title}</h2>
            <p>{story.description}</p>
            <div className="mt-2">
              <button
                onClick={() => approveStory(story.id)}
                className="bg-green-500 text-white px-4 py-1 mr-2"
              >
                Approve
              </button>
              <button
                onClick={() => rejectStory(story.id)}
                className="bg-red-500 text-white px-4 py-1"
              >
                Reject
              </button>
            </div>
          </div>
        ))
      )}
    </div>
  );
}
