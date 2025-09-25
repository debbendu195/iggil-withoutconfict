import 'package:get/get.dart';

class TechnicianController extends GetxController {
  var fullName = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var labAssigned = ''.obs;

  // Permissions
  var caseAccessOwn = true.obs;
  var archiveAccessOwn = true.obs;
  var canMessageDoctors = false.obs;
  var qcPermission = false.obs;

  // Lab Locations (dropdown list data)
  List<String> labLocations = [
    "Lab A - New York",
    "Lab B - Los Angeles",
    "Lab C - Chicago",
  ];

  void saveProfile() {
    print('---- Technician Profile Saved ----');
    print('Name: ${fullName.value}');
    print('Email: ${email.value}');
    print('Phone: ${phone.value}');
    print('Lab: ${labAssigned.value}');
    print('Case List Access: ${caseAccessOwn.value ? "Own" : "All"}');
    print('Archive Access: ${archiveAccessOwn.value ? "Own" : "All"}');
    print('Can Message Doctors: ${canMessageDoctors.value}');
    print('QC Permission: ${qcPermission.value}');
  }
}