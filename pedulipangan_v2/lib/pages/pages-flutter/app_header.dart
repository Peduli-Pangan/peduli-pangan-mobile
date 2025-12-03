import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final bool isScrolled;

  const AppHeader({super.key, this.isScrolled = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isScrolled ? Colors.white : Colors.transparent,
        boxShadow:
            isScrolled
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
                : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Close & Location
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIconBox(Icons.close, isScrolled),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color:
                      isScrolled
                          ? const Color(0xFFF5F5F5)
                          : Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color(0xFFE02020),
                      size: 12,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Jakarta Selatan',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color:
                            isScrolled ? const Color(0xFF333333) : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 12,
                      color:
                          isScrolled ? const Color(0xFF333333) : Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Right: Favorite & History
          Row(
            children: [
              _buildIconBox(Icons.favorite_border, isScrolled, isLarge: true),
              const SizedBox(width: 8),
              _buildIconBox(Icons.assignment, isScrolled, isLarge: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconBox(IconData icon, bool isScrolled, {bool isLarge = false}) {
    return Container(
      width: isLarge ? 36 : 32,
      height: isLarge ? 36 : 32,
      decoration: BoxDecoration(
        color:
            isScrolled
                ? const Color(0xFFF5F5F5)
                : Colors.black.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: isScrolled ? const Color(0xFF333333) : Colors.white,
        size: isLarge ? 20 : 18,
      ),
    );
  }
}
