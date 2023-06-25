import 'package:acthub/features/profile/data/request/edit_password_request.dart';
import 'package:acthub/features/profile/domain/model/edit_password_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';

abstract class EditPasswordRepository {
  Future<Either<Failure, EditPasswordModel>> editPassword(
      EditPasswordRequest request);
}
