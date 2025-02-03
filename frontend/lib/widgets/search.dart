import 'package:flutter/material.dart';

class SearchDrawer extends StatelessWidget {
  final List<String> recentSearches = [
    'jaringan wifi rusak',
    'diskominfo',
    'ID #12345ABC',
    'reza',
  ];

  final List<String> chips = [
    'Diskominfo',
    'Dispora',
    'jaringan wifi',
    'ID #12345ABC',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75, 
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Padding(
              padding: const EdgeInsets.all(0),
              child: Transform.translate(offset: Offset(0, -14),child: Icon(Icons.minimize_rounded, color: Colors.grey, size: 45, )),
            )],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Chips section
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: chips.map((String label) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(
                            label,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          backgroundColor: Color(0xFF4282C2),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // Search box
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey[600]),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Recent searches section
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Pencarian terkini',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Recent searches list
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: recentSearches.map((String search) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        search,
                        style: TextStyle(fontSize: 14),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}