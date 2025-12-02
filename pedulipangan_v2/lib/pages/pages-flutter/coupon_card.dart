import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isLast;

  const CouponCard({
    super.key,
    required this.title,
    required this.description,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 80,
      margin: EdgeInsets.only(right: isLast ? 16 : 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFFFCCCC)),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFF0F0), Colors.white],
          stops: [0.5, 0.5],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            color: const Color(0xFFE02020),
            child: const Center(
              child: Icon(Icons.percent, color: Colors.white, size: 18),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111111),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
