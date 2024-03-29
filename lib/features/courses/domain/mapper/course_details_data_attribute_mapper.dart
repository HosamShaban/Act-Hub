import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/courses/domain/entity/course_details_data_attribute_entity.dart';
import 'package:acthub/features/courses/presentation/model/course_details_data_attribute_model.dart';

extension CourseDetailsDataAttributeMapper on CourseDetailsDataAttributeEntity {
  CourseDetailsDataAttributeModel toDomain() {
    return CourseDetailsDataAttributeModel(
      name: name.onNull(),
      description: description.onNull(),
      active: active.onNull(),
      resourceId: resourceId.onNull(),
      hours: hours.onNull(),
      price: price.onNull(),
      rate: rate.onNull(),
      avatar: avatar.onNull(),
    );
  }
}
