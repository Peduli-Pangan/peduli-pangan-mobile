import 'package:flutter/material.dart';
import 'package:pedulipangan_v2/pages/main_wrapper.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/app_header.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/big_surplus_card.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/category_grid.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/coupon_card.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/filter_chips.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/floating_bottom_banner.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/home_page_v2.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/portrait_card.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/promo_slider.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/quick_access_icons.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/section_header.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/sticky_search_bar.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/surplus_card.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/top_ad_banner.dart';
import 'package:pedulipangan_v2/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:pedulipangan_v2/models/category_model.dart';
import 'package:pedulipangan_v2/models/product_model.dart';

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

      // Routing dimulai dari MainWrapper
      // home: const MainWrapper(),
      home: const HomePageV2(),

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

      // bisa
      // home: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: 3, // Example: Display 3 cards
      //   itemBuilder: (context, index) {
      //     final products = [
      //       ProductModel(
      //         id: 1,
      //         createdAt: DateTime.now(),
      //         nama: 'Roti Bakar Special',
      //         slug: 'roti-bakar-special',
      //         harga: 15000,
      //         stock: 10,
      //         condition: 'Baru',
      //         shortDesc: 'Roti bakar lezat',
      //         longDesc: 'Roti bakar dengan berbagai varian rasa',
      //         rating: 4.8,
      //         isActive: true,
      //         merchantId: 1,
      //         categoryId: 1,
      //         tag: 'Bakery',
      //       ),
      //       ProductModel(
      //         id: 2,
      //         createdAt: DateTime.now(),
      //         nama: 'Nasi Goreng Spesial',
      //         slug: 'nasi-goreng-spesial',
      //         harga: 20000,
      //         stock: 15,
      //         condition: 'Baru',
      //         shortDesc: 'Nasi goreng mantap',
      //         longDesc: 'Nasi goreng dengan bumbu rahasia',
      //         rating: 4.5,
      //         isActive: true,
      //         merchantId: 1,
      //         categoryId: 2,
      //         tag: 'Main Course',
      //       ),
      //       ProductModel(
      //         id: 3,
      //         createdAt: DateTime.now(),
      //         nama: 'Es Teh Manis',
      //         slug: 'es-teh-manis',
      //         harga: 5000,
      //         stock: 50,
      //         condition: 'Baru',
      //         shortDesc: 'Penyegar dahaga',
      //         longDesc: 'Es teh manis dingin',
      //         rating: 4.0,
      //         isActive: true,
      //         merchantId: 1,
      //         categoryId: 6,
      //         tag: 'Minuman',
      //       ),
      //     ];

      //     final imageUrls = [
      //       'https://images.unsplash.com/photo-1541592103007-ce9a43363b2f?q=80&w=150&auto=format&fit=crop',
      //       'https://images.unsplash.com/photo-1626804154941-8f5c6b7b7b1b?q=80&w=150&auto=format&fit=crop',
      //       'https://images.unsplash.com/photo-1577805947-295058a7b0b6?q=80&w=150&auto=format&fit=crop',
      //     ];

      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: PortraitCard(
      //         product: products[index],
      //         imageUrl: imageUrls[index],
      //       ),
      //     );
      //   },
      // ),

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

      // card bisa
      // home: Builder(
      //   builder: (context) {
      //     final List<Map<String, dynamic>> surplusData = [
      //       {
      //         'product': ProductModel(
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
      //         'imageUrl':
      //             'https://images.unsplash.com/photo-1541592103007-ce9a43363b2f?q=80&w=150&auto=format&fit=crop',
      //         'time': '15 min',
      //         'distance': '2.5 km',
      //         'discountText': '50%',
      //         'timer': '02:00:00',
      //       },
      //       {
      //         'product': ProductModel(
      //           id: 2,
      //           createdAt: DateTime.now(),
      //           nama: 'Nasi Goreng Merah',
      //           slug: 'nasi-goreng-merah',
      //           harga: 20000,
      //           stock: 5,
      //           condition: 'Baru',
      //           shortDesc: 'Nasi goreng pedas mantap',
      //           longDesc: 'Nasi goreng dengan bumbu merah khas',
      //           rating: 4.5,
      //           isActive: true,
      //           merchantId: 2,
      //           categoryId: 2,
      //           tag: 'Makanan Berat',
      //         ),
      //         'imageUrl':
      //             'https://images.unsplash.com/photo-1626804154941-8f5c6b7b7b1b?q=80&w=150&auto=format&fit=crop',
      //         'time': '30 min',
      //         'distance': '1.8 km',
      //         'discountText': '30%',
      //         'timer': '01:30:00',
      //       },
      //     ];

      //     return ListView.builder(
      //       itemCount: surplusData.length,
      //       itemBuilder: (context, index) {
      //         final data = surplusData[index];
      //         return Padding(
      //           padding: const EdgeInsets.symmetric(vertical: 8.0),
      //           child: SurplusCard(
      //             product: data['product'] as ProductModel,
      //             imageUrl: data['imageUrl'] as String,
      //             time: data['time'] as String,
      //             distance: data['distance'] as String,
      //             discountText: data['discountText'] as String,
      //             timer: data['timer'] as String,
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),

      // bisa
      // home: const TopAdBanner()
    );
  }
}
