#!/bin/bash
set -euo pipefail

if [ $# -eq 0 ]; then
  echo "Grab a thing from https://ftp.mozilla.org/pub/firefox/nightly/"
  exit 1
fi

cd $(mktemp -d)

wget "$1" -O - | tar -xj

sudo mkdir -p /opt/firefoxnightly/
sudo mv firefox /opt/firefoxnightly/

cat > nightly.desktop <<EOF
[Desktop Entry]
Version=1.0
Name=Firefox Nightly
GenericName=Web Browser
Comment=Browse the Web
Exec=/opt/firefoxnightly/firefox/firefox
Icon=/opt/firefoxnightly/firefox/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
StartupWMClass=Nightly
Categories=Network;WebBrowser;
Actions=ProfileManager;new-window;new-private-window;
Keywords=web;browser;internet;

[Desktop Action ProfileManager]
Name=Profile Manager
Exec=/opt/firefoxnightly/firefox/firefox --ProfileManager

[Desktop Action new-window]
Name=New Window
Exec=/opt/firefoxnightly/firefox/firefox --new-window

[Desktop Action new-private-window]
Name=New Private Window
Exec=/opt/firefoxnightly/firefox/firefox --private-window
EOF

sudo desktop-file-install --delete-original nightly.desktop
sudo update-desktop-database
