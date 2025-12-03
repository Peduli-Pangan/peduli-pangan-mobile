import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double rating;
  final String ratingCount;
  final String tags; // e.g., "30rb-40rb • Aneka nasi, Ayam & bebek"
  final String deliveryInfo; // e.g., "20-30 min • Ongkir 18.3rb"
  final String? originalDeliveryFee; // e.g., "29.3rb"
  final String? discount; // e.g., "Diskon 45%, maks. 117rb"
  final bool isAd;
  final bool isClosingSoon;
  final String? closingTime; // e.g., "13 min"

  const RestaurantCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.ratingCount,
    required this.tags,
    required this.deliveryInfo,
    this.originalDeliveryFee,
    this.discount,
    this.isAd = false,
    this.isClosingSoon = false,
    this.closingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF0F0F0))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Side: Image & Rating
          Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: -8,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFF0F0F0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 12,
                              color: Color(0xFFFF7800),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              rating.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1C1C1C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                ratingCount,
                style: const TextStyle(fontSize: 10, color: Color(0xFF687176)),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Right Side: Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isClosingSoon && closingTime != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      '🕒 Tutup dalam $closingTime',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFE55300),
                      ),
                    ),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C1C1C),
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isAd)
                      Container(
                        margin: const EdgeInsets.only(left: 4, top: 2),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F0F0),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Text(
                          'Ad',
                          style: TextStyle(
                            fontSize: 9,
                            color: Color(0xFF999999),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  tags,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF687176),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text('🛵 ', style: TextStyle(fontSize: 12)),
                    Text(
                      deliveryInfo,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF687176),
                      ),
                    ),
                    if (originalDeliveryFee != null) ...[
                      const SizedBox(width: 4),
                      Text(
                        originalDeliveryFee!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF9A9A9A),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
                if (discount != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text('🏷️ ', style: TextStyle(fontSize: 12)),
                      Expanded(
                        child: Text(
                          discount!,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE02424),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
