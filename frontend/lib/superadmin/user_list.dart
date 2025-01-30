import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/superadmin/home.dart';
import 'package:frontend/superadmin/team_list.dart';
import 'package:frontend/superadmin/add_user.dart';
import 'package:frontend/superadmin/button_nav.dart';

import 'package:frontend/spv/detail_ticket.dart';
import 'package:frontend/spv/notification.dart';
import 'package:frontend/spv/account.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardSuperAdmin()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TeamList()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NotificationPage()),
      );
    } else if (index == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AccountPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFEAEAEA),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "User List",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.black),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailTicket(),
                ),
              );
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFEAEAEA),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              DataTable(
                dataRowHeight: 100.0,
                columnSpacing: 20.0,
                headingRowHeight: 60.0,
                columns: [
                  DataColumn(
                    label: _buildColumnTitle('Nama', 'User'),
                    numeric: false,
                    tooltip: 'Nama User',
                  ),
                  DataColumn(
                    label: _buildColumnTitle('Jabatan', ''),
                    numeric: false,
                    tooltip: "Jabatan",
                  ),
                  DataColumn(
                    label: _buildColumnTitle('Role', 'User'),
                    numeric: false,
                    tooltip: "Role User",
                  ),
                  DataColumn(
                    label: _buildColumnTitle('View', 'Detail'),
                    numeric: false,
                    tooltip: "View Detail",
                  ),
                ],
                rows: [
                  createRow('Muh. Rezky', 'Kepala Dinas', 'Admin', context),
                  createRow('Akbar', 'EOS Telkom', 'EOS', context),
                  createRow('Reza Maulana', 'CS Diskominfo', 'CS', context),
                  createRow('Nasaruddin', 'Dispora', 'SKPD', context),
                  createRow('Ammar', 'Diskominfo', 'Spv', context),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildColumnTitle(String title1, String title2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title1,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        Text(
          title2,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  static DataRow createRow(
      String name, String jabatan, String status, BuildContext context) {
    Color backgroundColor;
    Color textColor = Colors.white;

    if (status == 'Admin') {
      backgroundColor = const Color(0xFF9A2420);
    } else if (status == 'EOS') {
      backgroundColor = const Color(0xFF42C25E);
    } else if (status == 'CS') {
      backgroundColor = const Color(0xFFC2BD42);
    } else if (status == 'SKPD' || status == 'Spv') {
      backgroundColor = const Color(0xFF4282C2);
    } else {
      backgroundColor = Colors.transparent;
    }

    return DataRow(
      cells: [
        DataCell(
          Container(
            width: 75,
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              name,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ),
        DataCell(
          Container(
            width: 75,
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              jabatan,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Container(
              width: 65,
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                status,
                style: GoogleFonts.montserrat(
                  color: textColor,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        DataCell(
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailTicket(),
                ),
              );
            },
            child: Container(
              width: 48.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Image.asset(
                'assets/icons/detail_ticket.png',
                height: 24.0,
                width: 24.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
