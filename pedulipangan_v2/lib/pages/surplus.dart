import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/restaurant.dart';
import 'package:pedulipangan_v2/pages/product_detail_page.dart';

class SurplusItem {
  final String imageUrl;
  final String distanceTime;
  final String title;
  final String description;
  final String price;
  final String originalPrice;

  SurplusItem({
    required this.imageUrl,
    required this.distanceTime,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
  });
}

class SurplusPage extends StatelessWidget {
  SurplusPage({super.key});

  final List<SurplusItem> items = [
    SurplusItem(
      imageUrl:
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=200&q=80',
      distanceTime: '3.31 km • 20-30 min',
      title: 'Nasi + Telur Dadar + Sambel Bawang',
      description: 'Penyetan Sambel Tempe...',
      price: '21.500',
      originalPrice: '33.000',
    ),
    SurplusItem(
      imageUrl:
          'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=200&q=80',
      distanceTime: '2.1 km • 15-20 min',
      title: 'Ayam Geprek Makmur',
      description: 'Ayam + Nasi + Es Teh...',
      price: '18.000',
      originalPrice: '25.000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white, // Main container bg
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Flash Sale Section
              Container(
                color: const Color(0xFFEE2737), // bg-go-red
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  children: [
                    // Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Side: Title & Subtitle
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.bolt,
                                  color: Colors.yellow[300],
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Flash Sale',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Diskon makan malam 35%.',
                              style: TextStyle(
                                color: Colors.red[100]!.withOpacity(0.9),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        // Right Side: Timer & Button
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              child: Text(
                                'Cek semua',
                                style: TextStyle(
                                  color: Colors.green[800],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Horizontal List
                    SizedBox(
                      height: 110, // Approximate height for the card content
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        separatorBuilder:
                            (context, index) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return GestureDetector(
                            onTap: () {
                              final restaurant = Restaurant(
                                name: item.title,
                                address: 'Surplus Location',
                                rating: 4.5,
                                imageUrl: '',
                                latitude: 0.0,
                                longitude: 0.0,
                              );

                              final product = Product(
                                name: item.description,
                                imageUrl: item.imageUrl,
                                price:
                                    double.tryParse(
                                      item.price.replaceAll('.', ''),
                                    ) ??
                                    0.0,
                                quantityLeft: 5,
                                pickupTimeStart: "10:00",
                                pickupTimeEnd: "22:00",
                                distance: 1.5,
                                restaurant: restaurant,
                                description: item.description,
                                isSurplus: true,
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          ProductDetailPage(product: product),
                                ),
                              );
                            },
                            child: Container(
                              width: 280,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 2,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  // Image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      item.imageUrl,
                                      width: 96,
                                      height: 96,
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Container(
                                          width: 96,
                                          height: 96,
                                          color: Colors.grey[300],
                                          child: const Icon(
                                            Icons.broken_image,
                                            color: Colors.grey,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Content
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item.distanceTime,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item.title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(
                                              0xFF111827,
                                            ), // gray-900
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item.description,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              item.price,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(
                                                  0xFFDC2626,
                                                ), // red-600
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              item.originalPrice,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
