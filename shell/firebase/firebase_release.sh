#!/bin/sh
echo "firebaseの書き換え release"
cp ./shell/firebase/release/google-services.json ./android/app/
cp ./shell/firebase/release/GoogleService-Info.plist ./ios/Runner/
