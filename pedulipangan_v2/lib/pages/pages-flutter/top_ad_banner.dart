import 'package:flutter/material.dart';

class TopAdBanner extends StatelessWidget {
  const TopAdBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: PageView(
        children: [
          _buildAdSlide(
            imageUrl:
                'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?q=80&w=800&auto=format&fit=crop',
            brand: 'WING STOP',
            title: 'PAYDAY DEAL 10 AYAM',
            price: '93,6rb',
            originalPrice: '120rb',
            brandColor: Colors.white,
            brandTextColor: Colors.black,
          ),
          _buildAdSlide(
            imageUrl:
                'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=800&auto=format&fit=crop',
            brand: 'PIZZA HUT',
            title: 'LIMO PIZZA 1 METER',
            price: '250rb',
            originalPrice: '300rb',
            brandColor: const Color(0xFFE02020),
            brandTextColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildAdSlide({
    required String imageUrl,
    required String brand,
    required String title,
    required String price,
    required String originalPrice,
    required Color brandColor,
    required Color brandTextColor,
  }) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image, color: Colors.grey),
              );
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.black.withOpacity(0.7), Colors.transparent],
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 16,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: brandColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    brand,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: brandTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      originalPrice,
                      style: const TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
