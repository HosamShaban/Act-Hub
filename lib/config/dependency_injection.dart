import 'package:acthub/core/internet_checker/internet_checker.dart';
import 'package:acthub/core/network/app_api.dart';
import 'package:acthub/core/network/dio_factory.dart';
import 'package:acthub/core/storage/local/app_settings_shared_preferences.dart';
import 'package:acthub/core/storage/remote/firebase/controllers/fb_notificatons.dart';
import 'package:acthub/features/auth/data/data_source/remote_fcm_token_data_source.dart';
import 'package:acthub/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:acthub/features/auth/data/data_source/remote_register_data_source.dart';
import 'package:acthub/features/auth/data/repository_impl/fcm_token_repository_impl.dart';
import 'package:acthub/features/auth/data/repository_impl/login_repository_impl.dart';
import 'package:acthub/features/auth/data/repository_impl/register_repository_impl.dart';
import 'package:acthub/features/auth/domain/repository/fcm_token_repository.dart';
import 'package:acthub/features/auth/domain/repository/login_repository.dart';
import 'package:acthub/features/auth/domain/repository/register_repository.dart';
import 'package:acthub/features/auth/domain/use_case/fcm_token_use_case.dart';
import 'package:acthub/features/auth/domain/use_case/login_use_case.dart';
import 'package:acthub/features/auth/domain/use_case/register_use_case.dart';
import 'package:acthub/features/auth/presentation/controller/login_controller.dart';
import 'package:acthub/features/auth/presentation/controller/registert_controller.dart';
import 'package:acthub/features/forget_password/data/data_souces/remote_data_source.dart';
import 'package:acthub/features/forget_password/data/repoitory_impl/forget_password_repository_impl.dart';
import 'package:acthub/features/forget_password/domain/repositroy/forget_password_repositroy.dart';
import 'package:acthub/features/forget_password/domain/usecase/forget_password_usecase.dart';
import 'package:acthub/features/forget_password/presentation/controller/forget_pass_controller.dart';
import 'package:acthub/features/home/data/data_source/remote_home_data_source.dart';
import 'package:acthub/features/home/data/repository_implementation/home_repository_implementation.dart';
import 'package:acthub/features/home/domain/repository/home_repository.dart';
import 'package:acthub/features/home/domain/usecase/home_usecase.dart';
import 'package:acthub/features/home/presentation/controller/home_controller.dart';
import 'package:acthub/features/main/presentation/controller/main_controller.dart';
import 'package:acthub/features/out_boarding/presentation%20/controller/out_boarding_controller.dart';
import 'package:acthub/features/reset_password/data/data_souces/reset_password_remote_data_source.dart';
import 'package:acthub/features/reset_password/data/repoitory_impl/reset_password_repository_impl.dart';
import 'package:acthub/features/reset_password/domain/repositroy/reset_password_repositroy.dart';
import 'package:acthub/features/reset_password/domain/usecase/reset_password_use_case.dart';
import 'package:acthub/features/reset_password/presentation/controller/reset_password_controller.dart';
import 'package:acthub/features/splash/presentation/controller/splash_controller.dart';
import 'package:acthub/features/verification/data/data_source/remote_verification_data_source.dart';
import 'package:acthub/features/verification/data/data_source/send_otp_remote_date_source.dart';
import 'package:acthub/features/verification/data/respository_impl/send_otp_respository_impl.dart';
import 'package:acthub/features/verification/data/respository_impl/verify_email_respository_impl.dart';
import 'package:acthub/features/verification/domain/repositories/send_otp_repository.dart';
import 'package:acthub/features/verification/domain/repositories/verification_repository.dart';
import 'package:acthub/features/verification/domain/usecase/send_otp_usecase.dart';
import 'package:acthub/features/verification/domain/usecase/verification_usecase.dart';
import 'package:acthub/features/verification/presentation/controller/verification_controller.dart';
import 'package:acthub/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

firebaseModule() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FbNotifications fb = FbNotifications();
  await fb.requestNotificationPermissions();
  await fb.initializeForegroundNotificationForAndroid();
  await FbNotifications.initNotifications();
  fb.manageNotificationAction();
  print('object');
  print(await FirebaseMessaging.instance.getToken());
}

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseModule();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  instance.registerLazySingleton<AppSettingsSharedPreferences>(
      () => AppSettingsSharedPreferences(instance()));

  // TODO: ONLY FOR TEST
  // AppSettingsSharedPreferences appSettingsSharedPreferences =
  //     instance<AppSettingsSharedPreferences>();
  // appSettingsSharedPreferences.clear();

  instance.registerLazySingleton(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppApi>(
    () => AppApi(dio),
  );

  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionCheckerPlus(),
    ),
  );
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  disposeSplash();
  Get.put<OutBoardingController>(OutBoardingController());
}

disposeOutBoarding() {
  Get.delete<OutBoardingController>();
}

initLoginModule() {
  disposeSplash();
  disposeOutBoarding();
  disposeRegisterModule();
  initVerificationModule();
  initFcmToken();

  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
      () => RemoteLoginDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginRepository>()) {
    instance.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImplement(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
      () => LoginUseCase(
        instance<LoginRepository>(),
      ),
    );
  }

  Get.put<LoginController>(LoginController());
}

disposeLoginModule() {
  if (GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.unregister<RemoteLoginDataSource>();
  }

  if (GetIt.I.isRegistered<LoginRepository>()) {
    instance.unregister<LoginRepository>();
  }

  if (GetIt.I.isRegistered<LoginUseCase>()) {
    instance.unregister<LoginUseCase>();
  }

  Get.delete<LoginController>();
}

initRegisterModule() {
  disposeLoginModule();
  if (!GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.registerLazySingleton<RemoteRegisterDataSource>(
      () => RemoteRegisterDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterRepository>()) {
    instance.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(
        instance<RemoteRegisterDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(
        instance<RegisterRepository>(),
      ),
    );
  }

  Get.put<RegisterController>(RegisterController());
}

disposeRegisterModule() {
  if (GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.unregister<RemoteRegisterDataSource>();
  }

  if (GetIt.I.isRegistered<RegisterRepository>()) {
    instance.unregister<RegisterRepository>();
  }

  if (GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.unregister<RegisterUseCase>();
  }

  Get.delete<RegisterController>();
}

initMainModule() {
  Get.put<MainController>(MainController());
  initHomeModule();
}

initHomeModule() {
  if (!GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.registerLazySingleton<RemoteHomeDataSource>(
      () => RemoteHomeDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<HomeRepository>()) {
    instance.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImplementation(
        instance<RemoteHomeDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerLazySingleton<HomeUseCase>(
      () => HomeUseCase(
        instance<HomeRepository>(),
      ),
    );
  }

  Get.put<HomeController>(HomeController());
}

initVerificationModule() {
  initSendOtp();

  if (!GetIt.I.isRegistered<RemoteVerificationDataSource>()) {
    instance.registerLazySingleton<RemoteVerificationDataSource>(
      () => RemoteVerificationDataSourceImplementation(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<VerificationRepository>()) {
    instance.registerLazySingleton<VerificationRepository>(
      () => VerificationRepositoryImpl(
        instance<NetworkInfo>(),
        instance<RemoteVerificationDataSource>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<VerificationUseCase>()) {
    instance.registerLazySingleton<VerificationUseCase>(
      () => VerificationUseCase(
        instance<VerificationRepository>(),
      ),
    );
  }

  Get.put<VerificationController>(VerificationController());
}

initForgetPassword() async {
  disposeLoginModule();
  initSendOtp();

  if (!GetIt.I.isRegistered<ForgetPasswordDataSource>()) {
    instance.registerLazySingleton<ForgetPasswordDataSource>(
        () => RemoteForgetPasswordDataSourceImpl(instance<AppApi>()));
  }

  if (!GetIt.I.isRegistered<ForgetPasswordRepository>()) {
    instance.registerLazySingleton<ForgetPasswordRepository>(
        () => ForgetPasswordRepositoryImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.registerFactory<ForgetPasswordUseCase>(
        () => ForgetPasswordUseCase(instance<ForgetPasswordRepository>()));
  }

  Get.put<ForgetPasswordController>(ForgetPasswordController());
}

disposeForgetPassword() async {
  if (GetIt.I.isRegistered<ForgetPasswordDataSource>()) {
    instance.unregister<ForgetPasswordDataSource>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordRepository>()) {
    instance.unregister<ForgetPasswordRepository>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.unregister<ForgetPasswordUseCase>();
  }
}

initResetPasswordModule() {
  if (!GetIt.I.isRegistered<ResetPasswordRemoteDataSource>()) {
    instance.registerLazySingleton<ResetPasswordRemoteDataSource>(
      () => RemoteResetPasswordRemoteDataSourceImpl(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ResetPasswordRepository>()) {
    instance.registerLazySingleton<ResetPasswordRepository>(
      () => ResetPasswordRepositoryImpl(
        instance<NetworkInfo>(),
        instance<ResetPasswordRemoteDataSource>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.registerLazySingleton<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(
        instance<ResetPasswordRepository>(),
      ),
    );
  }

  Get.put<ResetPasswordController>(ResetPasswordController());
}

disposeResetPasswordModule() {
  disposeForgetPassword();
  if (GetIt.I.isRegistered<ResetPasswordRemoteDataSource>()) {
    instance.unregister<ResetPasswordRemoteDataSource>();
  }

  if (GetIt.I.isRegistered<ResetPasswordRepository>()) {
    instance.unregister<ResetPasswordRepository>();
  }

  if (GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.unregister<ResetPasswordUseCase>();
  }

  Get.delete<ResetPasswordController>();
}

initSendOtp() async {
  if (!GetIt.I.isRegistered<RemoteSendOtpDataSource>()) {
    instance.registerLazySingleton<RemoteSendOtpDataSource>(
        () => RemoteSendOtpDataSourceImpl(instance<AppApi>()));
  }

  if (!GetIt.I.isRegistered<SendOtpRepository>()) {
    instance.registerLazySingleton<SendOtpRepository>(
        () => SendOtpRepositoryImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<SendOtpUseCase>()) {
    instance.registerFactory<SendOtpUseCase>(
        () => SendOtpUseCase(instance<SendOtpRepository>()));
  }
}

disposeSendOtp() async {
  if (GetIt.I.isRegistered<RemoteSendOtpDataSource>()) {
    instance.unregister<RemoteSendOtpDataSource>();
  }

  if (GetIt.I.isRegistered<SendOtpRepository>()) {
    instance.unregister<SendOtpRepository>();
  }

  if (GetIt.I.isRegistered<SendOtpUseCase>()) {
    instance.unregister<SendOtpUseCase>();
  }
}

initFcmToken() async {
  if (!GetIt.I.isRegistered<RemoteFcmTokenDataSource>()) {
    instance.registerLazySingleton<RemoteFcmTokenDataSource>(
        () => RemoteFcmTokenDataSourceImplement(instance<AppApi>()));
  }

  if (!GetIt.I.isRegistered<FcmTokenRepository>()) {
    instance.registerLazySingleton<FcmTokenRepository>(
        () => FcmTokenRepositoryImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<FcmTokenUseCase>()) {
    instance
        .registerFactory<FcmTokenUseCase>(() => FcmTokenUseCase(instance()));
  }
}

disposeFcmToken() async {
  if (GetIt.I.isRegistered<RemoteFcmTokenDataSource>()) {
    instance.unregister<RemoteFcmTokenDataSource>();
  }

  if (GetIt.I.isRegistered<FcmTokenRepository>()) {
    instance.unregister<FcmTokenRepository>();
  }

  if (GetIt.I.isRegistered<FcmTokenUseCase>()) {
    instance.unregister<FcmTokenUseCase>();
  }
}
