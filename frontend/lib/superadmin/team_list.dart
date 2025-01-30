import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/superadmin/home.dart';
import 'package:frontend/superadmin/user_list.dart';
import 'package:frontend/superadmin/button_nav.dart';

import 'package:frontend/spv/notification.dart';
import 'package:frontend/spv/account.dart';

class TeamList extends StatefulWidget {
  const TeamList({super.key});

  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  int _selectedIndex = 1;

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
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserList()),
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
        title: Text(
          "Team List",
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFEAEAEA),
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
                    label: _buildColumnTitle('Nama', 'Tim'),
                    numeric: false,
                    tooltip: 'Nama\nTim',
                  ),
                  DataColumn(
                    label: _buildColumnTitle('All', 'Ticket'),
                    numeric: false,
                    tooltip: "All Ticket",
                  ),
                  DataColumn(
                    label: _buildColumnTitle('Progres', 'Ticket'),
                    numeric: false,
                    tooltip: "Progres Ticket",
                  ),
                  DataColumn(
                    label: _buildColumnTitle('Customer', 'Review'),
                    numeric: false,
                    tooltip: "Customer Review",
                  ),
                ],
                rows: [
                  createRow('Muh. Rezky', 25, 0.75, "Netral"),
                  createRow('Akbar', 10, 0.50, "Positif"),
                  createRow('Reza Maulana', 25, 0.25, "Negatif"),
                  createRow('Nasaruddin', 25, 0.35, "Netral"),
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
      String name, int allTicket, double progressTicket, String status) {
    Color backgroundColor;
    Color textColor = Colors.white;

    if (status == 'Negatif') {
      backgroundColor = const Color(0xFF9A2420);
    } else if (status == 'Positif') {
      backgroundColor = const Color(0xFF42C25E);
    } else if (status == 'Netral') {
      backgroundColor = const Color(0xFF000000);
    } else {
      backgroundColor = Colors.transparent;
    }

    return DataRow(
      cells: [
        DataCell(
          Align(
            alignment: Alignment.center,
            child: Container(
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
        ),
        DataCell(
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 62,
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                allTicket.toString(),
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 62,
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                '${(progressTicket * 100).toStringAsFixed(0)}%',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 62,
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
      ],
    );
  }
}
