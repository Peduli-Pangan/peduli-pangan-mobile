import 'package:flutter/material.dart';
import 'package:pedulipangan_v2/models/category_model.dart';
import 'package:pedulipangan_v2/models/product_model.dart';
import 'package:pedulipangan_v2/pages/components-card/big_surplus_card.dart';
import 'package:pedulipangan_v2/pages/components-card/category_grid.dart';
import 'package:pedulipangan_v2/pages/components-card/menu_card.dart';
import 'package:pedulipangan_v2/pages/components-card/portrait_card.dart';
import 'package:pedulipangan_v2/pages/components-card/surplus_card.dart';
import 'package:pedulipangan_v2/pages/components-card/list_makanan_page.dart';

import 'package:pedulipangan_v2/pages/components-card/promo_card.dart';
import 'package:pedulipangan_v2/pages/components-card/bundle_card.dart';
import 'package:pedulipangan_v2/pages/components-card/menu_item_card.dart';

import 'package:pedulipangan_v2/pages/components-card/restaurant_card.dart';

class TestCardPage extends StatelessWidget {
  const TestCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Card Components')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListMakananPage(),
                ),
              );
            },
            child: const Text('Open List Makanan Page'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Promo Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: _buildPromoCards()),
          ),
          const SizedBox(height: 24),
          const Text(
            'Bundle Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: _buildBundleCards()),
          ),
          const SizedBox(height: 24),
          const Text(
            'Menu Item Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ..._buildMenuItemCards(),
          const SizedBox(height: 24),
          const Text(
            'Restaurant Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ..._buildRestaurantCards(),
          const SizedBox(height: 24),
          const Text(
            'Menu Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: _buildMenuCards()),
          ),
          const SizedBox(height: 24),
          const Text(
            'Big Surplus Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ..._buildBigSurplusCards(),
          const SizedBox(height: 24),
          const Text(
            'Surplus Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: _buildSurplusCards()),
          ),
          const SizedBox(height: 24),
          const Text(
            'Portrait Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: _buildPortraitCards()),
          ),
          const SizedBox(height: 24),
          const Text(
            'Category Grid',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildCategoryGrid(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  List<Widget> _buildRestaurantCards() {
    return [
      const RestaurantCard(
        name: 'Raja Geprek Arjuna, Lidah Wetan',
        imageUrl:
            'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=200&q=80',
        rating: 4.5,
        ratingCount: '500+ ratings',
        tags: '30rb-40rb • Aneka nasi, Ayam & bebek',
        deliveryInfo: '20-30 min • Ongkir 18.3rb',
        originalDeliveryFee: '29.3rb',
        discount: 'Diskon 45%, maks. 117rb',
        isAd: true,
      ),
      const RestaurantCard(
        name: 'Moon Chicken (Hangry Fried Chicken)',
        imageUrl:
            'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=200&q=80',
        rating: 4.9,
        ratingCount: '100+ ratings',
        tags: '45rb-55rb • Ayam & bebek, Aneka nasi',
        deliveryInfo: '20-30 min • Ongkir 11.8rb',
        originalDeliveryFee: '22.8rb',
        discount: 'Diskon 44%, maks. 171rb',
        isClosingSoon: true,
        closingTime: '13 min',
        isAd: true,
      ),
      const RestaurantCard(
        name: 'McDonald\'s, Wiyung Surabaya',
        imageUrl:
            'https://images.unsplash.com/photo-1550547660-d9450f859349?w=200&q=80',
        rating: 4.8,
        ratingCount: '51rb+ ratings',
        tags: '40rb-50rb • Cepat saji, Sweets, Jajanan',
        deliveryInfo: '20-30 min • Ongkir 13.1rb',
        originalDeliveryFee: '24.1rb',
        discount: 'Diskon ongkir s.d. 11rb',
      ),
    ];
  }

  List<Widget> _buildPromoCards() {
    return [
      const PromoCard(
        imageUrl:
            'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=400&auto=format&fit=crop',
        discount: '40% off',
        rating: 4.8,
        title: 'Ayam Geprek Rasya Tosca, Lidah Wetan',
        distance: '3.09 km',
      ),
      const PromoCard(
        imageUrl:
            'https://images.unsplash.com/photo-1544025162-d76690b67f11?q=80&w=400&auto=format&fit=crop',
        discount: '44% off',
        rating: 4.9,
        title: 'TEA FOR YOU T4U - Darmo Permai',
        distance: '4.85 km',
      ),
      const PromoCard(
        imageUrl:
            'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=400&auto=format&fit=crop',
        discount: '35% off',
        rating: 4.7,
        title: 'Sate Ayam Ponorogo Pak Sadi',
        distance: '2.1 km',
      ),
    ];
  }

  List<Widget> _buildBundleCards() {
    return [
      const BundleCard(
        imageUrl:
            'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?q=80&w=400&auto=format&fit=crop',
        title: 'Special - Paket Kenyang',
        originalPrice: 30920,
        discountedPrice: 23900,
      ),
      const BundleCard(
        imageUrl:
            'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?q=80&w=400&auto=format&fit=crop',
        title: 'Special - Paket Hemat',
        originalPrice: 35160,
        discountedPrice: 29160,
      ),
      const BundleCard(
        imageUrl:
            'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=400&auto=format&fit=crop',
        title: 'Special - Paket Keluarga',
        originalPrice: 120000,
        discountedPrice: 85000,
      ),
    ];
  }

  List<Widget> _buildMenuItemCards() {
    return [
      const MenuItemCard(
        title: 'MIE GACOAN',
        description:
            'Sensasi pedas manis menu ini dijamin bakal bikin kamu ketagihan. Bisa pilih tingkat kepedasan.',
        price: 14500,
        imageUrl:
            'https://images.unsplash.com/photo-1585032226651-759b368d7246?q=80&w=400&auto=format&fit=crop',
      ),
      const MenuItemCard(
        title: 'MIE HOMPIMPA',
        description:
            'Menu wajib untuk para pecinta rasa pedas gurih. Makin nikmat dengan pilih sendiri tingkat kepedasan.',
        price: 14500,
        imageUrl:
            'https://images.unsplash.com/photo-1612929633738-8fe44f7ec841?q=80&w=400&auto=format&fit=crop',
      ),
      const MenuItemCard(
        title: 'MIE SUIT',
        description:
            'Tidak suka rasa pedas? Jangan kuatir! Sensasi gurih dan asin menu ini dijamin bikin nagih.',
        price: 14500,
        imageUrl:
            'https://images.unsplash.com/photo-1552611052-33e04de081de?q=80&w=400&auto=format&fit=crop',
      ),
    ];
  }

  List<Widget> _buildMenuCards() {
    return [
      const MenuCard(
        imageUrl:
            'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?q=80&w=400&auto=format&fit=crop',
        productName: 'Nasi Ayam Bakar+tahu Tempe',
        merchantName: 'Bebek Menchak',
        price: 20800,
        originalPrice: 26000,
        time: '27-37 min',
      ),
      const MenuCard(
        imageUrl:
            'https://images.unsplash.com/photo-1585975854487-d8461d72e30c?q=80&w=400&auto=format&fit=crop',
        productName: 'Nasi Ayam Goreng+tahu Tempe',
        merchantName: 'Bebek Menchak',
        price: 20800,
        originalPrice: 26000,
        time: '27-37 min',
      ),
      const MenuCard(
        imageUrl:
            'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=400&auto=format&fit=crop',
        productName: 'Nasi Telur + Tempe + Lalapan + Sambal',
        merchantName: 'Bebek Garasi',
        price: 15000,
        time: '27-37 min',
      ),
      const MenuCard(
        imageUrl:
            'https://images.unsplash.com/photo-1603133872878-684f208fb84b?q=80&w=400&auto=format&fit=crop',
        productName: 'Nasi Goreng Putihan Bumbu Jawa',
        merchantName: 'Bebek Garasi',
        price: 18000,
        time: '27-37 min',
      ),
    ];
  }

  List<Widget> _buildBigSurplusCards() {
    return [
      BigSurplusCard(
        product: ProductModel(
          id: 1,
          createdAt: DateTime.now(),
          nama: 'Roti Bakar Special',
          slug: 'roti-bakar-special',
          harga: 15000,
          stock: 10,
          condition: 'Baru',
          shortDesc: 'Roti bakar lezat',
          longDesc: 'Roti bakar dengan berbagai varian rasa',
          rating: 4.8,
          isActive: true,
          merchantId: 1,
          categoryId: 1,
          tag: 'Bakery',
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1541592103007-ce9a43363b2f?q=80&w=600&auto=format&fit=crop',
        time: '15 min',
        distance: '2.5 km',
        discountText: '50%',
        endTime: '22:00',
      ),
      const SizedBox(height: 16),
      BigSurplusCard(
        product: ProductModel(
          id: 2,
          createdAt: DateTime.now(),
          nama: 'Nasi Goreng Spesial',
          slug: 'nasi-goreng-spesial',
          harga: 20000,
          stock: 5,
          condition: 'Baru',
          shortDesc: 'Nasi goreng mantap',
          longDesc: 'Nasi goreng dengan bumbu rahasia',
          rating: 4.5,
          isActive: true,
          merchantId: 2,
          categoryId: 2,
          tag: 'Main Course',
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1626804475176-c1c073155160?q=80&w=600&auto=format&fit=crop',
        time: '20 min',
        distance: '3.0 km',
        discountText: '30%',
        endTime: '21:30',
      ),
      const SizedBox(height: 16),
      BigSurplusCard(
        product: ProductModel(
          id: 3,
          createdAt: DateTime.now(),
          nama: 'Es Teh Manis',
          slug: 'es-teh-manis',
          harga: 5000,
          stock: 20,
          condition: 'Baru',
          shortDesc: 'Minuman segar',
          longDesc: 'Es teh manis dingin',
          rating: 4.0,
          isActive: true,
          merchantId: 3,
          categoryId: 3,
          tag: 'Drinks',
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1572490122746-778730302307?q=80&w=600&auto=format&fit=crop',
        time: '5 min',
        distance: '1.0 km',
        discountText: '20%',
        endTime: '20:45',
      ),
    ];
  }

  List<Widget> _buildSurplusCards() {
    return [
      SurplusCard(
        product: ProductModel(
          id: 4,
          createdAt: DateTime.now(),
          nama: 'Mie Ayam Bakso',
          slug: 'mie-ayam-bakso',
          harga: 18000,
          stock: 15,
          condition: 'Baru',
          shortDesc: 'Mie ayam enak',
          longDesc: 'Mie ayam dengan bakso sapi asli',
          rating: 4.7,
          isActive: true,
          merchantId: 4,
          categoryId: 2,
          tag: 'Noodle',
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1585032226651-759b368d7246?q=80&w=400&auto=format&fit=crop',
        time: '25 min',
        distance: '4.0 km',
        discountText: '40%',
        endTime: '21:15',
      ),
      SurplusCard(
        product: ProductModel(
          id: 5,
          createdAt: DateTime.now(),
          nama: 'Sate Ayam Madura',
          slug: 'sate-ayam-madura',
          harga: 25000,
          stock: 10,
          condition: 'Baru',
          shortDesc: 'Sate ayam empuk',
          longDesc: 'Sate ayam dengan bumbu kacang',
          rating: 4.9,
          isActive: true,
          merchantId: 5,
          categoryId: 2,
          tag: 'Satay',
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1552895638-f7fe08d2f7d5?q=80&w=400&auto=format&fit=crop',
        time: '30 min',
        distance: '5.0 km',
        discountText: '25%',
        endTime: '20:50',
      ),
      SurplusCard(
        product: ProductModel(
          id: 6,
          createdAt: DateTime.now(),
          nama: 'Jus Alpukat',
          slug: 'jus-alpukat',
          harga: 12000,
          stock: 25,
          condition: 'Baru',
          shortDesc: 'Jus sehat',
          longDesc: 'Jus alpukat mentega',
          rating: 4.6,
          isActive: true,
          merchantId: 6,
          categoryId: 3,
          tag: 'Juice',
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1601039641847-7857b994d704?q=80&w=400&auto=format&fit=crop',
        time: '10 min',
        distance: '1.5 km',
        discountText: '15%',
        endTime: '20:30',
      ),
    ];
  }

  List<Widget> _buildPortraitCards() {
    return [
      PortraitCard(
        product: ProductModel(
          id: 7,
          createdAt: DateTime.now(),
          nama: 'Pizza Pepperoni',
          slug: 'pizza-pepperoni',
          harga: 80000,
          stock: 5,
          condition: 'Baru',
          shortDesc: 'Pizza Italia',
          longDesc: 'Pizza dengan topping pepperoni',
          rating: 4.8,
          isActive: true,
          merchantId: 7,
          categoryId: 2,
          tag: 'Pizza',
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1628840042765-356cda07504e?q=80&w=400&auto=format&fit=crop',
      ),
      PortraitCard(
        product: ProductModel(
          id: 8,
          createdAt: DateTime.now(),
          nama: 'Burger Beef',
          slug: 'burger-beef',
          harga: 45000,
          stock: 12,
          condition: 'Baru',
          shortDesc: 'Burger daging sapi',
          longDesc: 'Burger dengan daging sapi premium',
          rating: 4.7,
          isActive: true,
          merchantId: 8,
          categoryId: 2,
          tag: 'Burger',
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=400&auto=format&fit=crop',
      ),
      PortraitCard(
        product: ProductModel(
          id: 9,
          createdAt: DateTime.now(),
          nama: 'Donat Glaze',
          slug: 'donat-glaze',
          harga: 8000,
          stock: 50,
          condition: 'Baru',
          shortDesc: 'Donat manis',
          longDesc: 'Donat dengan gula glaze',
          rating: 4.5,
          isActive: true,
          merchantId: 9,
          categoryId: 1,
          tag: 'Donut',
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1551024506-0bccd828d307?q=80&w=400&auto=format&fit=crop',
      ),
    ];
  }

  Widget _buildCategoryGrid() {
    return CategoryGrid(
      categories: [
        CategoryModel(
          id: 1,
          createdAt: DateTime.now(),
          nama: 'Jajanan',
          slug: 'jajanan',
        ),
        CategoryModel(
          id: 2,
          createdAt: DateTime.now(),
          nama: 'Sweets',
          slug: 'sweets',
        ),
        CategoryModel(
          id: 3,
          createdAt: DateTime.now(),
          nama: 'Martabak',
          slug: 'martabak',
        ),
        CategoryModel(
          id: 4,
          createdAt: DateTime.now(),
          nama: 'Bakso & Soto',
          slug: 'bakso-soto',
        ),
        CategoryModel(
          id: 5,
          createdAt: DateTime.now(),
          nama: 'Aneka Nasi',
          slug: 'aneka-nasi',
        ),
        CategoryModel(
          id: 6,
          createdAt: DateTime.now(),
          nama: 'Minuman',
          slug: 'minuman',
        ),
        CategoryModel(
          id: 7,
          createdAt: DateTime.now(),
          nama: 'Chinese',
          slug: 'chinese',
        ),
        CategoryModel(
          id: 8,
          createdAt: DateTime.now(),
          nama: 'Korea',
          slug: 'korea',
        ),
      ],
    );
  }
}
