import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/destination_controller.dart';
import '../controllers/favorite_controller.dart';
import '../models/category_model.dart';
import '../models/destination_model.dart';
import '../widgets/destination_card.dart';
import 'destination_details_screen.dart';

class CategoriesScreen extends StatefulWidget {
  final DestinationController controller;
  final FavoriteController favoriteController;

  const CategoriesScreen({
    super.key,
    required this.controller,
    required this.favoriteController,
  });

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoryModel? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final categories = widget.controller.getAllCategories();
    final filtered = _selectedCategory == null
        ? <DestinationModel>[]
        : widget.controller
            .getDestinationsByCategory(_selectedCategory!.name);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
        title: Text(
          'Browse by Category',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Category Grid ───────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.6,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final isSelected = _selectedCategory?.id == cat.id;
                return GestureDetector(
                  onTap: () => setState(() {
                    _selectedCategory = isSelected ? null : cat;
                  }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isSelected ? cat.color : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected
                            ? cat.color
                            : cat.color.withValues(alpha: 0.3),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isSelected
                              ? cat.color.withValues(alpha: 0.35)
                              : Colors.black.withValues(alpha: 0.07),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                cat.icon,
                                color: isSelected ? Colors.white : cat.color,
                                size: 28,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.white.withValues(alpha: 0.25)
                                      : cat.color.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '${widget.controller.getDestinationsByCategory(cat.name).length}',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? Colors.white : cat.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            cat.name,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF1A1A2E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // ── Category description ────────────────────────────────────
          if (_selectedCategory != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _selectedCategory!.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: _selectedCategory!.color.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    Icon(_selectedCategory!.icon,
                        color: _selectedCategory!.color, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _selectedCategory!.description,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF3D3D3D),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // ── Results header ──────────────────────────────────────────
          if (_selectedCategory != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: Text(
                '${filtered.length} place${filtered.length != 1 ? 's' : ''} in ${_selectedCategory!.name}',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

          // ── Destination results ─────────────────────────────────────
          Expanded(
            child: _selectedCategory == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.touch_app_outlined,
                            size: 56, color: Colors.grey[300]),
                        const SizedBox(height: 12),
                        Text(
                          'Tap a category to explore',
                          style: GoogleFonts.inter(
                              fontSize: 15, color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      return DestinationCard(
                        destination: filtered[index],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DestinationDetailsScreen(
                              destination: filtered[index],
                              favoriteController: widget.favoriteController,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
