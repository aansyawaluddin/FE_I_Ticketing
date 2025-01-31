import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final List<String> userRoles = ["Admin", "CS", "Spv", "SKPD", "EOS"];
  String? selectedRole;

  void _showCreateUserPopup() {
    showPopupCreateUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              const Divider(thickness: 1, color: Colors.grey),
              const SizedBox(height: 20),
              _buildTextField(nameController, "Nama"),
              const SizedBox(height: 20),
              _buildTextField(emailController, "Email"),
              const SizedBox(height: 20),
              _buildTextField(jobController, "Jabatan"),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: _inputDecoration("Role User"),
                dropdownColor: Colors.white,
                items: userRoles
                    .map((role) => DropdownMenuItem(
                          value: role,
                          child: Text(role, style: GoogleFonts.montserrat()),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => selectedRole = value),
              ),
              const SizedBox(height: 20),
              _buildTextField(phoneController, "+62",
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 20),
              _buildTextField(passwordController, "Password", obscureText: true),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _showCreateUserPopup,
                  child: Text("Create User",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText,
      {bool obscureText = false, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: GoogleFonts.montserrat(),
      decoration: _inputDecoration(hintText),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.montserrat(),
      filled: true,
      fillColor: Color(0xFFDEDEDE),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
    );
  }
}

class PopupCreateUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text(
            "Pengguna Berhasil Ditambahkan",
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
  }
}

void showPopupCreateUser(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return PopupCreateUser();
    },
  );
}
