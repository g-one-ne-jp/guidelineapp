#!/bin/sh
. ./shell/versions.properties

sh ./shell/firebase/firebase_release.sh

#リリースビルド
flutter build ipa --profile --export-options-plist="./ios/configs/dev/ExportOptions.plist" --build-name=${VERSION_NAME}-profile --build-number=${VERSION_CODE_PROFILE}
mv ./build/ios/archive/Runner.xcarchive ./archive/Runner-P-${VERSION_NAME}-${VERSION_CODE_PROFILE}.xcarchive
mv ./build/ios/ipa/Apps/JCSGuidelines.ipa ./archive/Runner-P-${VERSION_NAME}-${VERSION_CODE_PROFILE}.ipa
