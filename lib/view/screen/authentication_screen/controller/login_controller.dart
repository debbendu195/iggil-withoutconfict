import 'dart:convert';
import 'package:event_platform/service/api_client.dart';
import 'package:event_platform/service/api_url.dart';
import 'package:event_platform/utils/ToastMsg/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../helper/shared_prefe/shared_prefe.dart';
import '../../../../service/api_check.dart';
import '../../../../utils/app_const/app_const.dart';

class LoginController extends GetxController {
  ///====================== Text Controllers =====================
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  ///====================== Loading State ========================
  RxBool loginLoading = false.obs;
  RxBool isSignupLoading = false.obs;


  ///====================== Login Function =======================
  Future<void> loginUser() async {
    loginLoading.value = true;

    Map<String, String> body = {
      "email": emailController.value.text.trim(),
      "password": passwordController.value.text.trim(),
    };

    try {
      var response = await ApiClient.postData(ApiUrl.signIn, jsonEncode(body));

      loginLoading.value = false;
      refresh();

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic>
        jsonResponse = response.body is String ? jsonDecode(response.body) : response.body;

        print(jsonResponse);
        // jsonResponse['sucess']
        //json['accessToken']
        //profile
        showCustomSnackBar(
          jsonResponse['message']?.toString() ?? "Login successful",
          isError: false,
        );

        var dataMap = jsonResponse['accessToken'];
        String accessToken = dataMap.toString();
        // print("hi this is accessToken$accessToken");

        await SharePrefsHelper.setString(AppConstants.bearerToken, accessToken);

        // Decode token
        Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
        String userId = decodedToken['id'].toString();
        String userRole = decodedToken['role'].toString();

        await SharePrefsHelper.setString(AppConstants.userId, userId);
        await SharePrefsHelper.setString(AppConstants.role, userRole);

        Get.offAllNamed(AppRoutes.dentistListScreen);
        // Navigate based on role
        // if (userRole.toLowerCase() == "host") {
        //   Get.offAllNamed(AppRoutes.dentistListScreen);
        // } else {
        //   Get.offAllNamed(AppRoutes.labManagerListScreen);
        // }
      } else {
        Map<String, dynamic> errorResponse =
        response.body is String ? jsonDecode(response.body) : response.body;

        if (response.statusCode == 400 || response.statusCode == 401) {
          showCustomSnackBar(
            errorResponse['message']?.toString() ?? "Invalid email or password",
            isError: true,
          );
        } else {
          ApiChecker.checkApi(response);
        }
      }
    } catch (e) {
      loginLoading.value = false;
      refresh();
      showCustomSnackBar("An error occurred. Please try again.", isError: true);
      debugPrint("Login Error: $e");
    }
  }

  /// =====================================================
  ///  LOGOUT
  /// =====================================================
  Future<void> logout() async {
    await SharePrefsHelper.remove(AppConstants.bearerToken);
    Get.offAllNamed(AppRoutes.loginScreen);
    showCustomSnackBar("Logged out successfully", isError: false);
  }

  /// =====================================================
  ///  FORGOT PASSWORD (Send Email)
  /// =====================================================
  Future<void> forgotPassword({required String email}) async {
    if (email.isEmpty) {
      showCustomSnackBar("Please enter your email", isError: true);
      return;
    }

    isSignupLoading.value = true;
    final body = {
      "email": email.trim(),
    };

    try {
      final response = await ApiClient.postData(ApiUrl.forgetPassword, jsonEncode(body));
      isSignupLoading.value = false;

      if (response.statusCode == 200 || response.statusCode == 201) {
        showCustomSnackBar("Email sent successfully! Check your inbox.", isError: false);
        Get.toNamed(AppRoutes.otpScreeen);
      } else {
        final msg = response.body['message'] ?? 'Failed to send email';
        showCustomSnackBar(msg, isError: true);
      }
    } catch (e) {
      isSignupLoading.value = false;
      showCustomSnackBar("Network error. Try again.", isError: true);
    }
  }

}
