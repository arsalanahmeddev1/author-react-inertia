import React from "react";

const Faqs = () => {
  return (
    <div className="container py-5">
      <h2 className="mb-4 text-center">Frequently Asked Questions</h2>

      <div className="accordion" id="faqAccordion">
        {/* FAQ 1 */}
        <div className="accordion-item">
          <h2 className="accordion-header" id="faqHeading1">
            <button
              className="accordion-button"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#faqCollapse1"
              aria-expanded="true"
              aria-controls="faqCollapse1"
            >
              What is Storie Vault?
            </button>
          </h2>
          <div
            id="faqCollapse1"
            className="accordion-collapse collapse show"
            aria-labelledby="faqHeading1"
            data-bs-parent="#faqAccordion"
          >
            <div className="accordion-body">
              Storie Vault is a platform where you can create, customize, and
              share your own stories with the community.
            </div>
          </div>
        </div>

        {/* FAQ 2 */}
        <div className="accordion-item">
          <h2 className="accordion-header" id="faqHeading2">
            <button
              className="accordion-button collapsed"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#faqCollapse2"
              aria-expanded="false"
              aria-controls="faqCollapse2"
            >
              Is it free to use?
            </button>
          </h2>
          <div
            id="faqCollapse2"
            className="accordion-collapse collapse"
            aria-labelledby="faqHeading2"
            data-bs-parent="#faqAccordion"
          >
            <div className="accordion-body">
              Yes, you can start for free. Premium features are also available
              if you want to expand.
            </div>
          </div>
        </div>

        {/* FAQ 3 */}
        <div className="accordion-item">
          <h2 className="accordion-header" id="faqHeading3">
            <button
              className="accordion-button collapsed"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#faqCollapse3"
              aria-expanded="false"
              aria-controls="faqCollapse3"
            >
              How can I publish my story?
            </button>
          </h2>
          <div
            id="faqCollapse3"
            className="accordion-collapse collapse"
            aria-labelledby="faqHeading3"
            data-bs-parent="#faqAccordion"
          >
            <div className="accordion-body">
              You can use our built-in editor, write your story, and publish it
              to your profile with one click.
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Faqs;
