import CustomCheckbox from '@/Components/CustomCheckbox';
import CustomInputError from '@/Components/CustomInputError';
import CustomInputLabel from '@/Components/CustomInputLabel';
import CustomButton from '@/Components/CustomButton';
import CustomTextInput from '@/Components/CustomTextInput';
import CustomAuthLayout from '@/Layouts/CustomAuthLayout';
import { Head, Link, useForm } from '@inertiajs/react';

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
                {/* <div class="mt-4">
                    <p class="text-center text-sm text-gray-600">Or continue with</p>
                    <div class="flex justify-center mt-2 space-x-4">
                        <Link href="{{ route('social.redirect', 'google') }}" class="inline-flex items-center px-4 py-2 bg-red-600 hover:bg-red-700 text-white text-sm font-medium rounded-md">
                            <svg class="w-5 h-5 mr-2" viewBox="0 0 488 512" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M488 261.8c0-17.8-1.6-35-4.6-51.6H249v97.8h134.4c-5.8 31.4-23.1 58-49.2 75.8v62h79.4c46.5-42.8 73.4-105.8 73.4-183.9z" />
                                <path d="M249 492c66.4 0 122.1-21.9 162.8-59.4l-79.4-62c-22.2 14.9-50.6 23.6-83.4 23.6-64.1 0-118.4-43.1-137.8-101.2H30.6v63.6C70.3 426.4 152.3 492 249 492z" />
                                <path d="M111.2 292.9c-4.8-14.4-7.6-29.7-7.6-45.4s2.8-31 7.6-45.4V138.5H30.6C11 174.5 0 215.2 0 256s11 81.5 30.6 117.5l80.6-63.6z" />
                                <path d="M249 100.4c35.9 0 68.2 12.4 93.6 36.8l70.2-70.2C370.9 28.3 314.5 0 249 0 152.3 0 70.3 65.6 30.6 138.5l80.6 63.6c19.4-58.1 73.7-101.2 137.8-101.2z" />
                            </svg>
                            Login with Google
                        </Link>
                        <Link href="{{ route('social.redirect', 'facebook') }}" class="inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium rounded-md">
                            <svg class="w-5 h-5 mr-2" viewBox="0 0 320 512" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M279.14 288l14.22-92.66h-88.91V127.89c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S293.3 0 262.36 0c-73.22 0-121.14 44.38-121.14 124.72v70.62H89.09V288h52.13v224h100.17V288z" />
                            </svg>
                            Login with Facebook
                        </Link>
                    </div>
                </div> */}
            </form>
        </CustomAuthLayout>
    );
}
