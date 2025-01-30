import 'package:flutter/material.dart';
import 'package:frontend/spv/working.dart';
import 'package:frontend/spv/home.dart';
import 'package:frontend/spv/account.dart';
import 'package:frontend/spv/search.dart';
import 'package:frontend/spv/button_nav.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardSpv()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Working()),
      );
    } else if (index == 2) {
      showSearchPopup(context);
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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Notifikasi',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFFEAEAEA),
      ),
      backgroundColor: const Color(0xFFEAEAEA),
      body: ListView(
        padding: EdgeInsets.all(screenWidth * 0.04), 
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.blue),
            ),
            padding: EdgeInsets.all(screenWidth * 0.04), 
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info,
                  color: Colors.blue,
                  size: screenWidth * 0.06,
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi!',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        'Jam kerja pegawai berlangsung setiap hari kerja mulai pukul 08.00 pagi hingga 17.00 sore. Mohon pastikan semua keperluan administratif atau komunikasi dilakukan dalam rentang waktu tersebut. Terima kasih.',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          // Notifikasi Hari Ini
          Text(
            'Hari ini',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          _buildNotificationCard(
            icon: Icons.receipt_long,
            title: 'Laporan Ticketing',
            message:
                'Laporan baru diterima: ID #12345ABC. Segera lakukan konfirmasi kepada pelapor.',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
          SizedBox(height: screenHeight * 0.02),
          _buildNotificationCard(
            icon: Icons.notifications,
            title: 'Notif',
            message:
                'Catatan baru telah ditambahkan pada laporan #12345: "Pelapor membutuhkan tindakan cepat karena gangguan besar."',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
          SizedBox(height: screenHeight * 0.03),
          // Notifikasi 1 Hari Lalu
          Text(
            '1 Hari lalu',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          _buildNotificationCard(
            icon: Icons.receipt_long,
            title: 'Laporan Ticketing',
            message:
                'Laporan baru diterima: ID #12345ABC. Segera lakukan konfirmasi kepada pelapor.',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
          SizedBox(height: screenHeight * 0.02),
          _buildNotificationCard(
            icon: Icons.notifications,
            title: 'Notif',
            message:
                'Catatan baru telah ditambahkan pada laporan #12345: "Pelapor membutuhkan tindakan cepat karena gangguan besar."',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildNotificationCard({
    required IconData icon,
    required String title,
    required String message,
    required double screenWidth,
    required double screenHeight,
  }) {
    return Card(
       color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: screenWidth * 0.06,
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    message,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
