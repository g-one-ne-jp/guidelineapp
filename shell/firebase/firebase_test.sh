#!/bin/sh
echo "firebaseの書き換え debug"
cp ./shell/firebase/test/google-services.json ./android/app/
cp ./shell/firebase/test/GoogleService-Info.plist ./ios/Runner/
