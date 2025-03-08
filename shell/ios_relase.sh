#!/bin/sh

. ./shell/versions.properties

sh ./shell/firebase/firebase_release.sh

#リリースビルド
flutter build ipa --release --export-options-plist="./ios/configs/ExportOptions.plist" --build-name=${VERSION_NAME}-release --build-number=${VERSION_CODE}
mv ./build/ios/archive/Runner.xcarchive ./archive/Runner-R-${VERSION_NAME}-${VERSION_CODE}.xcarchive
mv ./build/ios/ipa/JCSGuidelines.ipa ./archive/Runner-R-${VERSION_NAME}-${VERSION_CODE}.ipa
