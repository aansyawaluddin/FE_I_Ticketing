import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget content;
  final bool backButton;
  
  const TopBar({super.key, required this.content, this.backButton = false});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Color(0xFFEAEAEA),
      centerTitle: false,
      automaticallyImplyLeading: backButton,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600, color: Colors.black, fontSize: 20),
      title: content,
    );

  }

}