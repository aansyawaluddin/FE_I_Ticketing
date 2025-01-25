import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/dashboard.dart';
import 'package:frontend/detail_ticket.dart';

class Working extends StatefulWidget {
  const Working({super.key});

  @override
  _WorkingState createState() => _WorkingState();
}

class _WorkingState extends State<Working> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Working List",
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFEAEAEA),
      ),
      backgroundColor: const Color(0xFFEAEAEA),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            dataRowHeight: 80.0,
            columnSpacing: 20.0,
            headingRowHeight: 60.0,
            columns: [
              DataColumn(
                label: _buildColumnTitle('Nama', 'Tim EOS'),
                numeric: false,
                tooltip: 'Nama\nTim EOS',
              ),
              DataColumn(
                label: _buildColumnTitle('Dinas', 'Pelapor'),
                numeric: false,
                tooltip: "Dinas Pelapor",
              ),
              DataColumn(
                label: _buildColumnTitle('Progres', 'Ticket'),
                numeric: false,
                tooltip: "Progres Ticket",
              ),
              DataColumn(
                label: _buildColumnTitle('Ticket', 'Detail'),
                numeric: false,
                tooltip: "Ticket Detail",
              ),
            ],
            rows: [
              createRow('Muh. Rezky', 'Dispora', 'Belum', context),
              createRow('Akbar', 'Diskominfo', 'Selesai', context),
              createRow('Reza Maulana', 'Dispora', 'Proses', context),
              createRow('Nasaruddin', 'Dukcapil', 'Proses', context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/home.png', 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/working.png', 1),
            label: 'Working List',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Container(
                width: screenWidth * 0.13,
                height: screenWidth * 0.13,
                decoration: const BoxDecoration(
                  color: Color(0xFF4282C2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/lapor.png',
                    width: screenWidth * 0.05,
                    height: screenHeight * 0.03,
                  ),
                ),
              ),
            ),
            label: 'Lapor',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/notifikasi.png', 3),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/account.png', 4),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildColumnTitle(String title1, String title2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget _buildIcon(String assetPath, int index) {
    Color color = _selectedIndex == index ? Colors.blue : Colors.black;
    return ColorFiltered(
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      child: Image.asset(
        assetPath,
        width: 24.0,
        height: 24.0,
      ),
    );
  }

  static DataRow createRow(
      String name, String department, String status, BuildContext context) {
    Color backgroundColor;
    Color textColor = Colors.white;

    if (status == 'Belum') {
      backgroundColor = const Color(0xFF9A2420);
    } else if (status == 'Selesai') {
      backgroundColor = const Color(0xFF42C25E);
    } else if (status == 'Proses') {
      backgroundColor = const Color(0xFFC2BD42);
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
              department,
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
