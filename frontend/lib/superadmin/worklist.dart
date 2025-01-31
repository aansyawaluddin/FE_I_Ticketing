import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/superadmin/detail_ticket.dart';

class WorkingList extends StatefulWidget {
  final String teamName;
  const WorkingList({super.key, required this.teamName});

  @override
  _WorkingState createState() => _WorkingState();
}

class _WorkingState extends State<WorkingList> {
  String? selectedStatus;

  // Data untuk tabel
  List<Map<String, String>> ticketData = [
    {'department': 'Dispora', 'status': 'Belum'},
    {'department': 'Diskominfo', 'status': 'Selesai'},
    {'department': 'Dispora', 'status': 'Proses'},
    {'department': 'Dukcapil', 'status': 'Proses'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Working List",
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFEAEAEA),
        actions: [
          PopupMenuTheme(
            data: PopupMenuThemeData(
              color: const Color(0xFFEAEAEA), 
            ),
            child: IconButton(
              icon: Icon(Icons.filter_alt),
              onPressed: () {
                _showFilterMenu(context);
              },
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFEAEAEA),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Nama Tim',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ' ${widget.teamName}',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: DataTable(
                  dataRowHeight: 100.0,
                  columnSpacing: 50.0,
                  headingRowHeight: 60.0,
                  columns: [
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
                  rows: _getFilteredRows(),
                ),
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

  List<DataRow> _getFilteredRows() {
    List<Map<String, String>> filteredData = selectedStatus == null
        ? ticketData
        : ticketData.where((ticket) => ticket['status'] == selectedStatus).toList();

    return filteredData.map((ticket) {
      return createRow(ticket['department']!, ticket['status']!, context);
    }).toList();
  }

  static DataRow createRow(String department, String status, BuildContext context) {
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
            width: 90,
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
              width: 70,
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

 void _showFilterMenu(BuildContext context) async {
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(300, 100, 20, 0),
    elevation: 8.0,
    items: [
      PopupMenuItem<String>(
        value: 'Belum',
        child: Text('Belum'),
      ),
      PopupMenuItem<String>(
        value: 'Proses',
        child: Text('Proses'),
      ),
      PopupMenuItem<String>(
        value: 'Selesai',
        child: Text('Selesai'),
      ),
    ],
  ).then((value) {
    if (value != null) {
      setState(() {
        selectedStatus = value;
      });
    }
  });
}

}
