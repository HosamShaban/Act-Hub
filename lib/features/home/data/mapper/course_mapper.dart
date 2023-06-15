import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/home/data/mapper/attribute_course_mapper.dart';
import 'package:acthub/features/home/data/response/course_response.dart';
import 'package:acthub/features/home/domain/model/course_model.dart';

extension CourseMapper on CourseResponse {
  CourseModel toDomain() {
    return CourseModel(
      id: id.onNull(),
      isRated: isRated.onNull(),
      userRate: userRate.onNull(),
      attributeCourseModel: attributeCourseResponse?.toDomain(),
    );
  }
}
