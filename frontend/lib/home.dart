import 'package:flutter/material.dart';
import 'package:frontend/pages/spv/home.dart';
import 'package:frontend/pages/spv/working.dart';
import 'package:frontend/pages/spv/notification.dart';
import 'package:frontend/pages/spv/account.dart';
import 'package:frontend/widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const customer_service_pages = [
    DashboardSpv(),
    Working(),
    Scaffold(),
    NotificationPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavbar(customer_service_pages);
  }
}