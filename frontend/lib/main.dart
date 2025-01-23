import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const SizedBox(width: 10),
              const Text(
                "Dashboard",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFFEAEAEA),
        ),
        body: Container(
          color: const Color(0xFFEAEAEA),
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildInfoCard('All Ticket', 25),
                  _buildInfoCard('Solve', 10),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildInfoCard('To Do', 5),
                  _buildInfoCard('Over Due', 25),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Daily Grafik',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Stack(
                    children: [
                      // Bar Chart
                      BarChart(
                        BarChartData(
                          barGroups: [
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(
                                  toY: 8,
                                  color: Colors.red,
                                  width: 30,
                                  borderRadius: BorderRadius.zero,
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 2,
                              barRods: [
                                BarChartRodData(
                                  toY: 5,
                                  color: Colors.yellow,
                                  width: 30,
                                  borderRadius: BorderRadius.zero,
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 3,
                              barRods: [
                                BarChartRodData(
                                  toY: 10,
                                  color: Colors.green,
                                  width: 30,
                                  borderRadius: BorderRadius.zero,
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 4,
                              barRods: [
                                BarChartRodData(
                                  toY: 7,
                                  color: Colors.green,
                                  width: 30,
                                  borderRadius: BorderRadius.zero,
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 5,
                              barRods: [
                                BarChartRodData(
                                  toY: 6,
                                  color: Colors.green,
                                  width: 30,
                                  borderRadius: BorderRadius.zero,
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 6,
                              barRods: [
                                BarChartRodData(
                                  toY: 4,
                                  color: Colors.green,
                                  width: 30,
                                  borderRadius: BorderRadius.zero,
                                ),
                              ],
                            ),
                          ],
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                        ),
                      ),
                      // Custom painter for vertical and horizontal lines
                      Positioned.fill(
                        child: CustomPaint(
                          painter: LinePainter(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Penunjukan Tim',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildInfoCard('All Ticket', 25),
                  _buildInfoCard('Assign', 10),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildInfoCard('Not Assign', 10),
                  _buildInfoCard('Pending', 5),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 108,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(color: Colors.black),
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon:
                    Image.asset('assets/icons/home.png', width: 16, height: 18),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/working.png',
                    width: 16, height: 18),
                label: 'Working',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFF4282C2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/lapor.png',
                        width: 22,
                        height: 18,
                      ),
                    ),
                  ),
                ),
                label: 'Lapor',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/notifikasi.png',
                    width: 16, height: 18),
                label: 'Notifikasi',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/account.png',
                    width: 16, height: 18),
                label: 'Account',
              ),
            ],
          ),
        ));
  }

  Widget _buildInfoCard(String title, int count) {
    return Card(
      elevation: 0.5,
      color: const Color.fromARGB(255, 253, 251, 251),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        width: 178,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: Color(0XFFA6A6A6),
                    ),
                  ),
                  Text(
                    '$count',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
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

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw vertical line before the first bar (near x = 1)
    canvas.drawLine(
      Offset(30.0, 0),  // Starting point (x = 0, y = 0)
      Offset(30.0, size.height),  // Ending point (x = 30, height of the chart)
      paint,
    );

    // Draw horizontal line at the bottom of the chart (y = 0)
    canvas.drawLine(
      Offset(0, size.height),  // Starting point (x = 0, y = height of chart)
      Offset(size.width, size.height),  // Ending point (x = width, y = height of chart)
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
