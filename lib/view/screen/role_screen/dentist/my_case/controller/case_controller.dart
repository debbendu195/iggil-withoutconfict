import 'package:get/get.dart';
class CaseController extends GetxController {
  RxInt currentIndex = 0.obs;
  ///============= tab bar ==========
  RxList<String> tabNamelist =
      <String>['All', 'In Progress', 'Completed'].obs;
}