import React from 'react';
// import { Helmet } from 'react-helmet-async';
import Header from '../Components/dashboard/dashboard-new/Header';
import Sidebar from '../Components/dashboard/dashboard-new/Sidebar';
import Footer from '../Components/dashboard/dashboard-new/Footer';

const DashboardLayoutNew = ({ title, description, children }) => {
    return (
        <>
            <div class="page-wrapper compact-wrapper" id="pageWrapper">

                <Header />
                <div class="page-body-wrapper">
                    <Sidebar />
                    <div className="page-body">
                        {children}
                    </div>
                    <Footer />
                </div>
            </div>
        </>
    );
};

export default DashboardLayoutNew;
