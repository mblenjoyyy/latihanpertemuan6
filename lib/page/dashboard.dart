import 'package:flutter/material.dart';
import 'package:pertemuan6/pertemuan/pertemuan6.dart';
import 'package:pertemuan6/pertemuan/pertemuan7.dart';
import 'package:pertemuan6/pertemuan/pertemuan8.dart';
import 'package:pertemuan6/pertemuan/pertemuan9.dart';
import 'package:pertemuan6/pertemuan/pertemuan10.dart';
import 'package:pertemuan6/auth/register_page.dart';
import 'package:pertemuan6/auth/login_page.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Pertemuan 6",
      "icon": Icons.auto_stories,
      "color": Colors.green,
      "page": CheckboxPage(),
    },
    {
      "title": "Pertemuan 7",
      "icon": Icons.auto_stories,
      "color": Colors.orange,
      "page": RadiobuttonPage(),
    },
    {
      "title": "Pertemuan 8",
      "icon": Icons.auto_stories,
      "color": Colors.purple,
      "page": AutocompletespinPage(),
    },
    {
      "title": "Pertemuan 9",
      "icon": Icons.auto_stories,
      "color": Colors.pink,
      "page": DateTimePickerForm(),
    },
    {
      "title": "Pertemuan 10",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": const Pertemuan10(), // Pastikan nama class-nya benar
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 1. TAMBAHKAN DefaultTabController DI PALING LUAR
    return DefaultTabController(
      length: 3, // Jumlah tab yang dibuat
      child: Scaffold(
        backgroundColor: Colors.grey[100],

        appBar: AppBar(
          // (Opsional) Saya hilangkan lengkungan bawah agar TabBar menempel rapi dengan AppBar
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          title: const Text(
            'Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          
          // 2. TAMBAHKAN TabBar DI BAGIAN BOTTOM APPBAR
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.grid_view), text: "Menu Utama"),
              Tab(icon: Icon(Icons.star), text: "Favorit"),
              Tab(icon: Icon(Icons.info), text: "Info"),
            ],
          ),
        ),

        // 3. UBAH BODY MENJADI TabBarView
        body: TabBarView(
          children: [
            // --- TAB 1: Berisi GridView / Menu Kotak-kotak kamu yang lama ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: menuItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return _buildMenuCard(
                    context,
                    title: item['title'],
                    icon: item['icon'],
                    color: item['color'],
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => item['page']));
                    },
                  );
                },
              ),
            ),

            // --- TAB 2: Halaman Baru (Favorit) ---
            const Center(
              child: Text(
                "Ini adalah Halaman Tab Favorit",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),

            // --- TAB 3: Halaman Baru (Info) ---
            const Center(
              child: Text(
                "Ini adalah Halaman Tab Info",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required VoidCallback onTap}) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 5,
      shadowColor: Colors.black26,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 40,
                  color: color,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}