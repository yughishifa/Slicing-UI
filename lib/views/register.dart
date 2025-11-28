import 'package:flutter/material.dart';
import 'package:hydropome/views/login.dart';

const Color kPrimaryColor = Color(0xFF459489);
const Color inputFieldColor = Color(0xFFF0F0F0);
const Color primaryTextColor = Color(0xFF333333);

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Widget _buildTextField({
    required String label,
    required String hintText,
    bool isPassword = false,
    bool isConfirmPassword = false,
  }) {
    bool isVisible =
        isConfirmPassword ? _isConfirmPasswordVisible : _isPasswordVisible;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            color: inputFieldColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kPrimaryColor),
          ),
          child: TextField(
            obscureText:
                isPassword || isConfirmPassword ? !isVisible : false,
            style: const TextStyle(color: primaryTextColor),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500]),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: InputBorder.none,
              suffixIcon: (isPassword || isConfirmPassword)
                  ? IconButton(
                      icon: Icon(
                        isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey[700],
                      ),
                      onPressed: () {
                        setState(() {
                          if (isConfirmPassword) {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          } else {
                            _isPasswordVisible = !_isPasswordVisible;
                          }
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 32.0),
                  child: BackButton(color: Colors.black),
                ),
                const Text(
                  'Daftar Akun dan Mulai',
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  'Bertani Hidroponik! 🌱',
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40.0),
                _buildTextField(
                  label: 'Nama Lengkap',
                  hintText: 'Masukkan Nama Lengkap',
                ),
                const SizedBox(height: 20.0),
                _buildTextField(
                  label: 'Email',
                  hintText: 'Masukkan Email',
                ),
                const SizedBox(height: 20.0),
                _buildTextField(
                  label: 'Buat Password',
                  hintText: 'Masukkan Password',
                  isPassword: true,
                ),
                const SizedBox(height: 20.0),
                _buildTextField(
                  label: 'Konfirmasi Password',
                  hintText: 'Masukkan Password',
                  isConfirmPassword: true,
                ),
                const SizedBox(height: 40.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Daftar Akun',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Belum memiliki akun? ',
                        style: TextStyle(fontSize: 14),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, "/login");
                          },
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              fontSize: 14,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}