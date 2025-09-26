import 'package:flutter/material.dart';

import '../../../../components/custom_nav_bar/practice_managet_navbar.dart';

class PracticeManagerAddCaseScreen extends StatelessWidget {
  const PracticeManagerAddCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Case practice"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Add Case"),
      ),
      bottomNavigationBar: PracticeManagetNavbar(currentIndex: 2),
    );
  }
}
