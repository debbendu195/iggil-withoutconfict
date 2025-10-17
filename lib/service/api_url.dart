class ApiUrl {
  static const String baseUrl = "https://ikgill-backend.onrender.com";
  static const String imageUrl = "http://13.58.33.119:5000/";
  //static String socketUrl = "http://13.58.33.119:5000";

  /// Authentication
  static const String signIn = "/api/v1/auth/login";
  static String getUser(String id) => "api/v1/user/get-user/$id";
  static String forgetPassword = "/api/v1/auth/forgot-password";

  /// Cases
  static const String getAllCase = "/api/v1/case/all-case";
  static const String createCaseUrl = "/api/v1/case/create-case";

  /// Others
  static String verifyResetOtp = "/api/v1/auth/api/v1/auth/verify-reset-otp";
  static String resendOtp = "/api/v1/auth/resend-otp";
  static const String forgotPassword = "/api/v1/user/forgot_password";
  static const String newPassword = "/api/v1/user/reset_password";
  static const String updateProfile = "/api/v1/auth/update_my_profile";
  static const String myProfile = "/api/v1/auth/myprofile";
}
