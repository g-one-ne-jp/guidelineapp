import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(UserService());
}

class UserService {
  final favoriteItemList = <int>[];

  void addFavoriteItem({required int listNumber}) {
    favoriteItemList.add(listNumber);
  }

  void removeFavoriteItem({required int listNumber}) {
    favoriteItemList.remove(listNumber);
  }

  Future<bool> isFavorite({
    required int listNumber,
  }) async {
    var isFavorite = false;
    for (final favoriteItem in favoriteItemList) {
      if (favoriteItem == listNumber) {
        isFavorite = true;
      }
    }
    return isFavorite;
  }
}
