import 'dart:developer';
import 'package:get/get.dart';
import '../../../../../../service/api_check.dart';
import '../../../../../../service/api_client.dart';
import '../../../../../../service/api_url.dart';
import '../../../../../../utils/app_const/app_const.dart';
import '../model/case_model.dart';
import '../view/case_page/single_case_model/single_model.dart';

class CaseHomeController extends GetxController {
  ///========================== State ===========================
  Rx<Status> getCaseStatus = Status.loading.obs;
  RxList<CaseData> caseList = <CaseData>[].obs;
  RxInt currentPage = 1.obs;
  RxInt totalPages = 1.obs;
  RxBool isLoadingMore = false.obs;

  ///========================== Get All Cases ===========================
  Future<void> getAllCases({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        currentPage.value = 1;
        caseList.clear();
      }

      // Only show loading if first page
      if (currentPage.value == 1 && !isRefresh) {
        getCaseStatus.value = Status.loading;
      }

      final response = await ApiClient.getData(ApiUrl.getAllCase(page: currentPage.value),);

      log("📦 Get All Case API Called → Page: ${currentPage.value} | Status: ${response.statusCode}");
      log("📦 Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // response.body is already Map<String, dynamic>
        final caseModel = CaseModel.fromJson(response.body);

        if (caseModel.data != null) {
          if (isRefresh || currentPage.value == 1) {
            caseList.value = caseModel.data!;
          } else {
            caseList.addAll(caseModel.data!);
          }
        }

        totalPages.value = caseModel.pagination?.totalPages ?? 1;
        getCaseStatus.value = Status.completed;
      } else {
        getCaseStatus.value = Status.error;
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      getCaseStatus.value = Status.error;
      log("❌ Error fetching cases: $e");
    }
  }


  ///========================== Get Single Cases ===========================
  Rx<Status> getSingleCaseStatus = Status.loading.obs;
  Rx<CaseDetailsData?> singleCaseData = Rx<CaseDetailsData?>(null);

  Future<void> getSingleCasesData({required String caseId}) async {
    try {
      getSingleCaseStatus.value = Status.loading;

      final response =
      await ApiClient.getData(ApiUrl.getSingleCase(caseId: caseId));

      log("📦 Get Single Case API Called → ID: $caseId | Status: ${response.statusCode}");
      log("📦 Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final caseModel = CaseDetailsModel.fromJson(response.body);

        if (caseModel.data != null) {
          singleCaseData.value = caseModel.data!;
          getSingleCaseStatus.value = Status.completed;
          log("✅ Case Loaded: ${singleCaseData.value?.patientID}");
        } else {
          getSingleCaseStatus.value = Status.error;
          log("⚠️ No data found for case $caseId");
        }
      } else {
        getSingleCaseStatus.value = Status.error;
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      getSingleCaseStatus.value = Status.error;
      log("❌ Error fetching single case: $e");
    }
  }

  ///========================== Load More ===========================
  Future<void> loadMoreCases() async {
    if (isLoadingMore.value) return;
    if (currentPage.value >= totalPages.value) return;

    try {
      isLoadingMore.value = true;
      currentPage.value += 1;
      await getAllCases();
    } finally {
      isLoadingMore.value = false;
    }
  }

  ///========================== Initialize ===========================
  @override
  void onInit() {
    getAllCases();
    super.onInit();
  }
}
