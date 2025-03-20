#!/bin/sh

. ./shell/versions.properties

sh ./shell/firebase/firebase_release.sh

#リリースビルド
flutter build apk --profile --build-name=${VERSION_NAME}-profile --build-number=${VERSION_CODE_PROFILE}
mv ./build/app/outputs/apk/profile/app-profile.apk ./archive/app-profile-${VERSION_NAME}-${VERSION_CODE_PROFILE}.apk
adb install ./archive/app-profile-${VERSION_NAME}-${VERSION_CODE_PROFILE}.apk
#ビルドバイナリをFinderで開く
open ./archive/
