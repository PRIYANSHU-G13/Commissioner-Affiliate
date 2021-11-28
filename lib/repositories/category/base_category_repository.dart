import 'package:commissioner_affiliate_1/models/category_model.dart';

abstract class BaseCategoryRepository{
  Stream<List<Category>> getAllCategories();
}