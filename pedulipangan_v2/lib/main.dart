import 'package:flutter/material.dart';
import 'package:pedulipangan_v2/pages/home_page_v3.dart';
import 'package:pedulipangan_v2/pages/main_wrapper.dart';
import 'dart:ui';
import 'package:pedulipangan_v2/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:pedulipangan_v2/models/category_model.dart';
import 'package:pedulipangan_v2/models/product_model.dart';
import 'package:pedulipangan_v2/pages/components-card/test-card.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://kttusitwmhdpnjwtqfgn.supabase.co',
    anonKey: 'sb_publishable_l7bUvCpymXmhQj3VEYd3rg_1S8iU42Q',
  );
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peduli Pangan',
      theme: ThemeData(
        primaryColor: AppColors.primaryGreen,
        scaffoldBackgroundColor: AppColors.background,
        // Kita gunakan font default dulu, nanti bisa diganti Google Fonts (Poppins)
        fontFamily: 'Inter',
      ),
      scrollBehavior: MyCustomScrollBehavior(),

      // Routing dimulai dari MainWrapper
      // home: const TestCardPage(),
      // home: const ListMakananPage(),
      home: const MainWrapper(),
      // home: const HomePageV2(),
      // home: const HomePageV3(),

      // bisa
      // home: const AppHeader(),



// bisa
      // home: Scaffold(
      //   body: ListView(
      //     padding: const EdgeInsets.all(16.0),
      //     children: [
      //       BigSurplusCard(
      //         product: ProductModel(
      //           id: 1,
      //           createdAt: DateTime.now(),
      //           nama: 'Roti Bakar Special',
      //           slug: 'roti-bakar-special',
      //           harga: 15000,
      //           stock: 10,
      //           condition: 'Baru',
      //           shortDesc: 'Roti bakar lezat',
      //           longDesc: 'Roti bakar dengan berbagai varian rasa',
      //           rating: 4.8,
      //           isActive: true,
      //           merchantId: 1,
      //           categoryId: 1,
      //           tag: 'Bakery',
      //         ),
      //         imageUrl:
      //             'https://images.unsplash.com/photo-1541592103007-ce9a43363b2f?q=80&w=150&auto=format&fit=crop',
      //         time: '15 min',
      //         distance: '2.5 km',
      //         discountText: '50%',
      //         timer: '02:00:00',
      //       ),
      //       const SizedBox(height: 16),
      //       BigSurplusCard(
      //         product: ProductModel(
      //           id: 2,
      //           createdAt: DateTime.now(),
      //           nama: 'Nasi Goreng Spesial',
      //           slug: 'nasi-goreng-spesial',
      //           harga: 20000,
      //           stock: 5,
      //           condition: 'Baru',
      //           shortDesc: 'Nasi goreng dengan bumbu rahasia',
      //           longDesc: 'Nasi goreng dengan telur, ayam, dan sosis',
      //           rating: 4.5,
      //           isActive: true,
      //           merchantId: 2,
      //           categoryId: 2,
      //           tag: 'Main Course',
      //         ),
      //         imageUrl:
      //             'https://images.unsplash.com/photo-1626804475176-c1c073155160?q=80&w=150&auto=format&fit=crop',
      //         time: '20 min',
      //         distance: '3.0 km',
      //         discountText: '30%',
      //         timer: '01:30:00',
      //       ),
      //       const SizedBox(height: 16),
      //       BigSurplusCard(
      //         product: ProductModel(
      //           id: 3,
      //           createdAt: DateTime.now(),
      //           nama: 'Es Teh Manis',
      //           slug: 'es-teh-manis',
      //           harga: 5000,
      //           stock: 20,
      //           condition: 'Baru',
      //           shortDesc: 'Minuman segar pelepas dahaga',
      //           longDesc: 'Es teh manis dengan gula asli',
      //           rating: 4.0,
      //           isActive: true,
      //           merchantId: 3,
      //           categoryId: 3,
      //           tag: 'Drinks',
      //         ),
      //         imageUrl:
      //             'https://images.unsplash.com/photo-1572490122746-778730302307?q=80&w=150&auto=format&fit=crop',
      //         time: '5 min',
      //         distance: '1.0 km',
      //         discountText: '20%',
      //         timer: '00:45:00',
      //       ),
      //     ],
      //   ),
      // ),


// bisa
      // home: CategoryGrid(
      //   categories: [
      //     CategoryModel(
      //       id: 1,
      //       createdAt: DateTime.now(),
      //       nama: 'Jajanan',
      //       slug: 'jajanan',
      //     ),
      //     CategoryModel(
      //       id: 2,
      //       createdAt: DateTime.now(),
      //       nama: 'Sweets',
      //       slug: 'sweets',
      //     ),
      //     CategoryModel(
      //       id: 3,
      //       createdAt: DateTime.now(),
      //       nama: 'Martabak',
      //       slug: 'martabak',
      //     ),
      //     CategoryModel(
      //       id: 4,
      //       createdAt: DateTime.now(),
      //       nama: 'Bakso & Soto',
      //       slug: 'bakso-soto',
      //     ),
      //     CategoryModel(
      //       id: 5,
      //       createdAt: DateTime.now(),
      //       nama: 'Aneka Nasi',
      //       slug: 'aneka-nasi',
      //     ),
      //     CategoryModel(
      //       id: 6,
      //       createdAt: DateTime.now(),
      //       nama: 'Minuman',
      //       slug: 'minuman',
      //     ),
      //     CategoryModel(
      //       id: 7,
      //       createdAt: DateTime.now(),
      //       nama: 'Chinese',
      //       slug: 'chinese',
      //     ),
      //     CategoryModel(
      //       id: 8,
      //       createdAt: DateTime.now(),
      //       nama: 'Korea',
      //       slug: 'korea',
      //     ),
      //   ],
      // ),

      // kategori bisa
      // home: const FilterChips(),

      // bisa
      // home: const FloatingBottomBanner(),

      // bisa tapi tidak bisa scrollable horizontally
      // home: const PromoSlider(),

      //  bisa
      // home: const QuickAccessIcons(),

      //  bisa tampil (harusnya sebagai parent, dan ada childnya)
      // home: SectionHeader(
      //   title: 'Rekomendasi Pilihan',
      //   subtitle: 'Berdasarkan preferensimu',
      //   onSeeAll: () {},
      // ),

      //  bisa tapi belum bisa dipencet
      // home: const StickySearchBar(),

      // bisa
      // home: const TopAdBanner()
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
