import 'package:event_platform/view/components/custom_nav_bar/nurse_navbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../components/custom_royel_appbar/custom_royel_appbar.dart';

class NurseAddCaseScreen extends StatelessWidget {
  const NurseAddCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true),
      body: CustomText(text: 'Add Case Screen'),
      bottomNavigationBar: NurseNavbar(currentIndex: 2),
    );
  }
}
