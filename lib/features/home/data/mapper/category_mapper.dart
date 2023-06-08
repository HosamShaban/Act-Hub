import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/home/data/mapper/attribute_category_mapper.dart';
import 'package:acthub/features/home/data/response/category_response.dart';
import 'package:acthub/features/home/domain/model/category_model.dart';

extension CategoryMapper on CategoryResponse {
  CategoryModel toDomain() {
    return CategoryModel(
        id: id.onNull(),
        attributeCategoryModel: attributeCategoryResponse?.toDomain());
  }
}
