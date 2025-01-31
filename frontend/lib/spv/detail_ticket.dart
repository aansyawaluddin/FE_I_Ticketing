import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailTicket extends StatelessWidget {
  const DetailTicket({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Ticket',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: screenWidth * 0.05, 
          ),
        ),
        backgroundColor: const Color(0xFFEAEAEA),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFEAEAEA),
      body: Padding(
        padding:
            EdgeInsets.all(screenWidth * 0.04), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/detail_ticket.png',
                height: screenHeight * 0.25,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'ID Ticket',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              '#12345ABC',
              style: GoogleFonts.montserrat(fontSize: screenWidth * 0.035),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Jaringan Wifi tidak bisa diakses',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Makassar, 12/12/2023',
              style: GoogleFonts.montserrat(
                fontSize: screenWidth * 0.035,
                color: Colors.grey[600],
              ),
            ),
            Text(
              'Dinas Komunikasi dan Informatika',
              style: GoogleFonts.montserrat(
                fontSize: screenWidth * 0.035,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Catatan :',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Wifi pada dinas kominfo telah bermasalah selama 10 hari dan telah mengganggu pekerjaan.',
              style: GoogleFonts.montserrat(fontSize: 16),
            ),
            Spacer(),
            SizedBox(
              width: screenWidth * 0.9,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.phone),
                label: Text(
                  'Hubungi EOS',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.04),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
