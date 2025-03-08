.PHONY: setup
install:
	dart pub global activate flutter_gen

fmt:
	fvm dart format --line-length 120 .
	dart fix --apply
	flutter pub run import_sorter:main
	flutter pub run pubspec_dependency_sorter:main
	flutter pub get

watch:
	dart run build_runner watch -d

generate:
	dart run build_runner build -d
	dart pub global run riverpod_graph:riverpod_graph lib/providers -f d2
	
setup:
	flutter clean
	flutter pub get

flutter_generate:
	flutter clean
	flutter pub get
	# import_sorterの実行コマンド
	flutter pub run import_sorter:main
    #アイコンの生成コマンド
	flutter pub run flutter_launcher_icons
	# スプラッシュ画面の生成コマンド
	dart run flutter_native_splash:create
	# コード生成(build_runner)
	flutter pub run build_runner build --delete-conflicting-outputs

submit_ios:
	flutter clean
	flutter pub get
	#Xcodeを開く
	open ios/Runner.xcworkspace

submit_android:
	flutter clean
	flutter pub get
	#AndroidのBundleを生成する
	flutter build appbundle

clean_ios:
	rm -rf ios/Podfile.lock
	#pod削除
	rm -rf ios/Pods
	#キャッシュ削除
	rm -rf ~/Library/Developer/Xcode/DerivedData/
	

	#podfile削除
	#rm ios/Podfile
	#rm ios/Podfile.lock

	#フラッターキャッシュ削除
	flutter clean
	#dart pakcage再構築
	flutter pub cache repair
	flutter pub get
	
	cd ios/ && pod install
	cd ../

#remove ios
releasebuild:
	rm -rf ios/Podfile.lock
	rm -rf ios/Pods
	rm -rf ~/Library/Developer/Xcode/DerivedData/
	rm -rf ios/Podfile
	rm -rf ios/Podfile.lock
	flutter clean
	flutter pub cache repair
	flutter pub get
	cd ios/ && pod install
	cd ../

ios_profile:
	#プロファイル
	sh ./shell/ios_profile.sh

ios_release:
	#リリース
	sh ./shell/ios_relase.sh

ios_all:
	make ios_profile
	make ios_release