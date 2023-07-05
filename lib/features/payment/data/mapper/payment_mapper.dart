import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/payment/domain/model/payment_model.dart';

import '../response/payment_response.dart';

extension PaymentMapper on PaymentResponse {
  PaymentModel toDomain() {
    return PaymentModel(
      id: id.onNull(),
      name: name.onNull(),
    );
  }
}
