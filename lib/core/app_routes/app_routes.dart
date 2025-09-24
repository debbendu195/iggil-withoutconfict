import 'package:get/get.dart';
import '../../view/screen/authentication_screen/email_verify/email_verify_screen.dart';
import '../../view/screen/authentication_screen/forgot_screen/forgot_screen.dart';
import '../../view/screen/authentication_screen/login_screen/login_screen.dart';
import '../../view/screen/authentication_screen/otp_screeen/otp_screeen.dart';
import '../../view/screen/onboarding_screen/view/onboarding_screen.dart';
import '../../view/screen/role_screen/dentist/add_case/view/add_case_screen.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/dentist/dentist_list_screen.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/dentist_contract/contract_page.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/dentist_download/downloads.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/dentist_home/dentist_home_screen.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/view_case_screen/view_case_screen.dart';
import '../../view/screen/role_screen/dentist/my_case/view/my_case_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/account_settings/about_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/account_settings/account_settings_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/account_settings/change_pass_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/account_settings/privacy_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/account_settings/terms_services_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/edit_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/langauage_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/notification_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/profile_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_home_screen/view/lab_manager_home_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_home_screen/view/lab_managet_list/lab_manager_list_screen.dart';
import '../../view/screen/role_screen/nurse/nurse_home_screen/nurse_home_screen.dart';
import '../../view/screen/role_screen/practice_manager/practice_manager_home_screen/view/practice_manager_home_screen.dart';
import '../../view/screen/role_screen/technician/technician_chat_screen/view/technician_chat_screen.dart';
import '../../view/screen/role_screen/technician/technician_home/view/technician_home/technician_home_screen.dart';
import '../../view/screen/role_screen/technician/technician_my_case_screen/view/technician_my_case_screen.dart';
import '../../view/screen/role_screen/technician/technician_profile_screen/view/technician_profile_screen.dart';
import '../../view/screen/splash_screen/splash_screen.dart';



class AppRoutes {
  ///===========================Authentication==========================
  static const String splashScreen = "/SplashScreen";
  static const String onboardingScreen = "/OnboardingScreen";
  static const String loginScreen = "/LoginScreen";
  static const String emailVerify = "/EmailVerifyScreen";
  static const String otpScreeen = "/OtpScreeen";
  static const String forgotScreen = "/ForgotScreen";
  // static const String setNewPassword = "/SetNewPassword";


  ///===========================Dentist Part==========================
  static const String dentistListScreen = "/DentistListScreen";
  static const String dentistHomeScreen = "/DentistHomeScreen";
  static const String myCaseScreen = "/MyCaseScreen";
  static const String addCaseScreen = "/AddCaseScreen";
  static const String downloadsScreen = "/DownloadsScreen";
  static const String contactUsScreen = "/ContactUsScreen";
  static const String profileScreen = "/ProfileScreen";
  static const String viewCaseScreen = "/ViewCaseScreen";
  static const String editScreen = "/EditScreen";
  static const String accountSettingsScreen = "/AccountSettingsScreen";
  static const String langauageScreen = "/LangauageScreen";
  static const String notificationScreen = "/NotificationScreen";
  static const String changePassScreen = "/ChangePassScreen";
  static const String termsServicesScreen = "/TermsServicesScreen";
  static const String privacyScreen = "/PrivacyScreen";
  static const String aboutScreen = "/AboutScreen";

  ///===========================Technician Part==================================
  static const String technicianHomeScreen = "/TechnicianHomeScreen";
  static const String technicianMyCaseScreen = "/TechnicianMyCaseScreen";
  static const String technicianChatScreen = "/TechnicianChatScreen";
  static const String technicianProfileScreen = "/TechnicianProfileScreen";

  //========================= Lab Part ================================//
  static const String labManagerListScreen ="/LabManagerListScreen";
  static const String labManagerHomeScreen ="/LabManagerHomeScreen";

  //========================= Practice Part ================================//
  static const String practiceManagerHomeScreen ="/PracticeManagerHomeScreen";

 //========================= Nurse Part ================================//
  static const String nurseHomeScreen ="/NurseHomeScreen";

  static List<GetPage> routes = [
    ///===========================Authentication================================
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: emailVerify, page: () => EmailVerifyScreen()),
    GetPage(name: otpScreeen, page: () => OtpScreeen()),
    GetPage(name: forgotScreen, page: () => ForgotScreen()),
    // GetPage(name: setNewPassword, page: () => SetNewPassword()),

    ///===========================Dentist Part==================================
    GetPage(name: dentistListScreen, page: () => DentistListScreen()),
    GetPage(name: dentistHomeScreen, page: () => DentistHomeScreen()),
    GetPage(name: myCaseScreen, page: () => MyCaseScreen()),
    GetPage(name: addCaseScreen, page: () => AddCaseScreen()),
    GetPage(name: downloadsScreen, page: () => DownloadsScreen()),
    GetPage(name: contactUsScreen, page: () => ContactUsScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen()),
    GetPage(name: viewCaseScreen, page: () => ViewCaseScreen()),
    GetPage(name: editScreen, page: () => EditScreen()),
    GetPage(name: accountSettingsScreen, page: () => AccountSettingsScreen()),
    GetPage(name: langauageScreen, page: () => LangauageScreen()),
    GetPage(name: notificationScreen, page: () => NotificationScreen()),
    GetPage(name: changePassScreen, page: () => ChangePassScreen()),
    GetPage(name: termsServicesScreen, page: () => TermsServicesScreen()),
    GetPage(name: privacyScreen, page: () => PrivacyScreen()),
    GetPage(name: aboutScreen, page: () => AboutScreen()),

    ///===========================Technician Part==================================
    GetPage(name: technicianHomeScreen, page: () => TechnicianHomeScreen()),
    GetPage(name: technicianMyCaseScreen, page: () => TechnicianMyCaseScreen()),
    GetPage(name: technicianChatScreen, page: () => TechnicianChatScreen()),
    GetPage(name: technicianProfileScreen, page: () => TechnicianProfileScreen()),


    //========================= Lab Part================================//
    GetPage(name: labManagerListScreen, page: () => LabManagerListScreen()),
    GetPage(name: labManagerHomeScreen, page: () => LabManagerHomeScreen()),


    //========================= Practice Part================================//
    GetPage(name: practiceManagerHomeScreen, page: () => PracticeManagerHomeScreen()),


//========================= Nurse Part================================//
    GetPage(name: nurseHomeScreen, page: () => NurseHomeScreen()),

  ];
}
