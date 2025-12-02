import 'package:flutter/material.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFDDDDDD)),
            ),
            child: const Icon(Icons.tune, color: Color(0xFF333333), size: 16),
          ),
          const SizedBox(width: 8),
          _buildChip('Terdekat', isSelected: true),
          const SizedBox(width: 8),
          _buildChip('Bintang 4.5+'),
          const SizedBox(width: 8),
          _buildChip('Kuliner', hasDropdown: true),
        ],
      ),
    );
  }

  Widget _buildChip(
    String label, {
    bool isSelected = false,
    bool hasDropdown = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF333333) : const Color(0xFFDDDDDD),
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: const Color(0xFF333333),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          if (hasDropdown) ...[
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 16,
              color: Color(0xFF333333),
            ),
          ],
        ],
      ),
    );
  }
}
