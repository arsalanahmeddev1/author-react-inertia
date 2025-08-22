import React, { useState } from "react";
import { Head, useForm, Link } from "@inertiajs/react";
import DashboardLayout from "../../../Layouts/DashboardLayout";
import { Icons } from "../../../utils/icons";
import {
    CButton,
    CCard,
    CCardBody,
    CCardHeader,
    CCol,
    CForm,
    CFormInput,
    CFormLabel,
    CFormTextarea,
    CRow,
    CFormSelect,
    CAlert,
    CInputGroup,
    CInputGroupText,
    CBadge,
} from "@coreui/react";

const Create = () => {
    const { data, setData, post, processing, errors } = useForm({
        name: "",
        price: "",
        features: [""],
        stripe_price_id: "",
        is_active: "1",
    });

    const [successMessage, setSuccessMessage] = useState("");
    const [validationErrors, setValidationErrors] = useState({});

    const addFeature = () => {
        setData("features", [...data.features, ""]);
    };

    const removeFeature = (index) => {
        const newFeatures = data.features.filter((_, i) => i !== index);
        setData("features", newFeatures);
    };

    const updateFeature = (index, value) => {
        const newFeatures = [...data.features];
        newFeatures[index] = value;
        setData("features", newFeatures);
    };

    // Clear validation errors when data changes
    React.useEffect(() => {
        if (Object.keys(errors).length > 0) {
            setValidationErrors(errors);
        }
    }, [errors]);

    const validateForm = () => {
        const newErrors = {};

        if (!data.name || data.name.trim() === "") {
            newErrors.name = "Package name is required";
        }

        if (!data.price || isNaN(data.price) || data.price < 0) {
            newErrors.price = "Valid price is required";
        }

        if (
            data.features &&
            Array.isArray(data.features) &&
            data.features.filter((f) => f && f.trim()).length === 0
        ) {
            newErrors.features = "At least one feature is required";
        }

        if (!data.stripe_price_id || data.stripe_price_id.trim() === "") {
            newErrors.stripe_price_id = "Stripe Price ID is required";
        }

        setValidationErrors(newErrors);
        return Object.keys(newErrors).length === 0;
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        // Validate form before submission
        if (!validateForm()) {
            return;
        }

        // Filter out empty features
        const featuresArray = data.features.filter((f) => f && f.trim());

        // Update the form data with filtered features and other formatted data
        setData("features", featuresArray);
        setData("name", data.name.trim());
        setData("is_active", data.is_active === "1");

        // Use setTimeout to ensure state updates are processed before submission
        setTimeout(() => {
            post(route("admin-dashboard.publish-packages.store"), {
                preserveScroll: true,
                onSuccess: () => {
                    setSuccessMessage("Publish Package created successfully!");
                    setValidationErrors({});
                    // Reset form after successful creation
                    setData({
                        name: "",
                        price: "",
                        features: [""],
                        stripe_price_id: "",
                        is_active: "1",
                    });
                    setTimeout(() => setSuccessMessage(""), 3000);
                },
                onError: (errors) => {
                    console.error("Creation failed:", errors);
                    setValidationErrors(errors);
                },
            });
        }, 100); // Small delay to ensure state updates are processed
    };

    const statusOptions = [
        { value: "1", label: "Active" },
        { value: "0", label: "Inactive" },
    ];

    return (
        <DashboardLayout>
            <Head title="Create Publish Package" />
            <CRow>
                <CCol xs={12}>
                    <CCard className="mb-4">
                        <CCardHeader className="d-flex justify-content-between align-items-center">
                            <div className="d-flex align-items-center">
                                <Link
                                    href={route(
                                        "admin-dashboard.publish-packages.index",
                                    )}
                                >
                                    <CButton
                                        color="primary"
                                        size="sm"
                                        variant="outline"
                                        className="me-2"
                                    >
                                        <Icons.ArrowLeft />
                                    </CButton>
                                </Link>
                                <strong>Create New Publish Package</strong>
                            </div>
                        </CCardHeader>
                        <CCardBody>
                            {successMessage && (
                                <CAlert color="success" dismissible>
                                    {successMessage}
                                </CAlert>
                            )}

                            <CForm onSubmit={handleSubmit}>
                                <CRow className="mb-3">
                                    <CCol md={6}>
                                        <CFormLabel htmlFor="name">
                                            Package Name *
                                        </CFormLabel>
                                        <CFormInput
                                            id="name"
                                            value={data.name}
                                            onChange={(e) =>
                                                setData("name", e.target.value)
                                            }
                                            invalid={
                                                !!errors.name ||
                                                !!validationErrors.name
                                            }
                                            placeholder="Enter package name"
                                        />
                                        {(errors.name ||
                                            validationErrors.name) && (
                                            <div className="text-danger">
                                                {errors.name ||
                                                    validationErrors.name}
                                            </div>
                                        )}
                                    </CCol>

                                    <CCol md={6}>
                                        <CFormLabel htmlFor="price">
                                            Price ($)
                                        </CFormLabel>
                                        <CInputGroup>
                                            <CInputGroupText>$</CInputGroupText>
                                            <CFormInput
                                                id="price"
                                                type="number"
                                                value={data.price}
                                                onChange={(e) => {
                                                    // typing ke waqt raw value save kar do
                                                    setData(
                                                        "price",
                                                        e.target.value,
                                                    );
                                                }}
                                                onBlur={(e) => {
                                                    // jab user field se bahar nikle tabhi format karo
                                                    if (e.target.value !== "") {
                                                        setData(
                                                            "price",
                                                            parseFloat(
                                                                e.target.value,
                                                            ).toFixed(2),
                                                        );
                                                    }
                                                }}
                                                invalid={
                                                    !!errors.price ||
                                                    !!validationErrors.price
                                                }
                                                placeholder="10.30 for $10.30"
                                                min="0"
                                                step="0.01"
                                            />
                                        </CInputGroup>
                                        <small className="text-muted">
                                            Enter price in dollars (e.g., 10.30
                                            for $10.30). Leave empty for free
                                            packages.
                                        </small>
                                        {(errors.price ||
                                            validationErrors.price) && (
                                            <div className="text-danger">
                                                {errors.price ||
                                                    validationErrors.price}
                                            </div>
                                        )}
                                    </CCol>
                                </CRow>

                                <CRow className="mb-3">
                                    <CCol md={6}>
                                        <CFormLabel htmlFor="is_active">
                                            Status
                                        </CFormLabel>
                                        <CFormSelect
                                            id="is_active"
                                            value={data.is_active}
                                            onChange={(e) =>
                                                setData(
                                                    "is_active",
                                                    e.target.value,
                                                )
                                            }
                                            invalid={
                                                !!errors.is_active ||
                                                !!validationErrors.is_active
                                            }
                                            options={statusOptions}
                                        />
                                        <small className="text-muted">
                                            Set package as active or inactive
                                        </small>
                                        {(errors.is_active ||
                                            validationErrors.is_active) && (
                                            <div className="text-danger">
                                                {errors.is_active ||
                                                    validationErrors.is_active}
                                            </div>
                                        )}
                                    </CCol>

                                    <CCol md={6}>
                                        <CFormLabel htmlFor="stripe_price_id">
                                            Stripe Price ID
                                        </CFormLabel>
                                        <CFormInput
                                            id="stripe_price_id"
                                            value={data.stripe_price_id}
                                            onChange={(e) =>
                                                setData(
                                                    "stripe_price_id",
                                                    e.target.value,
                                                )
                                            }
                                            invalid={
                                                !!errors.stripe_price_id ||
                                                !!validationErrors.stripe_price_id
                                            }
                                            placeholder="Enter Stripe price ID"
                                        />
                                        <small className="text-muted">
                                            Enter the Stripe price ID if you
                                            have one, otherwise leave empty
                                        </small>
                                        {(errors.stripe_price_id ||
                                            validationErrors.stripe_price_id) && (
                                            <div className="text-danger">
                                                {errors.stripe_price_id ||
                                                    validationErrors.stripe_price_id}
                                            </div>
                                        )}
                                    </CCol>
                                </CRow>

                                <CRow className="mb-3">
                                    <CCol md={12}>
                                        <CFormLabel htmlFor="features">
                                            Features
                                        </CFormLabel>
                                        {data.features.map((feature, index) => (
                                            <div
                                                key={index}
                                                className="d-flex gap-2 mb-2"
                                            >
                                                <CFormInput
                                                    id={`feature-${index}`}
                                                    value={feature}
                                                    onChange={(e) =>
                                                        updateFeature(
                                                            index,
                                                            e.target.value,
                                                        )
                                                    }
                                                    placeholder={`Feature ${index + 1}`}
                                                    className="flex-grow-1"
                                                />
                                                {data.features.length > 1 && (
                                                    <CButton
                                                        color="danger"
                                                        size="sm"
                                                        variant="outline"
                                                        onClick={() =>
                                                            removeFeature(index)
                                                        }
                                                        type="button"
                                                    >
                                                        Remove
                                                    </CButton>
                                                )}
                                            </div>
                                        ))}
                                        <CButton
                                            color="success"
                                            size="sm"
                                            variant="outline"
                                            onClick={addFeature}
                                            type="button"
                                            className="mt-2"
                                        >
                                            + Add More Feature
                                        </CButton>
                                        <small className="text-muted d-block mt-2">
                                            Add features one by one. Each
                                            feature will be displayed as a
                                            bullet point.
                                        </small>
                                        {(errors.features ||
                                            validationErrors.features) && (
                                            <div className="text-danger">
                                                {errors.features ||
                                                    validationErrors.features}
                                            </div>
                                        )}
                                    </CCol>
                                </CRow>

                                <CRow>
                                    <CCol md={12} className="d-flex gap-2">
                                        <CButton
                                            type="submit"
                                            color="primary"
                                            disabled={processing}
                                            style={{
                                                backgroundColor: "#fea257",
                                                borderColor: "#fea257",
                                            }}
                                        >
                                            {processing
                                                ? "Creating..."
                                                : "Create Publish Package"}
                                        </CButton>
                                        <Link
                                            href={route(
                                                "admin-dashboard.publish-packages.index",
                                            )}
                                        >
                                            <CButton
                                                color="secondary"
                                                variant="outline"
                                            >
                                                Cancel
                                            </CButton>
                                        </Link>
                                    </CCol>
                                </CRow>
                            </CForm>
                        </CCardBody>
                    </CCard>
                </CCol>
            </CRow>
        </DashboardLayout>
    );
};

export default Create;
