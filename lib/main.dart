import 'package:flutter/material.dart';
import 'package:pertemuan6/page/dashboard.dart';
import 'package:pertemuan6/page/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:pertemuan6/auth/auth_page.dart';
import 'package:firebase_core/firebase_core.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBqJbB433UabYNfRw_TcQpu22fWAW0qnWE", // Masukkan apiKey dari gambar kamu
      appId: "1:994205167681:web:790e4552271000365d16c0",    // Masukkan appId dari gambar kamu
      messagingSenderId: "994205167681", // Masukkan messagingSenderId kamu
      projectId: 'p12pemmob',       // Masukkan projectId kamu
      authDomain: 'p12pemmob.firebaseapp.com', // Masukkan authDomain kamu
      storageBucket: 'p12pemmob.firebasestorage.app',
    ),
  );          
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _pages = [DashboardPage(), ProfilePage()];

  var currentPage = 0;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: _pages[currentPage],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentPage,
          onTap: (i) => setState(() => currentPage = i),
          items: [
            //Beranda
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text('Beranda'),
              selectedColor: Colors.blue,
            ),

            //Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              selectedColor: Colors.blue,
            ),
          ]),
      ),
    );
  }
}