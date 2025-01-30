import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/login.dart';
import 'package:frontend/spv/home.dart';
import 'package:frontend/spv/working.dart';
import 'package:frontend/spv/notification.dart';
import 'package:frontend/spv/search.dart';
import 'package:frontend/spv/button_nav.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 4;
  String name = 'Reza Maulana';
  String email = 'rezamaulana@gmail.com';
  String skpd = 'SKPD';
  String phone = '+62 82333421454';
  String username = 'supervisor1';

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
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
      } else if (index == 3) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NotificationPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Profil',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFEAEAEA),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEAEAEA),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFEAEAEA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  child:
                      const Icon(Icons.person, size: 60, color: Colors.white),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Supervisor 1',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const Divider(height: 30, thickness: 1, indent: 20, endIndent: 20),
            _buildEditableCard(name, (newValue) {
              setState(() {
                name = newValue;
              });
            }),
            _buildEditableCard(email, (newValue) {
              setState(() {
                email = newValue;
              });
            }),
            _buildEditableCard(skpd, null, isEditable: false),
            _buildEditableCard(phone, (newValue) {
              setState(() {
                phone = newValue;
              });
            }),
            _buildEditableCard(username, (newValue) {
              setState(() {
                username = newValue;
              });
            }),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(screenWidth - 40, 50),
                ),
                child: Text(
                  'Keluar',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildEditableCard(String value, Function(String)? onChanged,
      {bool isEditable = true}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isEditable)
              IconButton(
                icon: const Icon(Icons.edit_outlined, color: Colors.black),
                onPressed: () {
                  _showEditDialog(value, onChanged);
                },
              ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(String currentValue, Function(String)? onChanged) {
    TextEditingController controller = TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Masukkan nilai baru'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                if (onChanged != null) {
                  onChanged(controller.text);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
