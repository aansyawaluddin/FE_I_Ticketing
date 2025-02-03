import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailTicket extends StatelessWidget {
  const DetailTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ticket Detail',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFEAEAEA),
        centerTitle: false,
      ),
      backgroundColor: const Color(0xFFEAEAEA),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  buildStatusItem(
                    "Laporan diterima oleh admin",
                    "7 Februari 2017 | 18:07",
                    Icons.check_circle,
                  ),
                  buildStatusItem(
                    "Laporan telah disampaikan ke Teknisi lapangan",
                    "7 Februari 2017 | 18:07",
                    Icons.check_circle,
                  ),
                  buildStatusItem(
                    "Laporan sementara dikerjakan",
                    "7 Februari 2017 | 18:07",
                    Icons.check_circle,
                    actionLabel: "Lihat",
                    onActionTap: () {},
                  ),
                  buildStatusItem(
                    "Laporan selesai dikerjakan",
                    "7 Februari 2017 | 18:07",
                    Icons.check_circle,
                    actionLabel: "Lihat",
                    onActionTap: () {},
                  ),
                  buildStatusItem(
                    "Review",
                    "",
                    Icons.edit,
                    isLastItem: true,
                  ),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 337,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Hubungi Teknisi",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatusItem(String title, String subtitle, IconData icon,
      {String? actionLabel,
      VoidCallback? onActionTap,
      bool isLastItem = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/icons/check_circle.png',
                width: 24,
                height: 24,
              ),
            ),
            if (!isLastItem)
              Container(
                height: 80,
                width: 2,
                color: Colors.grey,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: const Color(0xFF7D7D7D),
                  ),
                ),
              if (actionLabel != null &&
                  !isLastItem) // Hanya tampilkan "Lihat" jika bukan item terakhir
                GestureDetector(
                  onTap: onActionTap,
                  child: Text(
                    actionLabel,
                    style: GoogleFonts.montserrat(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
