import 'package:flutter/material.dart';
// Import file AuthPage dari folder auth
import 'package:pertemuan6/auth/auth_page.dart';

class Pertemuan10 extends StatelessWidget {
  const Pertemuan10({super.key});

  @override
  Widget build(BuildContext context) {
    // Langsung mengembalikan AuthPage (Halaman Login/Register)
    return const AuthPage();
  }
}