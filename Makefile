.PHONY: setup
install:
	dart pub global activate flutter_gen

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
	# l10nの生成コマンド
	flutter gen-l10n
	# import_sorterの実行コマンド
	flutter pub run import_sorter:main
    # flutter_launcher_iconsの生成コマンド
	flutter pub run flutter_launcher_icons
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
