import 'package:get/get.dart';

class CaseStatusController extends GetxController {
  // Initial value = Submitted
  var selectedStatus = "Submitted".obs;

  final List<String> statusList = [
    "Submitted",
    "Accepted",
    "Processing",
    "Dispatch",
  ];

  void updateStatus(String status) {
    selectedStatus.value = status;
  }
}
