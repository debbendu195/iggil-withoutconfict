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
  static const String myProfile = "/api/v1/auth/myprofile";

  /// ================= CASE MANAGEMENT =================
  static const String getAllCase = "/api/v1/case/all-case";
  static const String createCaseUrl = "/api/v1/case/create-case";

  /// ================= USER SETTINGS =================
  static const String changePassword = "/api/v1/user/change_password";
  static const String updateProfile = "/api/v1/auth/update_my_profile";
}
