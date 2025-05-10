<?php

// Define the image URLs and their local paths
$images = [
    'https://via.placeholder.com/800x600/C67C19/FFFFFF?text=Start+Your+Story' => 'public/assets/images/publish-1-begin-story.png',
    'https://via.placeholder.com/800x600/C67C19/FFFFFF?text=Collaborate+With+Artists' => 'public/assets/images/publish-2-collaborate.png',
    'https://via.placeholder.com/800x600/C67C19/FFFFFF?text=Build+Your+Audience' => 'public/assets/images/publish-3-build-audience.png',
    'https://via.placeholder.com/800x600/C67C19/FFFFFF?text=Engage+Your+Super+Fans' => 'public/assets/images/publish-4-engage-fans.png',
    'https://via.placeholder.com/800x600/C67C19/FFFFFF?text=Maximize+Your+Earnings' => 'public/assets/images/publish-5-maximize-earnings.png',
];

// Download each image
foreach ($images as $url => $path) {
    $imageContent = file_get_contents($url);
    if ($imageContent !== false) {
        file_put_contents($path, $imageContent);
        echo "Downloaded: $path\n";
    } else {
        echo "Failed to download: $url\n";
    }
}

echo "All images downloaded successfully!\n";
