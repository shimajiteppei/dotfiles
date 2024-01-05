#!/usr/bin/env sh

# Make ibus-mozc remember the last used mode (e.g. hiragana) and not switch back to Alphabet on restart
# See https://github.com/google/mozc/issues/381
set -e

# sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
# sudo sed -i -e "s/# deb-src/deb-src/" /etc/apt/sources.list
# sudo apt update

cd $(mktemp -d)
apt source ibus-mozc
cd mozc-*/

patch src/unix/ibus/property_handler.cc << 'EOF'
--- src/unix/ibus/property_handler.cc.orig	2020-10-28 17:21:18.000849932 +0900
+++ src/unix/ibus/property_handler.cc	2020-10-28 17:21:34.172696046 +0900
@@ -80,7 +80,7 @@
 // On IBus 1.4.x, IBus expects that an IME should always be turned on and
 // IME on/off keys are handled by IBus itself rather than each IME.
 #if IBUS_CHECK_VERSION(1, 5, 0)
-const bool kActivatedOnLaunch = false;
+const bool kActivatedOnLaunch = true;
 #else
 const bool kActivatedOnLaunch = true;
 #endif  // IBus>=1.5.0
EOF

sudo apt build-dep ibus-mozc
dpkg-buildpackage -us -uc -b
sudo dpkg -i ../ibus-mozc_*.deb

# sudo mv /etc/apt/sources.list.bak /etc/apt/sources.list
# sudo apt update
