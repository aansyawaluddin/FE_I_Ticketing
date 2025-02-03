import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/widgets/top_bar.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({super.key});

  @override
  _AddNotification createState() => _AddNotification();
}

class _AddNotification extends State<AddNotification> {
  String? selectedNotificationType;
  TextEditingController messageController = TextEditingController();
  FocusNode messageFocusNode = FocusNode();

  List<String> notificationTypes = ["Informasi!", "Laporan Ticketing", "Notif"];

  void _showCreateNotificationPopup() {
    showPopupCreateNotification(context);
  }

  OverlayEntry? overlayEntry;
  final GlobalKey _dropdownKey = GlobalKey();

  void showDropdown() {
    final overlay = Overlay.of(context);
    final renderBox =
        _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy + size.height + 5,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: notificationTypes.map((type) {
                bool isSelected = type == selectedNotificationType;
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedNotificationType = type;
                    });
                    hideDropdown();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xFFCECECA) : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      type,
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry!);
  }

  void hideDropdown() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  void initState() {
    super.initState();
    messageFocusNode.addListener(() {
      if (messageFocusNode.hasFocus) {
        hideDropdown();
      }
    });
  }

  @override
  void dispose() {
    messageFocusNode.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        backButton: true,
        content: Padding(
          padding: EdgeInsets.only(left: 0),
          child: const Text("Notification"),
        ),
      ),
      backgroundColor: const Color(0xFFEAEAEA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tambah Notifikasi",
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 13),
              GestureDetector(
                key: _dropdownKey,
                onTap: () {
                  overlayEntry == null ? showDropdown() : hideDropdown();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedNotificationType ?? "Jenis Notifikasi",
                        style: GoogleFonts.montserrat(
                          color: selectedNotificationType == null
                              ? Colors.grey
                              : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: messageController,
                focusNode: messageFocusNode,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Isi",
                  hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedNotificationType != null &&
                        messageController.text.isNotEmpty) {
                      _showCreateNotificationPopup();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "Harap pilih jenis notifikasi dan isi pesan",
                                style: GoogleFonts.montserrat())),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Tambahkan Notifikasi",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showPopupCreateNotification(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text(
              "Notifikasi Berhasil Ditambahkan",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/icons/verifikasi.png',
              width: 100,
              height: 100,
            ),
          ],
        ),
      );
    },
  );
}
