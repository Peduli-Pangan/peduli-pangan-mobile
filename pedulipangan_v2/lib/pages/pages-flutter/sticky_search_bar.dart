import 'package:flutter/material.dart';

class StickySearchBar extends StatelessWidget {
  final bool isScrolled;

  const StickySearchBar({super.key, this.isScrolled = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:
            isScrolled
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
                : [],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFFEEEEEE)),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Color(0xFF555555), size: 20),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Lagi mau mamam apa?',
                style: TextStyle(color: Color(0xFF333333), fontSize: 14),
              ),
            ),
            const Icon(Icons.restaurant, color: Color(0xFFE02020), size: 20),
          ],
        ),
      ),
    );
  }
}
