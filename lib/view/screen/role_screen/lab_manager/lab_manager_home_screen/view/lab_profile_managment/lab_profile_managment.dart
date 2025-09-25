import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_const/app_const.dart';
import 'package:event_platform/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/app_colors/app_colors.dart';

class LabProfileManagment extends StatelessWidget {
  LabProfileManagment({super.key});

  final List<Map<String, String>> profiles = [
    {
      "title": "Medical Report",
      "subtitle": "Lab Technician",
      "image": "assets/images/profile.jpg"
    },
    {
      "title": "X-Ray Report",
      "subtitle": "Radiologist",
      "image": "assets/images/profile.jpg"
    },
    {
      "title": "Blood Test",
      "subtitle": "Lab Technician",
      "image": "assets/images/profile.jpg"
    },
    {
      "title": "CT Scan Report",
      "subtitle": "Radiologist",
      "image": "assets/images/profile.jpg"
    },
    {
      "title": "ECG Report",
      "subtitle": "Cardiologist",
      "image": "assets/images/profile.jpg"
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Create Profile List', color: AppColors.primary,),
      // ================================== appbar end ====================//
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search by Patient ID or Case No.",
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green),
                  padding: EdgeInsets.symmetric(vertical: 16,horizontal: 4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.createTechnicianProfile);
                },
                child: Text(
                  "Create new profile",
                  style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),


            const SizedBox(height: 16),

            // Profile List
            Expanded(
              child: ListView.builder(

                itemCount: profiles.length,
                itemBuilder: (context, index) {
                  final profile = profiles[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0.5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        child: ClipOval(
                          child: CustomNetworkImage(
                            imageUrl: AppConstants.profileImage,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                      title: Text(
                        "Medical Report",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text("Lab Technician"),
                      trailing: Icon(Icons.more_vert),
                    )

                  );
                },
              ),
            ),
          ],
        ),
      ),

      // bottomNavigationBar: NavBar(currentIndex: 0),

    );
  }
}
