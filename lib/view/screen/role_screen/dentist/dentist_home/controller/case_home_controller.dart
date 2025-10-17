import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import '../../../../../../service/api_check.dart';
import '../../../../../../service/api_client.dart';
import '../../../../../../service/api_url.dart';
import '../../../../../../utils/app_const/app_const.dart';
import '../model/case_model.dart';

class CaseHomeController extends GetxController {
  ///========================== Variables ==============================

  Rx<Status> getCaseStatus = Status.loading.obs;
  RxList<CaseData> caseList = <CaseData>[].obs;

  ///========================== Get All Cases ===========================

  Future<void> getAllCases() async {
    try {
      getCaseStatus.value = Status.loading;

      final response = await ApiClient.getData(ApiUrl.getAllCase);

      log("Get All Case API Called → Status: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> decodedBody = jsonDecode(response.body);
        final caseModel = CaseModel.fromJson(decodedBody);

        caseList.value = caseModel.data ?? [];
        getCaseStatus.value = Status.completed;
        log("Total Cases Fetched: ${caseList.length}");
      } else {
        getCaseStatus.value = Status.error;
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      getCaseStatus.value = Status.error;
      log("Error fetching cases: $e");
    }
  }

  ///========================== Refresh Cases ===========================
  Future<void> refreshCases() async {
    await getAllCases();
  }

  ///========================== onInit ===========================
  @override
  void onInit() {
    getAllCases();
    super.onInit();
  }
}
