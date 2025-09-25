import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/screen/role_screen/lab_manager/lab_manager_home_screen/view/lab_profile_managment/controller/technician_controller.dar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTechnicianProfile extends StatelessWidget {
  final controller = Get.put(TechnicianController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Create Lab Managmant Profile', color: AppColors.primary,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile picture uploader
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.person, size: 60, color: Colors.grey),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 18,
                      child:
                          Icon(Icons.camera_alt, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Center(
                child: Text("Add Profile Picture",
                    style: TextStyle(color: Colors.black54))),

            const SizedBox(height: 20),
            Text("Technician Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green)),

            const SizedBox(height: 12),
            buildTextField("Full Name *", "Enter full name",
                (val) => controller.fullName.value = val),
            buildTextField("Email *", "Enter email",
                (val) => controller.email.value = val),
            buildTextField("Phone Number", "Enter phone number",
                (val) => controller.phone.value = val,
                keyboardType: TextInputType.phone),

            const SizedBox(height: 12),
            Text("Lab Assigned", style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),

            Obx(() => DropdownButtonFormField<String>(
                  value: controller.labAssigned.value.isEmpty
                      ? null
                      : controller.labAssigned.value,
                  isExpanded: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                  ),
                  hint: Text("Select lab location"),
                  items: controller.labLocations.map((lab) {
                    return DropdownMenuItem(value: lab, child: Text(lab));
                  }).toList(),
                  onChanged: (value) => controller.labAssigned.value = value!,
                )),

            const SizedBox(height: 20),
            Text("Permissions",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green)),

            const SizedBox(height: 16),
            Obx(() => buildPermissionRow(
                "Case List Access",
                "Own / All cases",
                controller.caseAccessOwn.value,
                (own) => controller.caseAccessOwn.value = own)),
            Obx(() => buildPermissionRow(
                "Archives Access",
                "Own / All archives",
                controller.archiveAccessOwn.value,
                (own) => controller.archiveAccessOwn.value = own)),

            Obx(() => buildSwitch(
                "Send Messages to Doctors",
                "Communication access",
                controller.canMessageDoctors.value,
                (val) => controller.canMessageDoctors.value = val)),

            Obx(() => buildSwitch(
                "Quality Check Permission",
                "QC access and approval",
                controller.qcPermission.value,
                (val) => controller.qcPermission.value = val)),

            const SizedBox(height: 30),
            // Save and Cancel Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => controller.saveProfile(),
                child: Text("Save Profile", style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => Get.back(),
                child: Text("Cancel",
                    style: TextStyle(color: Colors.green, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---- Reusable UI Widgets ----

  Widget buildTextField(String label, String hint, Function(String) onChanged,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget buildPermissionRow(
      String title, String subtitle, bool own, Function(bool) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        Row(
          children: [
            Text(subtitle, style: TextStyle(color: Colors.grey)),
            Spacer(),
            ToggleButtons(
              isSelected: [own, !own],
              borderRadius: BorderRadius.circular(25),
              selectedColor: Colors.white,
              fillColor: Colors.green,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Own")),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("All")),
              ],
              onPressed: (index) => onChanged(index == 0),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget buildSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
                Text(subtitle, style: TextStyle(color: Colors.grey)),
              ],
            )),
            Switch(
                value: value, onChanged: onChanged, activeColor: Colors.green),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
