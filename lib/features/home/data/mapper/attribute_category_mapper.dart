import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/home/data/response/attribute_category_response.dart';
import 'package:acthub/features/home/domain/model/attribute_category_model.dart';

extension AttributeCategoryMapper on AttributeCategoryResponse {
  AttributeCategoryModel toDomain() {
    return AttributeCategoryModel(
      title: title.onNull(),
      description: description.onNull(),
      image: image.onNull(),
      type: type.onNull(),
    );
  }
}
