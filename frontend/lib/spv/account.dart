import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/login.dart';
import 'package:frontend/spv/dashboard.dart';
import 'package:frontend/spv/working.dart';
import 'package:frontend/spv/notification.dart';

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
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Working()),
        );
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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
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
            _buildEditableCard('Name', name, (newValue) {
              setState(() {
                name = newValue;
              });
            }),
            _buildEditableCard('Email', email, (newValue) {
              setState(() {
                email = newValue;
              });
            }),
            _buildEditableCard('SKPD', skpd, null, isEditable: false),
            _buildEditableCard('Phone', phone, (newValue) {
              setState(() {
                phone = newValue;
              });
            }),
            _buildEditableCard('Username', username, (newValue) {
              setState(() {
                username = newValue;
              });
            }),
            const SizedBox(height: 20),
            ElevatedButton(
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
                'Logout',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
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

  Widget _buildEditableCard(
      String label, String value, Function(String)? onChanged,
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
              '$label: $value',
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
                  _showEditDialog(label, value, onChanged);
                },
              ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(
      String label, String currentValue, Function(String)? onChanged) {
    TextEditingController controller =
        TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $label'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter new $label'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
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
