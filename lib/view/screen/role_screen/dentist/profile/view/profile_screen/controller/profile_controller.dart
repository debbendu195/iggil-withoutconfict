import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../../../helper/shared_prefe/shared_prefe.dart';
import '../../../../../../../../service/api_client.dart';
import '../../../../../../../../service/api_url.dart';
import '../../../../../../../../utils/ToastMsg/toast_message.dart';
import '../../../../../../../../utils/app_const/app_const.dart';

class ProfileController extends GetxController {
  final Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  /// Pick image from gallery
  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  /// Pick image from camera
  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  // Text controllers
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> dateOfBirthController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> newPasswordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  Rx<TextEditingController> oldPasswordController = TextEditingController().obs;

  RxBool updateProfileLoading = false.obs;
  void resetPasswordFields() {
    oldPasswordController.value.clear();
    newPasswordController.value.clear();
    confirmPasswordController.value.clear();
  }
  //========== Update Profile ==========
  Future<void> updateProfile() async {
    updateProfileLoading.value = true;
    refresh();

    try {
      Map<String, String> body = {
        "name": nameController.value.text.trim(),
        "phoneNumber": phoneNumberController.value.text.trim(),
        "dateOfBirth": dateOfBirthController.value.text,
        "country": countryController.value.text,
      };

      dynamic response;
      if (selectedImage.value != null) {
        response = await ApiClient.patchMultipartData(ApiUrl.updateProfile, body,
          multipartBody: [
            MultipartBody("file", selectedImage.value!),
          ],
        );
      } else {
        response = await ApiClient.patchData(ApiUrl.updateProfile, jsonEncode(body),);
      }

      updateProfileLoading.value = false;
      refresh();

      Map<String, dynamic> jsonResponse = response.body is String
          ? jsonDecode(response.body)
          : response.body as Map<String, dynamic>;

      if (response.statusCode == 200 || response.statusCode == 201) {
        showCustomSnackBar(
          jsonResponse['message']?.toString() ?? "Profile updated successfully!",
          isError: false,
        );

        String? userRole = await SharePrefsHelper.getString(AppConstants.role);
        resetPasswordFields();
        if (userRole.toLowerCase() == "host") {
          Get.offAllNamed(AppRoutes.profileScreen);
        } else {
          // Get.offAllNamed(AppRoutes.dmProfileScreen);
        }
      } else {
        showCustomSnackBar(
          jsonResponse['message']?.toString() ?? "Update failed",
          isError: true,
        );
      }
    } catch (e) {
      updateProfileLoading.value = false;
      refresh();
      showCustomSnackBar(
        "An error occurred. Please try again.",
        isError: true,
      );
      debugPrint("Profile update error: $e");
    }
  }
  //========== Update Profile ==========
  Future<void> changePassword() async {
    updateProfileLoading.value = true;
    refresh();

    try {
      Map<String, String> body = {
        "newpassword": newPasswordController.value.text.trim(),
        "oldpassword": oldPasswordController.value.text.trim(),
      };

      dynamic response = await ApiClient.patchData(ApiUrl.changePassword, jsonEncode(body),);
      updateProfileLoading.value = false;
      refresh();

      Map<String, dynamic> jsonResponse = response.body is String
          ? jsonDecode(response.body)
          : response.body as Map<String, dynamic>;

      if (response.statusCode == 200 || response.statusCode == 201) {
        showCustomSnackBar(
          jsonResponse['message']?.toString() ?? "Change password successfully!", isError: false,
        );
        String? userRole = await SharePrefsHelper.getString(AppConstants.role);
        resetPasswordFields();
        if (userRole.toLowerCase() == "host") {
          Get.offAllNamed(AppRoutes.profileScreen);
        } else {
          // Get.offAllNamed(AppRoutes.dmProfileScreen);
        }
      } else {
        showCustomSnackBar(
          jsonResponse['message']?.toString() ?? "Change password failed",
          isError: true,
        );
      }
    } catch (e) {
      updateProfileLoading.value = false;
      refresh();
      showCustomSnackBar(
        "An error occurred. Please try again.",
        isError: true,
      );
      debugPrint("Password update error: $e");
    }
  }

//========== getUserProfile controller ==========
  final rxRequestStatus = Status.loading.obs;
  void setRequestStatus(Status status) => rxRequestStatus.value = status;

  Rx<UserProfileModel> userProfileModel = UserProfileModel(
      id: '', name: '', email: '', phoneNumber: '', dateOfBirth: '', photo: ''
  ).obs;

  Future<void> getUserProfile() async {
    final userId = await SharePrefsHelper.getString(AppConstants.userId);

    var response = await ApiClient.getData(ApiUrl.myProfile);

    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        var data = response.body['data'];
        userProfileModel.value = UserProfileModel.fromJson(data);

        if (nameController.value.text.isEmpty) {
          nameController.value.text = userProfileModel.value.name;
        }
        emailController.value.text = userProfileModel.value.email;
        if (phoneNumberController.value.text.isEmpty) {
          phoneNumberController.value.text = userProfileModel.value.phoneNumber;
        }
        if (dateOfBirthController.value.text.isEmpty) {
          dateOfBirthController.value.text = userProfileModel.value.dateOfBirth;
        }

        setRequestStatus(Status.completed);
        update();
      } catch (e) {
        setRequestStatus(Status.error);
        debugPrint("Parsing error: $e");
      }
    } else {
      setRequestStatus(Status.error);
      Get.snackbar("Error", "Failed to load user profile.");
    }
  }


  //========== Get Terms & Conditions controller ==========

  // final rxTermsStatus = Status.loading.obs;
  // void setTermsStatus(Status value) {
  //   rxTermsStatus.value = value;
  // }
  //
  // Rx<TermsModel> termsModel = TermsModel().obs;
  // Future<void> getTermsConditions() async {
  //   var response = await ApiClient.getData(ApiUrl.termsCondition);
  //   if (response.statusCode == 200) {
  //     try {
  //       rxTermsStatus.value = Status.completed;
  //       var data = response.body["data"];
  //       termsModel.value = TermsModel.fromJson(data);
  //       debugPrint(
  //           '======================================>Profile Image ${termsModel.value.toJson()}');
  //       refresh();
  //     } catch (e) {
  //       // Catch parsing issues
  //       setTermsStatus(Status.error);
  //       debugPrint("Parsing error: $e");
  //       refresh();
  //     }
  //   }else if(response.statusCode == 404){
  //     rxTermsStatus.value =Status.error;
  //     //  setAboutStatus(Status.error);
  //     termsModel.value = TermsModel();
  //   }
  //   else {
  //     if (response.statusText == ApiClient.somethingWentWrong) {
  //       setTermsStatus(Status.internetError);
  //     } else {
  //       setTermsStatus(Status.error);
  //     }
  //     // ApiChecker.checkApi(response);
  //     refresh();
  //   }
  // }

  //==================== Get Privacy Policy =================
  final rxPrivacyPolicyStatus = Status.loading.obs;
  void setPrivacyPolicyStatus(Status value) {
    rxPrivacyPolicyStatus.value = value;
  }

  // Rx<PrivacyModel> privacyModel = PrivacyModel().obs;
  //
  // Future<void> getPrivacyPolicy() async {
  //   try {
  //     setRequestStatus(Status.loading); // Assuming you have a general Status for requests
  //
  //     final userId = await SharePrefsHelper.getString(AppConstants.userId);
  //
  //     final response = await ApiClient.getData(ApiUrl.privacyPolicy);
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       var data = response.body['data'];
  //       privacyModel.value = PrivacyModel.fromJson(data);
  //
  //       setRequestStatus(Status.completed);
  //       // debugPrint("✅ PrivacyPolicy loaded: ${privacyModel.value.toJson()}");
  //     } else if (response.statusCode == 404) {
  //       privacyModel.value = PrivacyModel();
  //       setRequestStatus(Status.error);
  //       Get.snackbar("Error", "Privacy policy not found.");
  //     } else {
  //       setRequestStatus(Status.error);
  //       Get.snackbar("Error", "Failed to load privacy policy.");
  //     }
  //   } catch (e) {
  //     setRequestStatus(Status.error);
  //     debugPrint("PrivacyPolicy parsing error: $e");
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
  }
}

class UserProfileModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  final String photo;

  UserProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.photo,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      photo: json['photo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
      'photo': photo,
    };
  }
}

class Verification {
  final dynamic code;
  final dynamic expireDate;

  Verification({
    this.code,
    this.expireDate,
  });

  factory Verification.fromRawJson(String str) =>
      Verification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
    code: json["code"],
    expireDate: json["expireDate"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "expireDate": expireDate,
  };
}


