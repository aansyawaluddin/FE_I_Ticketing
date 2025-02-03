import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/pages/superadmin/detail_ticket.dart';

class WorkingList extends StatefulWidget {
  final String teamName;

  const WorkingList({super.key, required this.teamName});

  @override
  _WorkingListState createState() => _WorkingListState();
}

class _WorkingListState extends State<WorkingList> {
  String? selectedStatus;

  List<Map<String, String>> ticketList = [
    {"department": "Dispora", "status": "Belum"},
    {"department": "Diskominfo", "status": "Selesai"},
    {"department": "Dispora", "status": "Proses"},
    {"department": "Dukcapil", "status": "Proses"},
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case "Belum":
        return Colors.redAccent;
      case "Selesai":
        return Colors.green;
      case "Proses":
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Working List",
          style: GoogleFonts.montserrat(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                selectedStatus = value;
              });
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(value: 'Belum', child: Text('Belum')),
                PopupMenuItem(value: 'Proses', child: Text('Proses')),
                PopupMenuItem(value: 'Selesai', child: Text('Selesai')),
              ];
            },
            icon: Icon(Icons.filter_alt),
            color: Colors.white, 
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Text("Nama Tim",
                      style: GoogleFonts.montserrat(
                          fontSize: 12, color: Colors.black)),
                  Text(
                    widget.teamName,
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Divider(
                    color: const Color.fromARGB(137, 143, 143, 143),
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 0),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildHeaderCell("Dinas\nPelapor", width: 80),
                        _buildHeaderCell("Progres\nTicket", width: 130),
                        _buildHeaderCell("Ticket\nDetail", width: 80),
                      ],
                    ),
                  ),
                  ..._filteredTickets().map((ticket) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildDataCell(ticket["department"]!, width: 90),
                          _buildStatusCell(ticket["status"]!,
                              getStatusColor(ticket["status"]!),
                              width: 130),
                          _buildDetailIcon(width: 80),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, {double width = 100}) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDataCell(String text, {double width = 100}) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: GoogleFonts.montserrat(fontSize: 12, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildStatusCell(String status, Color color, {double width = 130}) {
    return SizedBox(
      width: width,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            status,
            style: GoogleFonts.montserrat(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailIcon({double width = 80}) {
    return SizedBox(
      width: width,
      child: Center(
        child: IconButton(
          icon: Image.asset(
            'assets/icons/detail_ticket.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailTicket()),
            );
          },
        ),
      ),
    );
  }

  List<Map<String, String>> _filteredTickets() {
    if (selectedStatus == null) return ticketList;
    return ticketList
        .where((ticket) => ticket['status'] == selectedStatus)
        .toList();
  }
}