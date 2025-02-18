import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/pages/spv/detail_ticket.dart';

class Working extends StatefulWidget {
  const Working({super.key});

  @override
  _WorkingState createState() => _WorkingState();
}

class _WorkingState extends State<Working> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
            ],
          ),
        ),
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
