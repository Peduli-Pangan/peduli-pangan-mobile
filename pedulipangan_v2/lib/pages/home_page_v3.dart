import 'package:flutter/material.dart';
import '../models/menu.dart';
import 'package:pedulipangan_v2/pages/catering_menu.dart';
import 'package:pedulipangan_v2/pages/product_detail_page.dart';
import 'package:pedulipangan_v2/pages/surplus.dart';

class HomePageV3 extends StatefulWidget {
  const HomePageV3({super.key});

  @override
  State<HomePageV3> createState() => _HomePageV3State();
}

class _HomePageV3State extends State<HomePageV3> {
  int _currentFeaturedIndex = 0;

  final List<Map<String, dynamic>> _featuredItems = [
    {
      'name': 'Burger King Special',
      'category': 'Western • Fast Food',
      'rating': '4.8',
      'time': '15 min',
      'discount': '50%',
      'image':
          'https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=800&q=80',
      'color': Colors.amber,
    },
    {
      'name': 'Pizza Hut Deluxe',
      'category': 'Italian • Pizza',
      'rating': '4.7',
      'time': '20 min',
      'discount': '40%',
      'image':
          'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=800&q=80',
      'color': Colors.red,
    },
    {
      'name': 'Starbucks Coffee',
      'category': 'Beverage • Coffee',
      'rating': '4.9',
      'time': '10 min',
      'discount': '30%',
      'image':
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=800&q=80',
      'color': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          // Header Section
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 0, // Hide default toolbar
            collapsedHeight: 0,
            expandedHeight: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(160),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Location
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.green,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lokasi kamu',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[500],
                                ),
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'Kampus Lidah Wetan',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down, size: 18),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CateringMenuPage(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const TextField(
                            enabled: false, // Disable typing, treat as button
                            decoration: InputDecoration(
                              hintText: 'Mau makan apa hari ini?',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(Icons.search, color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Filter Buttons
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          _buildFilterButton('Terdekat', isActive: true),
                          const SizedBox(width: 8),
                          _buildFilterButton('Paling Laris'),
                          const SizedBox(width: 8),
                          _buildFilterButton('Diskon 50%'),
                          const SizedBox(width: 8),
                          _buildFilterButton('24 Jam'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Body Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured Item
                  _buildFeaturedItem(),
                  const SizedBox(height: 24),

                  // Categories
                  _buildCategories(),
                  const SizedBox(height: 24),

                  // Paket Hemat Kenyang
                  _buildSectionHeader('Paket Hemat Kenyang', 'Lihat Semua'),
                  const SizedBox(height: 12),
                  _buildPackageList(),
                  const SizedBox(height: 24),

                  // Rekomendasi Sekitar
                  const Text(
                    'Rekomendasi Sekitar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildRecommendationList(),
                  const SizedBox(height: 80), // Bottom padding for nav bar
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.green[600] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? Colors.transparent : Colors.grey[300]!,
        ),
        boxShadow:
            isActive
                ? [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
                : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.grey[600],
          fontSize: 12,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildFeaturedItem() {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _currentFeaturedIndex = index;
              });
            },
            itemCount: _featuredItems.length,
            itemBuilder: (context, index) {
              final item = _featuredItems[index];
              final color = item['color'] as MaterialColor;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: color[500],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SurplusPage(),
                      ),
                    );
                  },
                  child: Column(
                  children: [
                    // Image Section
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: SizedBox(
                            height: 176,
                            width: double.infinity,
                            child: Image.network(
                              item['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: color, size: 12),
                                const SizedBox(width: 4),
                                Text(
                                  item['rating']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 70,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '🛵 ${item['time']}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Info Section
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['category']!,
                            style: TextStyle(fontSize: 12, color: color[100]),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      item['discount']!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: color[900],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'SURPLUS\nPROMO',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: color[100],
                                        height: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: color[100],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '⏱ 02:15:00',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: color[700],
                                      fontFamily: 'monospace',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_featuredItems.length, (index) {
            final isActive = _currentFeaturedIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: isActive ? 24 : 8,
              decoration: BoxDecoration(
                color: isActive ? Colors.green : Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    final categories = [
      {'name': 'Burger', 'color': Colors.orange, 'icon': Icons.lunch_dining},
      {'name': 'Minuman', 'color': Colors.blue, 'icon': Icons.local_drink},
      {'name': 'Bakmie', 'color': Colors.yellow, 'icon': Icons.ramen_dining},
      {'name': 'Pedas', 'color': Colors.red, 'icon': Icons.whatshot},
      {'name': 'Sehat', 'color': Colors.green, 'icon': Icons.spa},
      {'name': 'Sweets', 'color': Colors.pink, 'icon': Icons.cake},
      {'name': 'Snack', 'color': Colors.purple, 'icon': Icons.cookie},
      {'name': 'Lainnya', 'color': Colors.grey, 'icon': Icons.grid_view},
    ];

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final cat = categories[index];
        return Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CateringMenuPage(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(28),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: (cat['color'] as MaterialColor)[100],
                  shape: BoxShape.circle,
                  border: Border.all(color: (cat['color'] as MaterialColor)[50]!),
                ),
                child: Icon(
                  cat['icon'] as IconData,
                  color: (cat['color'] as MaterialColor)[700],
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              cat['name'] as String,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CateringMenuPage(),
              ),
            );
          },
          child: Text(
            action,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.green[600],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPackageList() {
    final packages = [
      {
        'title': 'Paket Pizza Party',
        'shop': 'Pizza Hut',
        'price': 'Rp 85rb',
        'oldPrice': '120rb',
        'rating': '4.8',
        'image':
            'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=400&q=80',
      },
      {
        'title': 'Paket Ayam Crispy',
        'shop': 'KFC Wiyung',
        'price': 'Rp 45rb',
        'oldPrice': '60rb',
        'rating': '4.6',
        'image':
            'https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?auto=format&fit=crop&w=400&q=80',
      },
      {
        'title': 'Pasta Carbonara',
        'shop': "Nanny's Pavillon",
        'price': 'Rp 55rb',
        'oldPrice': null,
        'rating': '4.9',
        'image':
            'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?auto=format&fit=crop&w=400&q=80',
      },
    ];

    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final pkg = packages[index];
          return Container(
            width: 150,
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        pkg['image']!,
                        height: 160,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 10,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              pkg['rating']!,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  pkg['title']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  pkg['shop']!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Row(
                  children: [
                    Text(
                      pkg['price']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    if (pkg['oldPrice'] != null) ...[
                      const SizedBox(width: 4),
                      Text(
                        pkg['oldPrice']!,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecommendationList() {
    final recommendations = [
      {
        'name': 'Raja Geprek Arjuna',
        'desc': 'Aneka Nasi, Ayam & Bebek',
        'rating': '4.5',
        'time': '20-30 min',
        'delivery': 'Ongkir 18.3rb',
        'promo': 'Diskon 45%',
        'image':
            'https://images.unsplash.com/photo-1564834724105-918b73d1b9e0?auto=format&fit=crop&w=300&q=80',
      },
      {
        'name': 'Moon Chicken (Hangry)',
        'desc': 'Korean Fried Chicken',
        'rating': '4.9',
        'time': '30-40 min',
        'delivery': 'Ongkir 12rb',
        'promo': 'Diskon 44%',
        'closed': 'Tutup dalam 13 min',
        'image':
            'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=300&q=80',
      },
      {
        'name': "McDonald's Wiyung",
        'desc': 'Cepat Saji, Burger, Sweets',
        'rating': '4.7',
        'time': '15-20 min',
        'delivery': 'Ongkir 8rb',
        'promo': 'Diskon Ongkir 11rb',
        'image':
            'https://images.unsplash.com/photo-1551782450-a2132b4ba21d?auto=format&fit=crop&w=300&q=80',
      },
    ];

    return Column(
      children:
          recommendations.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  // Create a dummy meal for demonstration
                  final dummyMeal = OrderableMealModel(
                    type: 'Recommended',
                    description: item['desc']!,
                    price: 25000.0,
                    imageUrl: item['image'],
                    restaurantName: item['name']!,
                    restaurantAddress: 'Nearby Location',
                    restaurantLogoUrl: '',
                    pickupTime: item['time']!,
                    stock: 10,
                    tags: ['Recommended', 'Tasty'],
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        meal: dummyMeal,
                        date: DateTime.now(),
                      ),
                    ),
                  );
                },
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item['image']!,
                          width: 96,
                          height: 96,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 10,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                item['rating']!,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (item['closed'] != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text(
                              item['closed']!,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item['name']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[200]!),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'Ad',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['desc']!,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.motorcycle,
                              size: 12,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item['time']!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              '•',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              item['delivery']!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color:
                                item['promo']!.contains('Ongkir')
                                    ? Colors.blue[50]
                                    : Colors.red[50],
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color:
                                  item['promo']!.contains('Ongkir')
                                      ? Colors.blue[100]!
                                      : Colors.red[100]!,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.local_offer,
                                size: 12,
                                color:
                                    item['promo']!.contains('Ongkir')
                                        ? Colors.blue[600]
                                        : Colors.red[600],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                item['promo']!,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      item['promo']!.contains('Ongkir')
                                          ? Colors.blue[600]
                                          : Colors.red[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
