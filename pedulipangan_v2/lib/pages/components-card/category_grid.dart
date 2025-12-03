import 'package:flutter/material.dart';
import 'package:pedulipangan_v2/models/category_model.dart';

class CategoryGrid extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryGrid({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 4,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      children:
          categories.map((category) {
            return _buildCategoryItem(
              _getImageUrl(category.slug),
              category.nama,
            );
          }).toList(),
    );
  }

  String _getImageUrl(String slug) {
    switch (slug) {
      case 'jajanan':
        return 'https://images.unsplash.com/photo-1541592103007-ce9a43363b2f?q=80&w=150&auto=format&fit=crop';
      case 'sweets':
        return 'https://images.unsplash.com/photo-1579372786545-d24232daf58c?q=80&w=150&auto=format&fit=crop';
      case 'martabak':
        return 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=150&auto=format&fit=crop';
      case 'bakso-soto':
        return 'https://images.unsplash.com/photo-1569691899455-88464f6d3ab1?q=80&w=150&auto=format&fit=crop';
      case 'aneka-nasi':
        return 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?q=80&w=150&auto=format&fit=crop';
      case 'minuman':
        return 'https://images.unsplash.com/photo-1551024709-8f23befc6f87?q=80&w=150&auto=format&fit=crop';
      case 'chinese':
        return 'https://images.unsplash.com/photo-1563245372-f21724e3856d?q=80&w=150&auto=format&fit=crop';
      case 'korea':
        return 'https://images.unsplash.com/photo-1585032226651-759b368d7246?q=80&w=150&auto=format&fit=crop';
      default:
        return 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=150&auto=format&fit=crop';
    }
  }

  Widget _buildCategoryItem(String imageUrl, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFF0F0F0),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, color: Color(0xFF333333)),
        ),
      ],
    );
  }
}
