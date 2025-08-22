<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PublishPackage;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PublishPackageController extends Controller
{
    public function index() {
        $publishPackages = PublishPackage::paginate(10);
        
        return Inertia::render('admin/publish-packages/Index', [
            'publishPackages' => $publishPackages,
            'flash' => [
                'success' => session('success'),
                'error' => session('error'),
            ],
        ]);
    }

    public function create() {
        return Inertia::render('admin/publish-packages/Create');
    }

    public function store(Request $request) {
        $data = $request->validate([
            'name' => 'required|string',
            'price' => 'required|numeric|decimal:2|min:0',
            'features' => 'nullable|array',
            'stripe_price_id' => 'required|string',
            'is_active' => 'boolean',
        ]);

        if (isset($data['features'])) {
            $data['features'] = is_array($data['features']) ? $data['features'] : [];
        } else {
            $data['features'] = [];
        }

        $data['is_active'] = $data['is_active'] ?? true;

        PublishPackage::create($data);
        return redirect()->route('admin-dashboard.publish-packages.index')
            ->with('success', 'Publish Package created successfully.');
    }

    public function show(PublishPackage $publishPackage) {
        return Inertia::render('admin/publish-packages/Show', [
            'publishPackage' => $publishPackage,
        ]);
    }

    public function edit(PublishPackage $publishPackage) {
        return Inertia::render('admin/publish-packages/Edit', [
            'publishPackage' => $publishPackage,
        ]);
    }

    public function update(Request $request, PublishPackage $publishPackage) {
        $data = $request->validate([
            'name' => 'required|string',
            'price' => 'required|numeric|decimal:2|min:0',
            'features' => 'nullable|array',
            'stripe_price_id' => 'required|string',
            'is_active' => 'boolean',
        ]);

        if (isset($data['features'])) {
            $data['features'] = is_array($data['features']) ? $data['features'] : [];
        } else {
            $data['features'] = [];
        }

        $data['is_active'] = $data['is_active'] ?? true;

        $publishPackage->update($data);
        return redirect()->route('admin-dashboard.publish-packages.index')
            ->with('success', 'Publish Package updated successfully.');
    }

    public function destroy(PublishPackage $publishPackage) {
        $publishPackage->delete();
        return redirect()->route('admin-dashboard.publish-packages.index')
            ->with('success', 'Publish Package deleted successfully.');
    }
}
