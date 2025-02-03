import 'package:flutter/material.dart';
import 'package:frontend/pages/spv/home.dart';
import 'package:frontend/pages/spv/working.dart';
import 'package:frontend/pages/spv/notification.dart';
import 'package:frontend/pages/spv/account.dart';
import 'package:frontend/widgets/search.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PersistentBottomSheetController? _bottomSheetController;

  final List<Widget> _pages = [
    DashboardSpv(),
    Working(),
    Scaffold(),
    NotificationPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      return;
    }
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
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
                  icon: Icon(null),
                  label: 'Search',
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
          ),
          Positioned(
            top: -30,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: Builder(builder: (context) {
              return FloatingActionButton(
                onPressed: () {
                  if (_bottomSheetController == null) {
                    _bottomSheetController =
                        Scaffold.of(context).showBottomSheet(
                      (BuildContext context) => SearchDrawer(),
                    );
                    _bottomSheetController!.closed.then((_) {
                      _bottomSheetController = null;
                    });
                  } else {
                    _bottomSheetController!.close();
                    _bottomSheetController = null;
                  }
                },
                backgroundColor: const Color(0xFF4282C2),
                shape: const CircleBorder(),
                child: const Icon(Icons.search, color: Colors.white),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String assetPath, int index) {
    return Image.asset(
      assetPath,
      width: 24.0,
      height: 24.0,
      color: _selectedIndex == index ? Colors.blue : Colors.black,
    );
  }
}
