import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/courses/domain/entity/course_subscription_entity.dart';

import '../response/course_subscription_response.dart';

extension CourseSubscriptionMapper on CourseSubscriptionResponse {
  CourseSubscriptionEntity toDomain() => CourseSubscriptionEntity(
        status: status.onNull(),
      );
}
