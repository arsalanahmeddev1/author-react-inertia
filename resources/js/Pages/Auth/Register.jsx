import CustomInputError from '@/Components/CustomInputError';
import CustomInputLabel from '@/Components/CustomInputLabel';
import CustomButton from '@/Components/CustomButton';
import CustomTextInput from '@/Components/CustomTextInput';
import CustomAuthLayout from '@/Layouts/CustomAuthLayout';
import { Head, Link, useForm } from '@inertiajs/react';

export default function Register() {
    const { data, setData, post, processing, errors, reset } = useForm({
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
    });

    const submit = (e) => {
        e.preventDefault();

        post(route('register'), {
            onFinish: () => reset('password', 'password_confirmation'),
        });
    };

    return (
        <CustomAuthLayout title="Create Your">
            <Head title="Register" />

            <form onSubmit={submit} className="auth-form">
                <div className="mb-3">
                    <CustomInputLabel htmlFor="name" value="Full Name" />

                    <CustomTextInput
                        id="name"
                        name="name"
                        value={data.name}
                        className="form-control mb-2"
                        autoComplete="name"
                        isFocused={true}
                        onChange={(e) => setData('name', e.target.value)}
                        required
                    />

                    <CustomInputError message={errors.name} />
                </div>

                <div className="mb-3">
                    <CustomInputLabel htmlFor="email" value="Email Address" />

                    <CustomTextInput
                        id="email"
                        type="email"
                        name="email"
                        value={data.email}
                        className="form-control mb-2"
                        autoComplete="username"
                        onChange={(e) => setData('email', e.target.value)}
                        required
                    />

                    <CustomInputError message={errors.email} />
                </div>

                <div className="mb-3">
                    <CustomInputLabel htmlFor="password" value="Password" />

                    <CustomTextInput
                        id="password"
                        type="password"
                        name="password"
                        value={data.password}
                        className="form-control mb-2"
                        autoComplete="new-password"
                        onChange={(e) => setData('password', e.target.value)}
                        required
                    />

                    <CustomInputError message={errors.password} />
                </div>

                <div className="mb-4">
                    <CustomInputLabel
                        htmlFor="password_confirmation"
                        value="Confirm Password"
                    />

                    <CustomTextInput
                        id="password_confirmation"
                        type="password"
                        name="password_confirmation"
                        value={data.password_confirmation}
                        className="form-control mb-2"
                        autoComplete="new-password"
                        onChange={(e) =>
                            setData('password_confirmation', e.target.value)
                        }
                        required
                    />

                    <CustomInputError message={errors.password_confirmation} />
                </div>

                <div className="d-grid gap-2 mb-4">
                    <CustomButton
                        className="btn-lg"
                        disabled={processing}
                    >
                        Create Account
                    </CustomButton>
                </div>

                <div className="text-center">
                    <p className="fs-16 mb-0 secondry-font">
                        Already have an account?
                        <Link href={route('login')} className="text-primary-theme ms-2 fw-bold">
                            Sign In
                        </Link>
                    </p>
                </div>
            </form>
        </CustomAuthLayout>
    );
}
