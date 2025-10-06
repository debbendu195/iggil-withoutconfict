import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final storage = GetStorage();
  var locale = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    // Load saved language
    locale.value = storage.read('key') ?? 'en';
    Get.updateLocale(Locale(locale.value));
  }

  void changeLanguage(String langCode) {
    locale.value = langCode;
    Get.updateLocale(Locale(langCode));
    storage.write('key', langCode);
  }

  String getText(String key) {
    return key.tr;
  }
}
