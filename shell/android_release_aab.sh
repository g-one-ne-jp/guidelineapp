#!/bin/sh

. ./shell/versions.properties

sh ./shell/firebase/firebase_release.sh

#リリースビルド
flutter build appbundle --build-name=${VERSION_NAME} --build-number=${VERSION_CODE}
#ビルドバイナリをFinderで開く
open ./build/app/outputs/bundle/release/
# ビルドされたアプリバンドルの名前を変更
mv ./build/app/outputs/bundle/release/app-release.aab ./archive/app-release-${VERSION_NAME}-${VERSION_CODE}.aab


#buildディレクトリ
cd  ./build/app/intermediates/flutter/release
mkdir obj
cp -a arm64-v8a obj
cp -a x86_64 obj
cp -a armeabi-v7a obj
cd obj
rm -f .DS_Store
zip -r symbols.zip .

# ビルドされたアプリバンドルの名前を変更
mv ./symbols.zip ../../../../../../archive/app-release-symbols-${VERSION_NAME}-${VERSION_CODE}.zip


cd ../../../../../../

#ビルドバイナリをFinderで開く
open ./archive/

