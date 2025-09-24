import 'package:flutter/material.dart';

import '../../../../components/custom_nav_bar/lab_manager_navbar.dart';

class LabManagerMyCaseScreen extends StatelessWidget {
  const LabManagerMyCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Case"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Add Case"),
      ),
      bottomNavigationBar: LabManagerNavbar(currentIndex: 2),
    );
  }
}
