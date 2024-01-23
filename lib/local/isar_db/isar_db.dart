import 'package:isar/isar.dart';
import 'package:kw_store_app/local/local_product_cart/local_product_cart.dart';
import 'package:path_provider/path_provider.dart';

abstract interface class CrudOperation<T, E> {
  Future<void> add(T data);

  Future<void> delete(int id);

  Future<E> fetch();
}

final class CartIsarDatabase
    implements CrudOperation<LocalProductCart, List<LocalProductCart>> {
  static late Isar _isar;

  CartIsarDatabase._();

  static CartIsarDatabase get _instance => CartIsarDatabase._();

  factory CartIsarDatabase() => _instance;

  static Future<void> initIsar() async {
    final cacheDir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [LocalProductCartSchema],
      directory: cacheDir.path,
    );
  }

  @override
  Future<void> add(LocalProductCart localProductCart) async {
    await _isar.writeTxn(() => _isar.localProductCarts.put(localProductCart));
  }

  @override
  Future<List<LocalProductCart>> fetch() async {
    List<LocalProductCart> fetchedProducts =
        await _isar.localProductCarts.where().findAll();
    final Set<String> idsProduct = {};
    fetchedProducts.retainWhere((x) => idsProduct.add(x.name));
    return fetchedProducts;
  }

  @override
  Future<void> delete(int id) async => _isar.localProductCarts.delete(id);
}
