import 'package:get/get.dart';
import '../../view/screen/authentication_screen/demo/demo.dart';
import '../../view/screen/authentication_screen/email_verify/email_verify_screen.dart';
import '../../view/screen/authentication_screen/forgot_screen/forgot_screen.dart';
import '../../view/screen/authentication_screen/login_screen/login_screen.dart';
import '../../view/screen/authentication_screen/otp_screeen/otp_screeen.dart';
import '../../view/screen/onboarding_screen/view/onboarding_screen.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/add_case/view/add_case_screen.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/case_page/case_page.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/dentist/dentist_list_screen.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/dentist_archives/dentist_archives.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/dentist_contract/contract_page.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/dentist_download/downloads.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/dentist_home/dentist_home_screen.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/invoice/invoice_list_view/invoice_list_view.dart';
import '../../view/screen/role_screen/dentist/dentist_home/view/view_case_screen/view_case_screen.dart';
import '../../view/screen/role_screen/dentist/my_case/view/dentist_my_case_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/account_settings/about_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/account_settings/account_settings_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/account_settings/change_pass_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/account_settings/privacy_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/account_settings/terms_services_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/edit_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/langauage_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/notification_screen.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/profile_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_home_screen/view/lab_manager_contact/lab_manager_contact.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_home_screen/view/lab_manager_home_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_home_screen/view/lab_manager_view_case_screen/lab_manager_view_case_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_home_screen/view/lab_managet_list/lab_manager_list_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_home_screen/view/lab_managment_archives/lab_managment_archives.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_home_screen/view/lab_managment_download/lab_manager_download.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_home_screen/view/lab_managment_my_all_case/lab_managment_all_case.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_home_screen/view/lab_profile_managment/controller/create_technician_profile.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_home_screen/view/lab_profile_managment/lab_profile_managment.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_profile/view/lab_manager_profile_screen/lab_manager_account_settings/lab_manager_about_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_profile/view/lab_manager_profile_screen/lab_manager_account_settings/lab_manager_account_settings_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_profile/view/lab_manager_profile_screen/lab_manager_account_settings/lab_manager_change_pass_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_profile/view/lab_manager_profile_screen/lab_manager_account_settings/lab_manager_privacy_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_profile/view/lab_manager_profile_screen/lab_manager_account_settings/lab_manager_terms_services_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_profile/view/lab_manager_profile_screen/lab_manager_edit_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_profile/view/lab_manager_profile_screen/lab_manager_langauage_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_profile/view/lab_manager_profile_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_manager_profile/view/lab_manager_profile_screen/lab_manager_notification_screen.dart';
import '../../view/screen/role_screen/lab_manager/lab_managment_massage/lab_massage_list.dart';
import '../../view/screen/role_screen/nurse/nurse_home_screen/view/nurse/nurse_list_screen.dart';
import '../../view/screen/role_screen/nurse/nurse_home_screen/view/nurse_archives/nurse_archives.dart';
import '../../view/screen/role_screen/nurse/nurse_home_screen/view/nurse_contract/nurse_contract_page.dart';
import '../../view/screen/role_screen/nurse/nurse_home_screen/view/nurse_download/nurse_downloads.dart';
import '../../view/screen/role_screen/nurse/nurse_home_screen/view/nurse_home/nurse_home_screen.dart';
import '../../view/screen/role_screen/nurse/nurse_my_case/nurse_my_case_screen.dart';
import '../../view/screen/role_screen/nurse/nurse_profile/nurse_profile_screen.dart';
import '../../view/screen/role_screen/practice_manager/practice_manager_home_screen/view/invoice/invoice_list_view/invoice_list_view.dart';
import '../../view/screen/role_screen/practice_manager/practice_manager_home_screen/view/practice_manager_contact/practice_manager_contact.dart';
import '../../view/screen/role_screen/practice_manager/practice_manager_home_screen/view/practice_manager_home_screen.dart';
import '../../view/screen/role_screen/practice_manager/practice_manager_home_screen/view/practice_manager_list/practice_manager_list_screen.dart';
import '../../view/screen/role_screen/practice_manager/practice_manager_home_screen/view/practice_manager_my_case/practice_manager_my_case.dart';
import '../../view/screen/role_screen/practice_manager/practice_manager_home_screen/view/practice_managment_archives/practice_managment_archives.dart';
import '../../view/screen/role_screen/practice_manager/practice_manager_home_screen/view/practice_managment_download/practice_manager_download.dart';
import '../../view/screen/role_screen/practice_manager/practice_manager_profile/view/practice_manager_profile_screen/practice_manager_profile_screen.dart';
import '../../view/screen/role_screen/technician/technician_chat_screen/view/technician_chat_screen.dart';
import '../../view/screen/role_screen/technician/technician_home/view/technician_home/technician/technician_list_screen.dart';
import '../../view/screen/role_screen/technician/technician_home/view/technician_home/technician_contract/technician_contract_page.dart';
import '../../view/screen/role_screen/technician/technician_home/view/technician_home/technician_download/technician_downloads.dart';
import '../../view/screen/role_screen/technician/technician_home/view/technician_home/technician_home_screen.dart';
import '../../view/screen/role_screen/technician/technician_home/view/technician_home/technician_view_case_screen/technician_view_case_screen.dart';
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

  static const String demo = "/Demo";

  ///=========================== Dentist Part ==========================
  static const String dentistListScreen = "/DentistListScreen";
  static const String dentistHomeScreen = "/DentistHomeScreen";
  static const String dentistMyCaseScreen = "/DentistMyCaseScreen";
  static const String addCaseScreen = "/AddCaseScreen";
  // static const String dentistCaseList = "/DentistCaseList";
  static const String dentistArchives = "/DentistArchives";
  static const String downloadsScreen = "/DownloadsScreen";
  static const String contactUsScreen = "/ContactUsScreen";
  static const String profileScreen = "/ProfileScreen";
  static const String viewCaseScreen = "/ViewCaseScreen";
  static const String editScreen = "/EditScreen";
  static const String caseDocumentScreen = "/CaseDocumentScreen";
  static const String accountSettingsScreen = "/AccountSettingsScreen";
  static const String langauageScreen = "/LangauageScreen";
  static const String notificationScreen = "/NotificationScreen";
  static const String changePassScreen = "/ChangePassScreen";
  static const String termsServicesScreen = "/TermsServicesScreen";
  static const String privacyScreen = "/PrivacyScreen";
  static const String aboutScreen = "/AboutScreen";

  ///=========================== Technician Part ==================================
  static const String technicianListScreen = "/TechnicianListScreen";
  static const String technicianHomeScreen = "/TechnicianHomeScreen";
  static const String technicianMyCaseScreen = "/TechnicianMyCaseScreen";
  static const String technicianViewCaseScreen = "/TechnicianViewCaseScreen";
  static const String technicianChatScreen = "/TechnicianChatScreen";
  static const String technicianContractPage = "/TechnicianContractPage";
  static const String technicianDownloads = "/TechnicianDownloads";
  static const String technicianProfileScreen = "/TechnicianProfileScreen";

  //========================= Lab Part ================================//
  static const String labManagerListScreen ="/LabManagerListScreen";
  static const String labManagerHomeScreen ="/LabManagerHomeScreen";
  static const String labManagerProfileScreen ="/LabManagerProfileScreen";
  static const String labManagerViewCaseScreen ="/LabManagerViewCaseScreen";
  static const String labManagerLangauageScreen ="/LabManagerLangauageScreen";
  static const String labManagmentAllCase ="/LabManagmentAllCase";
  static const String labMassageList ="/LabMassageList";
  static const String labManagmentArchives ="/LabManagmentArchives";
  static const String createTechnicianProfile ="/CreateTechnicianProfile";
  static const String invoiceListView ="/InvoiceListView";
  static const String labManagerDownload ="/LabManagerDownload";
  static const String labManagerContact ="/LabManagerContact";
  static const String labProfileManagment ="/LabProfileManagment";
  static const String labManagerNotificationScreen ="/LabManagerNotificationScreen";
  static const String labManagerEditScreen ="/LabManagerEditScreen";
  static const String labManagerAccountSettingsScreen ="/LabManagerAccountSettingsScreen";
  static const String labManagerAboutScreen ="/LabManagerAboutScreen";
  static const String labManagerChangePassScreen ="/LabManagerChangePassScreen";
  static const String labManagerTermsServicesScreen ="/labManagerTermsServicesScreen";
  static const String labManagerPrivacyScreen ="/LabManagerPrivacyScreen";

  //========================= Practice Part ================================//
  static const String practiceManagerListScreen ="/PracticeManagerListScreen";
  static const String practiceManagerHomeScreen ="/PracticeManagerHomeScreen";
  static const String practiceManagerMyCase ="/PracticeManagerMyCase";
  static const String practiceManagmentArchives ="/PracticeManagmentArchives";
  static const String practiceManagerContact ="/PracticeManagerContact";
  static const String practiceManagerDownload ="/PracticeManagerDownload";
  static const String practiceManagerInvoiceListView ="/PracticeManagerInvoiceListView";
  static const String practiceManagerProfileScreen ="/PracticeManagerProfileScreen";

 //========================= Nurse Part ================================//
  static const String nurseListScreen ="/NurseListScreen";
  static const String nurseHomeScreen ="/NurseHomeScreen";
  static const String nurseMyCaseScreen ="/NurseMyCaseScreen";
  static const String nurseArchives ="/NurseArchives";
  static const String nurseContractPage ="/NurseContractPage";
  static const String nurseDownloads ="/NurseDownloads";
  static const String nurseProfileScreen ="/NurseProfileScreen";

  static List<GetPage> routes = [
    ///=========================== Authentication ================================
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: emailVerify, page: () => EmailVerifyScreen()),
    GetPage(name: otpScreeen, page: () => OtpScreeen()),
    GetPage(name: forgotScreen, page: () => ForgotScreen()),
    // GetPage(name: setNewPassword, page: () => SetNewPassword()),

    GetPage(name: demo, page: () => Demo()),

    ///=========================== Dentist Part ==================================
    GetPage(name: dentistListScreen, page: () => DentistListScreen()),
    GetPage(name: dentistHomeScreen, page: () => DentistHomeScreen()),
    GetPage(name: dentistMyCaseScreen, page: () => DentistMyCaseScreen()),
    GetPage(name: addCaseScreen, page: () => AddCaseScreen()),
    // GetPage(name: dentistCaseList, page: () => DentistCaseList()),
    GetPage(name: dentistArchives, page: () => DentistArchives()),
    GetPage(name: caseDocumentScreen, page: () => CaseDocumentScreen()),
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

    ///=========================== Technician Part ==================================
    GetPage(name: technicianListScreen, page: () => TechnicianListScreen()),
    GetPage(name: technicianHomeScreen, page: () => TechnicianHomeScreen()),
    GetPage(name: technicianMyCaseScreen, page: () => TechnicianMyCaseScreen()),
    GetPage(name: technicianViewCaseScreen, page: () => TechnicianViewCaseScreen()),
    GetPage(name: technicianChatScreen, page: () => TechnicianChatScreen()),
    GetPage(name: technicianContractPage, page: () => TechnicianContractPage()),
    GetPage(name: technicianDownloads, page: () => TechnicianDownloads()),
    GetPage(name: technicianProfileScreen, page: () => TechnicianProfileScreen()),


    //========================= Lab Part ================================//
    GetPage(name: labManagerListScreen, page: () => LabManagerListScreen()),
    GetPage(name: labManagerHomeScreen, page: () => LabManagerHomeScreen()),
    GetPage(name: labManagerViewCaseScreen, page: () => LabManagerViewCaseScreen()),
    GetPage(name: labManagerProfileScreen, page: () => LabManagerProfileScreen()),
    GetPage(name: labManagmentAllCase, page: () => LabManagmentAllCase()),
    GetPage(name: labManagerLangauageScreen, page: () => LabManagerLangauageScreen()),
    GetPage(name: labManagmentArchives, page: () => LabManagmentArchives()),
    GetPage(name: createTechnicianProfile, page: () => CreateTechnicianProfile()),
    GetPage(name: invoiceListView, page: () => InvoiceListView()),
    GetPage(name: labMassageList, page: () => LabMassageList()),
    GetPage(name: labManagerDownload, page: () => LabManagerDownload()),
    GetPage(name: labManagerContact, page: () => LabManagerContact()),
    GetPage(name: labProfileManagment, page: () => LabProfileManagment()),
    GetPage(name: labManagerNotificationScreen, page: () => LabManagerNotificationScreen()),
    GetPage(name: labManagerEditScreen, page: () => LabManagerEditScreen()),
    GetPage(name: labManagerAccountSettingsScreen, page: () => LabManagerAccountSettingsScreen()),
    GetPage(name: labManagerAboutScreen, page: () => LabManagerAboutScreen()),
    GetPage(name: labManagerChangePassScreen, page: () => LabManagerChangePassScreen()),
    GetPage(name: labManagerTermsServicesScreen, page: () => LabManagerTermsServicesScreen()),
    GetPage(name: labManagerPrivacyScreen, page: () => LabManagerPrivacyScreen()),


    //========================= Practice Part ================================//
    GetPage(name: practiceManagerListScreen, page: () => PracticeManagerListScreen()),
    GetPage(name: practiceManagerHomeScreen, page: () => PracticeManagerHomeScreen()),
    GetPage(name: practiceManagerMyCase, page: () => PracticeManagerMyCase()),
    GetPage(name: practiceManagmentArchives, page: () => PracticeManagmentArchives()),
    GetPage(name: practiceManagerContact, page: () => PracticeManagerContact()),
    GetPage(name: practiceManagerDownload, page: () => PracticeManagerDownload()),
    GetPage(name: practiceManagerInvoiceListView, page: () => PracticeManagerInvoiceListView()),
    GetPage(name: practiceManagerProfileScreen, page: () => PracticeManagerProfileScreen()),


//========================= Nurse Part ================================//
    GetPage(name: nurseListScreen, page: () => NurseListScreen()),
    GetPage(name: nurseHomeScreen, page: () => NurseHomeScreen()),
    GetPage(name: nurseMyCaseScreen, page: () => NurseMyCaseScreen()),
    GetPage(name: nurseArchives, page: () => NurseArchives()),
    GetPage(name: nurseContractPage, page: () => NurseContractPage()),
    GetPage(name: nurseDownloads, page: () => NurseDownloads()),
    GetPage(name: nurseProfileScreen, page: () => NurseProfileScreen()),

  ];
}

