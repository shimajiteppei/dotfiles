#!/usr/bin/env sh

# https://www.chromium.org/administrators/linux-quick-start/
# https://chromeenterprise.google/policies/
sudo mkdir -p /etc/opt/chrome/policies/managed
sudo tee /etc/opt/chrome/policies/managed/policy.json << 'EOF'
{
    "BookmarkBarEnabled": true,
    "IncognitoModeAvailability": 1,
    "BrowserGuestModeEnabled": false,
    "BrowserAddPersonEnabled": false,
    "SafeBrowsingProtectionLevel": 2
}
EOF
