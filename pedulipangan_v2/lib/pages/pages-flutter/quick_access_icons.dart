import 'package:flutter/material.dart';

class QuickAccessIcons extends StatelessWidget {
  const QuickAccessIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQaItem(
            Icons.local_shipping,
            const Color(0xFF00880D),
            'Ongkir',
            'MURAAAH',
          ),
          const SizedBox(width: 16),
          _buildQaItem(
            Icons.place,
            const Color(0xFFE02020),
            'Resto',
            'Terdekat',
          ),
          const SizedBox(width: 16),
          _buildQaItem(
            Icons.local_offer,
            const Color(0xFFE67E22),
            'Dimanja',
            'Promo',
            badge: '-40%',
          ),
          const SizedBox(width: 16),
          _buildQaItem(
            Icons.restaurant_menu,
            const Color(0xFF27AE60),
            'Menu',
            'Sehat',
          ),
          const SizedBox(width: 16),
          _buildQaItem(
            Icons.verified,
            const Color(0xFFF1C40F),
            'GoFood',
            'HEMAT',
          ),
        ],
      ),
    );
  }

  Widget _buildQaItem(
    IconData icon,
    Color color,
    String label1,
    String label2, {
    String? badge,
  }) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFF8F8F8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            if (badge != null)
              Positioned(
                top: -5,
                right: -5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF333333),
              height: 1.2,
              fontFamily: 'Inter',
            ),
            children: [
              TextSpan(text: '$label1\n'),
              TextSpan(
                text: label2,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
