import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TechnicianContractPage extends StatelessWidget {
  const TechnicianContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Contact Us', color: AppColors.primary,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Email Row
                Row(
                  children: const [
                    Icon(Icons.email_outlined, color: Colors.black),
                    SizedBox(width: 15),
                    Text(
                      "info@gmail.com",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Phone Row
                Row(
                  children: const [
                    Icon(Icons.phone, color: Colors.black),
                    SizedBox(width: 15),
                    Text(
                      "+4401622231389",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // WhatsApp Row
                Row(
                  children: const [
                    Icon(FontAwesomeIcons.whatsapp, color: Colors.black, size: 24, weight: 24,),
                    SizedBox(width: 15),
                    Text(
                      "+4401622231389",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
