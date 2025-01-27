import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/spv/working.dart';
import 'package:frontend/spv/dashboard.dart';
import 'package:frontend/spv/account.dart';

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
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Working()),
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Notifikasi',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.blue),
            ),
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info,
                  color: Colors.blue,
                  size: 24.0,
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Jam kerja pegawai berlangsung setiap hari kerja mulai pukul 08.00 pagi hingga 17.00 sore. Mohon pastikan semua keperluan administratif atau komunikasi dilakukan dalam rentang waktu tersebut. Terima kasih.',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          // Notifikasi Hari Ini
          Text(
            'Hari ini',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 12.0),
          _buildNotificationCard(
            icon: Icons.receipt_long,
            title: 'Laporan Ticketing',
            message:
                'Laporan baru diterima: ID #12345ABC. Segera lakukan konfirmasi kepada pelapor.',
          ),
          SizedBox(height: 12.0),
          _buildNotificationCard(
            icon: Icons.notifications,
            title: 'Notif',
            message:
                'Catatan baru telah ditambahkan pada laporan #12345: "Pelapor membutuhkan tindakan cepat karena gangguan besar."',
          ),
          SizedBox(height: 24.0),
          // Notifikasi 1 Hari Lalu
          Text(
            '1 Hari lalu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 12.0),
          _buildNotificationCard(
            icon: Icons.receipt_long,
            title: 'Laporan Ticketing',
            message:
                'Laporan baru diterima: ID #12345ABC. Segera lakukan konfirmasi kepada pelapor.',
          ),
          SizedBox(height: 12.0),
          _buildNotificationCard(
            icon: Icons.notifications,
            title: 'Notif',
            message:
                'Catatan baru telah ditambahkan pada laporan #12345: "Pelapor membutuhkan tindakan cepat karena gangguan besar."',
          ),
        ],
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

  Widget _buildNotificationCard({
    required IconData icon,
    required String title,
    required String message,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 24.0,
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
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
}
