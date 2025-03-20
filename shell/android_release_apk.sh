#!/bin/sh

. ./shell/versions.properties

sh ./shell/firebase/firebase_release.sh

#リリースビルド
flutter build apk --release --build-name=${VERSION_NAME}-release --build-number=${VERSION_CODE}
mv ./build/app/outputs/apk/release/app-release.apk ./archive/app-release-${VERSION_NAME}-${VERSION_CODE}.apk
adb install ./archive/app-release-${VERSION_NAME}-${VERSION_CODE}.apk
#ビルドバイナリをFinderで開く
open ./archive
