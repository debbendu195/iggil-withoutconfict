import 'package:get/get.dart';

import '../../view/screen/authentication_screen/email_verify/email_verify_screen.dart';
import '../../view/screen/authentication_screen/forgot_screen/forgot_screen.dart';
import '../../view/screen/authentication_screen/login_screen/login_screen.dart';
import '../../view/screen/authentication_screen/otp_screeen/otp_screeen.dart';
import '../../view/screen/onboarding_screen/onboarding1_screen.dart';
import '../../view/screen/onboarding_screen/onboarding2_screen.dart';
import '../../view/screen/onboarding_screen/onboarding3_screen.dart';
import '../../view/screen/splash_screen/splash_screen.dart';

class AppRoutes {
  ///===========================Authentication==========================
  static const String splashScreen = "/SplashScreen";
  static const String onboarding1Screen = "/Onboarding1Screen";
  static const String onboarding2Screen = "/Onboarding2Screen";
  static const String onboarding3Screen = "/Onboarding3Screen";
  static const String loginScreen = "/LoginScreen";
  static const String emailVerify = "/EmailVerifyScreen";
  static const String otpScreeen = "/OtpScreeen";
  static const String forgotScreen = "/ForgotScreen";
  // static const String setNewPassword = "/SetNewPassword";


  ///===========================Host Part==========================
  static const String homeScreen = "/HomeScreen";

  static List<GetPage> routes = [
    ///===========================Authentication==========================
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboarding1Screen, page: () => Onboarding1Screen()),
    GetPage(name: onboarding2Screen, page: () => Onboarding2Screen()),
    GetPage(name: onboarding3Screen, page: () => Onboarding3Screen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: emailVerify, page: () => EmailVerifyScreen()),
    GetPage(name: otpScreeen, page: () => OtpScreeen()),
    GetPage(name: forgotScreen, page: () => ForgotScreen()),
    // GetPage(name: setNewPassword, page: () => SetNewPassword()),

    ///===========================Host Part==========================
    // GetPage(name: homeScreen, page: () => HomeScreen()),

  ];
}
