import 'package:commissioner_affiliate_1/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}