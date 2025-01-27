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

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
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
                icon: const SizedBox.shrink(),
                label: '',
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
          ),
        ),
        Positioned(
          top: -20,
          left: (screenWidth / 2) - (screenWidth * 0.13 / 2),
          child: GestureDetector(
            onTap: () => onItemTapped(2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: screenWidth * 0.13,
                  height: screenWidth * 0.13,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4282C2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: _buildIcon('assets/icons/search.png', 2, selectedIndex),
                  ),
                ),
                const SizedBox(height: 0),
                const Text(
                  'Lapor',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIcon(String assetPath, int index, int selectedIndex) {
    if (index == 2) {
      return Image.asset(
        assetPath,
        width: 24.0,
        height: 24.0,
      );
    }

    Color color = selectedIndex == index ? Colors.blue : Colors.black;
    return Image.asset(
      assetPath,
      width: 24.0,
      height: 24.0,
      color: color,
    );
  }
}
