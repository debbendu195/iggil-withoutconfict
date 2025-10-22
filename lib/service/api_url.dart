class ApiUrl {
  /// ================= BASE URL =================
  static const String baseUrl = "https://ikgill-backend.onrender.com";
  static const String imageUrl = "http://13.58.33.119:5000/";
  // static const String socketUrl = "http://13.58.33.119:5000";

  /// ================= AUTHENTICATION =================
  static const String login = "/api/v1/user/user-login";
  static String getUser(String id) => "/api/v1/user/get-user/$id";

  static const String forgetPassword = "/api/v1/user/forgot_password";
  static const String verifyResetOtp = "/api/v1/auth/verify-reset-otp";
  static const String resendOtp = "/api/v1/auth/resend-otp";
  static const String newPassword = "/api/v1/user/reset_password";

  /// ================= CASE MANAGEMENT =================
  static const String getAllCase = "/api/v1/case/all-case";
  static const String createCaseUrl = "/api/v1/case/create-case";

  /// ================= USER SETTINGS =================
  static const String changePassword = "/api/v1/user/user-change-password";
  static const String updateProfileWithPhoto = "/api/v1/user/user-update-personal-info";
  static const String updateProfile = "/api/v1/user/user-update-personal-info";
  static const String privacyPolicy = "/api/v1/setting/privacy-policy/68e17257cc3c9c85e5f6bde4";
  static const String termsCondition = "/api/v1/setting/trams/68e17b2c0d7e5dbfa4404203";
  static const String aboutUs = "/api/v1/setting/about-us/68e17a540d7e5dbfa44041ff";

}
