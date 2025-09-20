import 'package:flutter/material.dart';

import '../../../../../components/custom_nav_bar/technician_navbar.dart';


class TechnicianChatScreen extends StatelessWidget {
  const TechnicianChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is chat screen'),
      bottomNavigationBar: TechnicianNavbar(currentIndex: 2),
    );
  }
}
