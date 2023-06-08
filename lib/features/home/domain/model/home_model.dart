import 'package:acthub/core/base_model/base_response.dart';

import 'category_model.dart';
import 'course_model.dart';
import 'slider_model.dart';

class HomeModel extends BaseModel {
  List<SliderModel>? sliders;
  List<CategoryModel>? categories;
  List<CourseModel>? courses;

  HomeModel({
    this.sliders,
    this.categories,
    this.courses,
    super.message,
  });
}
