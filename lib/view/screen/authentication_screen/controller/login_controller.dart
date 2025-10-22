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
      var response = await ApiClient.postData(ApiUrl.login, jsonEncode(body));

      loginLoading.value = false;
      refresh();

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> jsonResponse =
        response.body is String ? jsonDecode(response.body) : response.body;

        debugPrint('Full Login Response: $jsonResponse');

        showCustomSnackBar(
          jsonResponse['message']?.toString() ?? "Login successful",
          isError: false,
        );

        //Check if accessToken exists before converting to string
        var accessTokenRaw = jsonResponse['accessToken'];

        if (accessTokenRaw == null) {
          showCustomSnackBar(
            "Login failed: No access token received",
            isError: true,
          );
          return;
        }

        String accessToken = accessTokenRaw.toString();
        debugPrint('Access Token: $accessToken');

        await SharePrefsHelper.setString(AppConstants.bearerToken, accessToken);

        // Decode token
        try {
          Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
          debugPrint('Decoded Token: $decodedToken');

          var userIdRaw = decodedToken['_id'];
          var userRoleRaw = decodedToken['role'];

          debugPrint('Raw User ID: $userIdRaw');
          debugPrint('Raw User Role: $userRoleRaw');

          if (userIdRaw == null) {
            showCustomSnackBar(
              "Token error: User ID missing from token",
              isError: true,
            );
            return;
          }

          if (userRoleRaw == null) {
            showCustomSnackBar(
              "Token error: User role missing from token",
              isError: true,
            );
            return;
          }

          String userId = userIdRaw.toString();
          String userRole = userRoleRaw.toString();

          debugPrint('User ID: $userId');
          debugPrint('User Role: $userRole');

          await SharePrefsHelper.setString(AppConstants.userId, userId);
          await SharePrefsHelper.setString(AppConstants.role, userRole);

          // Verify what was saved
          final savedToken = await SharePrefsHelper.getString(AppConstants.bearerToken);
          final savedUserId = await SharePrefsHelper.getString(AppConstants.userId);
          final savedRole = await SharePrefsHelper.getString(AppConstants.role);

          debugPrint('Saved Token: $savedToken');
          debugPrint('Saved User ID: $savedUserId');
          debugPrint('Saved Role: $savedRole');

          // Navigate based on role
          if (userRole.toLowerCase() == "dentist") {
            Get.offAllNamed(AppRoutes.dentistListScreen);
          } else {
            Get.offAllNamed(AppRoutes.labManagerListScreen);
          }

        } catch (tokenError) {
          debugPrint('Token Decode Error: $tokenError');
          showCustomSnackBar(
            "Failed to decode token. Please contact support.",
            isError: true,
          );
          return;
        }

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

  ///  LOGOUT
  Future<void> logout() async {
    await SharePrefsHelper.remove(AppConstants.bearerToken);
    Get.offAllNamed(AppRoutes.loginScreen);
    showCustomSnackBar("Logged out successfully", isError: false);
  }

  ///  FORGOT PASSWORD (Send Email)
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
