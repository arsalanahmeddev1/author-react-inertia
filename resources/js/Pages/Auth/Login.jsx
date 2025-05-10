import CustomCheckbox from '@/Components/CustomCheckbox';
import CustomInputError from '@/Components/CustomInputError';
import CustomInputLabel from '@/Components/CustomInputLabel';
import CustomButton from '@/Components/CustomButton';
import CustomTextInput from '@/Components/CustomTextInput';
import GoogleSignInButton from '@/Components/GoogleSignInButton';
import CustomAuthLayout from '@/Layouts/CustomAuthLayout';
import { Head, Link, useForm } from '@inertiajs/react';
// import route from 'ziggy-js';

export default function Login({ status, canResetPassword }) {
    const { data, setData, post, processing, errors, reset } = useForm({
        email: '',
        password: '',
        remember: false,
    });

    const submit = (e) => {
        e.preventDefault();

        post(route('login'), {
            onFinish: () => reset('password'),
        });
    };

    return (
        <CustomAuthLayout title="Login to Your">
            <Head title="Log in" />

            {status && (
                <div className="alert alert-success mb-4 fs-18">
                    {status}
                </div>
            )}

            <form onSubmit={submit} className="auth-form">
                <div className="mb-4">
                    <CustomInputLabel htmlFor="email" value="Email Address" />

                    <CustomTextInput
                        id="email"
                        type="email"
                        name="email"
                        value={data.email}
                        className="form-control mb-2"
                        autoComplete="username"
                        isFocused={true}
                        onChange={(e) => setData('email', e.target.value)}
                    />

                    <CustomInputError message={errors.email} />
                </div>

                <div className="mb-4">
                    <div className="d-flex justify-content-between align-items-center">
                        <CustomInputLabel htmlFor="password" value="Password" />

                        {canResetPassword && (
                            <Link
                                href={route('password.request')}
                                className="text-primary-theme fs-16"
                                style={{ fontFamily: 'var(--secondry-font)' }}
                            >
                                Forgot password?
                            </Link>
                        )}
                    </div>

                    <CustomTextInput
                        id="password"
                        type="password"
                        name="password"
                        value={data.password}
                        className="form-control mb-2"
                        autoComplete="current-password"
                        onChange={(e) => setData('password', e.target.value)}
                    />

                    <CustomInputError message={errors.password} />
                </div>

                <div className="mb-4">
                    <div className="d-flex align-items-center">
                        <CustomCheckbox
                            name="remember"
                            checked={data.remember}
                            onChange={(e) =>
                                setData('remember', e.target.checked)
                            }
                        />
                        <span className="ms-2 fs-16 secondry-font">
                            Remember me
                        </span>
                    </div>
                </div>

                <div className="d-grid gap-2 mb-4">
                    <CustomButton
                        disabled={processing}
                        className="btn-lg"
                    >
                        Log in
                    </CustomButton>
                </div>

                <div className="text-center">
                    <p className="fs-16 mb-0 secondry-font">
                        Don't have an account?
                        <Link href={route('register')} className="text-primary-theme ms-2 fw-bold">
                            Sign Up
                        </Link>
                    </p>
                </div>
                <div className="d-flex align-items-center my-3">
                    <hr className="flex-grow-1" />
                    <span className="px-3 fs-16 secondry-font text-muted">OR</span>
                    <hr className="flex-grow-1" />
                </div>
                <GoogleSignInButton href={route('google.redirect')} />
                {/* <a href="{{ route('facebook.redirect') }}">
                    <button type="button">Sign in with Facebook</button>
                </a> */}
            </form>
        </CustomAuthLayout>
    );
}
