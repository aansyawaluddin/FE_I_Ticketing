import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: _buildIcon('assets/icons/home.png', 0, selectedIndex),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon('assets/icons/working.png', 1, selectedIndex),
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
          icon: _buildIcon('assets/icons/notifikasi.png', 3, selectedIndex),
          label: 'Notifikasi',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon('assets/icons/account.png', 4, selectedIndex),
          label: 'Account',
        ),
      ],
    );
  }

  Widget _buildIcon(String assetPath, int index, int selectedIndex) {
    Color color = selectedIndex == index ? Colors.blue : Colors.black;
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
