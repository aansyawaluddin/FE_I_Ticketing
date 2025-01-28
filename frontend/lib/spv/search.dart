import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSearchPopup(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      final screenWidth = MediaQuery.of(context).size.width;
      return GestureDetector(
        onVerticalDragDown: (_) => Navigator.of(context).pop(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            constraints: BoxConstraints(maxWidth: screenWidth * 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onVerticalDragDown: (_) => Navigator.of(context).pop(),
                    child: Container(
                      width: 80,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 28),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildChip("Diskominfo", const Color(0xFF4282C2)),
                      const SizedBox(width: 8),
                      _buildChip("Dispora", const Color(0xFF4282C2)),
                      const SizedBox(width: 8),
                      _buildChip("Jaringan WiFi", const Color(0xFF4282C2)),
                      const SizedBox(width: 8),
                      _buildChip("ID #12345ABC", const Color(0xFF4282C2)),
                      const SizedBox(width: 8),
                      _buildChip("Teknologi", const Color(0xFF4282C2)),
                      const SizedBox(width: 8),
                      _buildChip("Pendidikan", const Color(0xFF4282C2)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    print("Search input: $value");
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        'assets/icons/search2.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {},
                    ),
                    hintText: "Search...",
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: const Color(0xFF7D7D7D),
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Pencarian terkini",
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFF4C585B),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildRecentSearch("jaringan wifi rusak"),
                _buildRecentSearch("diskominfo"),
                _buildRecentSearch("ID #12345ABC"),
                _buildRecentSearch("Reza"),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// Function to build chip widgets with radius
Widget _buildChip(String label, Color color) {
  return InkWell(
    onTap: () {
      print('Clicked on: $label');
    },
    borderRadius: BorderRadius.circular(20),
    child: Chip(
      label: Text(
        label,
        style: GoogleFonts.montserrat(fontSize: 12, color: Colors.white),
      ),
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

// Function to build recent search items
Widget _buildRecentSearch(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: InkWell(
      onTap: () {
        print("Clicked on: $text");
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100], // Warna latar untuk elemen pencarian
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: GoogleFonts.montserrat(fontSize: 12),
        ),
      ),
    ),
  );
}
