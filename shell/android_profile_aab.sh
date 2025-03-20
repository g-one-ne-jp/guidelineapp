#!/bin/sh

. ./shell/versions.properties

sh ./shell/firebase/firebase_release.sh

#リリースビルド
flutter build appbundle --profile --build-name=${VERSION_NAME} --build-number=${VERSION_CODE_PROFILE}

# ビルドされたアプリバンドルの名前を変更
mv ./build/app/outputs/bundle/profile/app-profile.aab ./archive/app-profile-${VERSION_NAME}-${VERSION_CODE_PROFILE}.aab


#buildディレクトリ
cd  ./build/app/intermediates/flutter/profile
mkdir obj
cp -a arm64-v8a obj
cp -a x86_64 obj
cp -a armeabi-v7a obj
cd obj
rm -f .DS_Store
zip -r symbols.zip .

# ビルドされたアプリバンドルの名前を変更
mv ./symbols.zip ../../../../../../archive/app-profile-symbols-${VERSION_NAME}-${VERSION_CODE_PROFILE}.zip


cd ../../../../../../

#ビルドバイナリをFinderで開く
open ./archive/

