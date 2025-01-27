import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailTicket extends StatelessWidget {
  const DetailTicket({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Ticket',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFEAEAEA),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFEAEAEA),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/detail_ticket.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'ID Ticket',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              '#12345ABC',
              style: GoogleFonts.montserrat(fontSize: 14.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Jaringan Wifi tidak bisa diakses',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              'Makassar, 12/12/2023',
              style: GoogleFonts.montserrat(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
            Text(
              'Dinas Komunikasi dan Informatika',
              style: GoogleFonts.montserrat(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Catatan :',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              'Wifi pada dinas kominfo telah bermasalah selama 10 hari dan telah mengganggu pekerjaan.',
              style: GoogleFonts.montserrat(fontSize: 14.0),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.phone),
                label: Text(
                  'Hubungi EOS',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
