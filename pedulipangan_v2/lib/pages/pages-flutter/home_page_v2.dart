import 'package:flutter/material.dart';
import 'app_header.dart';
import 'top_ad_banner.dart';
import 'sticky_search_bar.dart';
import 'quick_access_icons.dart';
import 'section_header.dart';
import 'surplus_card.dart';
import 'portrait_card.dart';
import 'filter_chips.dart';
import 'big_surplus_card.dart';
import 'promo_slider.dart';
import 'coupon_card.dart';
import 'category_grid.dart';
import 'floating_bottom_banner.dart';
import 'package:pedulipangan_v2/models/product_model.dart';
import 'package:pedulipangan_v2/models/category_model.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({super.key});

  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 50 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 50 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // 1. Top Ad Banner (Not pinned, scrolls away)
              // const SliverToBoxAdapter(child: TopAdBanner()),

              // 2. Sticky Search Bar
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickySearchBarDelegate(
                  child: StickySearchBar(isScrolled: _isScrolled),
                ),
              ),

              // Rest of the content
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      bottom: 100,
                    ), // Space for floating banner
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 3. Quick Access Icons
                        const QuickAccessIcons(),

                        // 4. Section: Sambil kumpul bareng teman
                        SectionHeader(
                          title: 'Sambil kumpul bareng teman',
                          onSeeAll: () {},
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                          child: Row(
                            children: [
                              SurplusCard(
                                product: ProductModel(
                                  id: 1,
                                  createdAt: DateTime.now(),
                                  nama: 'Mie Gacoan, Surabaya Wiyung',
                                  slug: 'mie-gacoan',
                                  harga: 25000,
                                  stock: 10,
                                  condition: 'good',
                                  shortDesc: 'Mie pedas viral',
                                  longDesc: 'Mie pedas dengan berbagai level',
                                  rating: 4.9,
                                  isActive: true,
                                  merchantId: 1,
                                  categoryId: 1,
                                  tag: 'Bakmie, Jajanan',
                                ),
                                imageUrl:
                                    'https://images.unsplash.com/photo-1541592103007-ce9a43363b2f?q=80&w=600&auto=format&fit=crop',
                                time: '25-35 min',
                                distance: '5.26 km',
                                discountText: 'Diskon 50%, maks. 129rb',
                                timer: '00 : 19 : 47',
                              ),
                              SurplusCard(
                                product: ProductModel(
                                  id: 2,
                                  createdAt: DateTime.now(),
                                  nama: 'Sate HQQ, Jln Kemlaten Baru',
                                  slug: 'sate-hqq',
                                  harga: 20000,
                                  stock: 15,
                                  condition: 'good',
                                  shortDesc: 'Sate ayam enak',
                                  longDesc:
                                      'Sate ayam dengan bumbu kacang khas',
                                  rating: 4.8,
                                  isActive: true,
                                  merchantId: 2,
                                  categoryId: 2,
                                  tag: 'Sate',
                                ),
                                imageUrl:
                                    'https://images.unsplash.com/photo-1552895638-f7fe08d2f7d5?q=80&w=600&auto=format&fit=crop',
                                time: '20-30 min',
                                distance: '2.21 km',
                                discountText: '45% off & Gojek PLUS',
                                timer: '00 : 15 : 00',
                              ),
                            ],
                          ),
                        ),

                        // 5. Section: Coba yang Baru di GoFood!
                        const SizedBox(height: 12),
                        SectionHeader(
                          title: 'Coba yang Baru di GoFood!',
                          subtitle: 'Ini dia UMKM favorit foodies lokal.',
                          onSeeAll: () {},
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                          child: Row(
                            children: [
                              PortraitCard(
                                product: ProductModel(
                                  id: 3,
                                  createdAt: DateTime.now(),
                                  nama: 'Slice n Sip, Jl. Raya Darmo',
                                  slug: 'slice-n-sip',
                                  harga: 30000,
                                  stock: 20,
                                  condition: 'good',
                                  shortDesc: 'Kopi, Barat, Pizza',
                                  longDesc: 'Cafe nyaman dengan kopi enak',
                                  rating: 5.0,
                                  isActive: true,
                                  merchantId: 3,
                                  categoryId: 3,
                                  tag: 'Kopi, Barat, Pizza',
                                ),
                                imageUrl:
                                    'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=400&auto=format&fit=crop',
                              ),
                              PortraitCard(
                                product: ProductModel(
                                  id: 4,
                                  createdAt: DateTime.now(),
                                  nama: 'Ubi madu bakar',
                                  slug: 'ubi-madu',
                                  harga: 15000,
                                  stock: 50,
                                  condition: 'good',
                                  shortDesc: 'Jajanan, Cepat saji',
                                  longDesc: 'Ubi madu manis alami',
                                  rating: 5.0,
                                  isActive: true,
                                  merchantId: 4,
                                  categoryId: 4,
                                  tag: 'Jajanan, Cepat saji',
                                ),
                                imageUrl:
                                    'https://images.unsplash.com/photo-1600093463592-8e36ae95ef56?q=80&w=400&auto=format&fit=crop',
                              ),
                              PortraitCard(
                                product: ProductModel(
                                  id: 5,
                                  createdAt: DateTime.now(),
                                  nama: 'Moon Chicken',
                                  slug: 'moon-chicken',
                                  harga: 45000,
                                  stock: 25,
                                  condition: 'good',
                                  shortDesc: 'Korea, Ayam',
                                  longDesc: 'Ayam goreng ala Korea',
                                  rating: 4.8,
                                  isActive: true,
                                  merchantId: 5,
                                  categoryId: 5,
                                  tag: 'Korea, Ayam',
                                ),
                                imageUrl:
                                    'https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?q=80&w=400&auto=format&fit=crop',
                              ),
                              PortraitCard(
                                product: ProductModel(
                                  id: 6,
                                  createdAt: DateTime.now(),
                                  nama: 'Moon tek',
                                  slug: 'moon-tek',
                                  harga: 45000,
                                  stock: 25,
                                  condition: 'goodes',
                                  shortDesc: 'Koreaaa, Ayammuh',
                                  longDesc: 'Ayam goreng ala Korea',
                                  rating: 4.8,
                                  isActive: true,
                                  merchantId: 5,
                                  categoryId: 5,
                                  tag: 'Korea, Ayam',
                                ),
                                imageUrl:
                                    'https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?q=80&w=400&auto=format&fit=crop',
                              ),
                            ],
                          ),
                        ),

                        // 6. Section: Jajanan tengah malam
                        const SizedBox(height: 12),
                        const SectionHeader(
                          title: 'Jajanan tengah malam enak buat kamu',
                          subtitle: 'Coba yang Baru di GoFood!',
                        ),
                        const FilterChips(),
                        BigSurplusCard(
                          product: ProductModel(
                            id: 6,
                            createdAt: DateTime.now(),
                            nama: 'Mie Gacoan, Surabaya Wiyung',
                            slug: 'mie-gacoan-2',
                            harga: 25000,
                            stock: 10,
                            condition: 'good',
                            shortDesc: 'Mie pedas viral',
                            longDesc: 'Mie pedas dengan berbagai level',
                            rating: 4.9,
                            isActive: true,
                            merchantId: 1,
                            categoryId: 1,
                            tag: 'Bakmie, Jajanan',
                          ),
                          imageUrl:
                              'https://images.unsplash.com/photo-1541592103007-ce9a43363b2f?q=80&w=600&auto=format&fit=crop',
                          time: '25-35 min',
                          distance: '5.26 km',
                          discountText: 'Diskon 50%, maks. 129rb',
                          timer: '00 : 19 : 47',
                        ),
                        BigSurplusCard(
                          product: ProductModel(
                            id: 7,
                            createdAt: DateTime.now(),
                            nama: 'Sate HQQ, Jln Kemlaten Baru',
                            slug: 'sate-hqq-2',
                            harga: 20000,
                            stock: 15,
                            condition: 'good',
                            shortDesc: 'Sate ayam enak',
                            longDesc: 'Sate ayam dengan bumbu kacang khas',
                            rating: 4.8,
                            isActive: true,
                            merchantId: 2,
                            categoryId: 2,
                            tag: 'Sate',
                          ),
                          imageUrl:
                              'https://images.unsplash.com/photo-1606502973872-dae638d82699?q=80&w=600&auto=format&fit=crop',
                          time: '20-30 min',
                          distance: '2.21 km',
                          discountText: '45% off & Gojek PLUS',
                          timer: '00 : 15 : 00',
                        ),

                        // 7. Section: Cek yang menarik
                        const SizedBox(height: 12),
                        const SectionHeader(
                          title: 'Cek yang menarik di GoFood',
                        ),
                        const PromoSlider(),

                        // 9. Section: Pilihan kuliner favoritmu
                        SectionHeader(
                          title: 'Pilihan kuliner favoritmu',
                          onSeeAll: () {},
                        ),
                        CategoryGrid(
                          categories: [
                            CategoryModel(
                              id: 1,
                              createdAt: DateTime.now(),
                              nama: 'Jajanan',
                              slug: 'jajanan',
                            ),
                            CategoryModel(
                              id: 2,
                              createdAt: DateTime.now(),
                              nama: 'Sweets',
                              slug: 'sweets',
                            ),
                            CategoryModel(
                              id: 3,
                              createdAt: DateTime.now(),
                              nama: 'Martabak',
                              slug: 'martabak',
                            ),
                            CategoryModel(
                              id: 4,
                              createdAt: DateTime.now(),
                              nama: 'Bakso & Soto',
                              slug: 'bakso-soto',
                            ),
                            CategoryModel(
                              id: 5,
                              createdAt: DateTime.now(),
                              nama: 'Aneka Nasi',
                              slug: 'aneka-nasi',
                            ),
                            CategoryModel(
                              id: 6,
                              createdAt: DateTime.now(),
                              nama: 'Minuman',
                              slug: 'minuman',
                            ),
                            CategoryModel(
                              id: 7,
                              createdAt: DateTime.now(),
                              nama: 'Chinese',
                              slug: 'chinese',
                            ),
                            CategoryModel(
                              id: 8,
                              createdAt: DateTime.now(),
                              nama: 'Korea',
                              slug: 'korea',
                            ),
                          ],
                        ),

                        // 10. Section: Resto dengan rating jempolan
                        const SectionHeader(
                          title: 'Resto dengan rating jempolan',
                          label: 'Ad',
                        ),
                        // Reusing SurplusCard but with different style if needed,
                        // but for now using SurplusCard as placeholder or I can create a SimpleLandscapeCard if strict match is needed.
                        // The HTML uses 'card-landscape' which is similar but simpler than Surplus.
                        // I'll stick to SurplusCard for consistency as per user goal of refactoring,
                        // or I can quickly add a SimpleLandscapeCard if I want to be precise.
                        // Given the instruction "Refactoring Homepage UI... updating card designs to match... component-surplus",
                        // I will use SurplusCard style for these too, or just reuse the component.
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                          child: Row(
                            children: [
                              SurplusCard(
                                product: ProductModel(
                                  id: 8,
                                  createdAt: DateTime.now(),
                                  nama: 'Uno Chicken (Hangry)',
                                  slug: 'uno-chicken',
                                  harga: 30000,
                                  stock: 30,
                                  condition: 'good',
                                  shortDesc: 'Ayam goreng',
                                  longDesc: 'Ayam goreng renyah',
                                  rating: 4.7,
                                  isActive: true,
                                  merchantId: 6,
                                  categoryId: 5,
                                  tag: 'Chicken',
                                ),
                                imageUrl:
                                    'https://images.unsplash.com/photo-1569691899455-88464f6d3ab1?q=80&w=400&auto=format&fit=crop',
                                time: '20-30 min',
                                distance: '5.03 km',
                                discountText: '26% off',
                                timer: '00 : 30 : 00',
                              ),
                              SurplusCard(
                                product: ProductModel(
                                  id: 9,
                                  createdAt: DateTime.now(),
                                  nama: 'Bishi Bento by Hangry',
                                  slug: 'bishi-bento',
                                  harga: 35000,
                                  stock: 20,
                                  condition: 'good',
                                  shortDesc: 'Bento Jepang',
                                  longDesc: 'Bento lezat dan praktis',
                                  rating: 5.0,
                                  isActive: true,
                                  merchantId: 6,
                                  categoryId: 6,
                                  tag: 'Bento',
                                ),
                                imageUrl:
                                    'https://images.unsplash.com/photo-1619881589316-56c7f9e6b587?q=80&w=400&auto=format&fit=crop',
                                time: '20-30 min',
                                distance: '5.03 km',
                                discountText: '54% off',
                                timer: '00 : 45 : 00',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // App Header (Fixed on top)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppHeader(isScrolled: _isScrolled),
          ),

          // Floating Bottom Banner
          const FloatingBottomBanner(),
        ],
      ),
    );
  }
}

class _StickySearchBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickySearchBarDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => 70; // Height of search bar container

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
