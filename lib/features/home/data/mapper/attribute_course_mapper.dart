import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/home/data/response/attribute_course_response.dart';
import 'package:acthub/features/home/domain/model/attribute_course_model.dart';

extension AttributeCourseMapper on AttributeCourseResponse {
  AttributeCourseModel toDomain() {
    return AttributeCourseModel(
      title: title.onNull(),
      description: description.onNull(),
      active: active.onNull(),
      resourceId: resourceId.onNull(),
      hours: hours.onNull(),
      price: price.onNull(),
      rate: rate.onNull(),
      avatar: avatar.onNull(),
      startDate: startDate.onNull(),
      endDate: endDate.onNull(),
    );
  }
}
