import 'package:flutter/material.dart';
import 'package:pedulipangan_v2/pages/cart_page.dart';
import 'package:pedulipangan_v2/pages/catering_page.dart';
import 'package:pedulipangan_v2/pages/home_page.dart';
import 'package:pedulipangan_v2/theme.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  // Daftar Halaman yang akan ditampilkan sesuai menu
  final List<Widget> _pages = [
    const HomePage(),      // Halaman Home (Sesuai Desain)
    const CateringPage(), 
    const CartPage(),
    // const PlaceholderPage(title: 'Account'),  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body akan berganti sesuai index yang dipilih
      body: _pages[_currentIndex],
      
      // Bagian Bottom Navigation Bar
      bottomNavigationBar: Container(
        // Memberikan shadow sedikit agar terlihat elegan di atas background putih
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.primaryGreen, // Latar hijau penuh
          type: BottomNavigationBarType.fixed, // Wajib fixed agar warna bg muncul jika item > 3
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white, // Ikon aktif warna putih
          unselectedItemColor: Colors.white.withOpacity(0.6), // Ikon tidak aktif agak transparan
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Catering',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}