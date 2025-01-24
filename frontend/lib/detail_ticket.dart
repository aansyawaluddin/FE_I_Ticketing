import 'package:flutter/material.dart';

class DetailTicket extends StatelessWidget {
  const DetailTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detail Ticket',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          backgroundColor: const Color(0xFFEAEAEA),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); 
            },
          ),
        ),
        body: const Center(
          child: Text(
            'Detail Ticket Content',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
