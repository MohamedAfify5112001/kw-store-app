import 'package:hive/hive.dart';
import 'package:kw_store_app/local/local_product/local_product.dart';

sealed class HiveDao {
  static Future<void> initFavoriteHive() async {
    const favoriteKey = 'favorites';
    //adapters
    Hive.registerAdapter(LocalProductAdapter());
    //box
    await Hive.openBox<LocalProduct>(favoriteKey);
  }
}
sealed class Boxes {
  static Box<LocalProduct> get favoriteBox => Hive.box<LocalProduct>('favorites');
}