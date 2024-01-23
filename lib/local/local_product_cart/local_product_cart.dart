import 'package:isar/isar.dart';
part 'local_product_cart.g.dart';

@Collection()
class LocalProductCart {
  Id id = Isar.autoIncrement;
  late String name;
  late String salary;
  late String salaryAfterDiscount;
  late String image;
}
