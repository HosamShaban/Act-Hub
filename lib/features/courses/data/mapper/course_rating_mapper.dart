import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/courses/domain/entity/course_rating_entity.dart';

import '../response/course_rating_response.dart';

extension CourseRatingMapper on CourseRatingResponse {
  CourseRatingEntity toDomain() => CourseRatingEntity(
        status: status.onNull(),
      );
}
