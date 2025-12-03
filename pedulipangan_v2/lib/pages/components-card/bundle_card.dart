import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BundleCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int originalPrice;
  final int discountedPrice;

  const BundleCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.originalPrice,
    required this.discountedPrice,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: '',
      decimalDigits: 0,
    );

    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              height: 160,
              width: 160,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 160,
                  width: 160,
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            currencyFormatter.format(originalPrice),
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF999999),
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            currencyFormatter.format(discountedPrice),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
