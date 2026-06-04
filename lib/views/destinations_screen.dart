import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/destination_controller.dart';
import '../controllers/favorite_controller.dart';
import '../models/destination_model.dart';
import '../widgets/destination_card.dart';
import '../widgets/category_chip.dart';
import 'destination_details_screen.dart';

class DestinationsScreen extends StatefulWidget {
  final DestinationController controller;
  final FavoriteController favoriteController;

  const DestinationsScreen({
    super.key,
    required this.controller,
    required this.favoriteController,
  });

  @override
  State<DestinationsScreen> createState() => _DestinationsScreenState();
}

class _DestinationsScreenState extends State<DestinationsScreen> {
  String _selectedCategory = 'All';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  List<String> get _categories => [
        'All',
        'Historical',
        'Nature',
        'Desert',
        'Religious',
      ];

  List<DestinationModel> get _filteredDestinations {
    List<DestinationModel> results;

    if (_searchQuery.isNotEmpty) {
      results = widget.controller.searchDestinations(_searchQuery);
    } else {
      results = widget.controller.getDestinationsByCategory(_selectedCategory);
    }

    return results;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final destinations = _filteredDestinations;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
        title: Text(
          'All Destinations',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Search places, cities, categories...',
                  hintStyle: GoogleFonts.inter(
                      color: Colors.white54, fontSize: 13),
                  prefixIcon: const Icon(Icons.search,
                      color: Colors.white54, size: 20),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close,
                              color: Colors.white54, size: 18),
                          onPressed: () {
                            setState(() {
                              _searchQuery = '';
                              _searchController.clear();
                            });
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onChanged: (val) => setState(() => _searchQuery = val),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // ── Category Filter Chips ─────────────────────────────────────
          Container(
            color: const Color(0xFF1A1A2E),
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final cat = _categories[index];
                      return CategoryChip(
                        label: cat,
                        isSelected: _selectedCategory == cat &&
                            _searchQuery.isEmpty,
                        onTap: () => setState(() {
                          _selectedCategory = cat;
                          _searchQuery = '';
                          _searchController.clear();
                        }),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),

          // ── Results Count ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
            child: Row(
              children: [
                Text(
                  '${destinations.length} place${destinations.length != 1 ? 's' : ''} found',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                if (_searchQuery.isNotEmpty)
                  Text(
                    'Search: "$_searchQuery"',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFFC0392B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),

          // ── Destinations List ─────────────────────────────────────────
          Expanded(
            child: destinations.isEmpty
                ? _EmptyState(query: _searchQuery)
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: destinations.length,
                    itemBuilder: (context, index) {
                      return DestinationCard(
                        destination: destinations[index],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DestinationDetailsScreen(
                              destination: destinations[index],
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

class _EmptyState extends StatelessWidget {
  final String query;
  const _EmptyState({required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off, size: 60, color: Color(0xFFD3B89A)),
          const SizedBox(height: 16),
          Text(
            query.isNotEmpty
                ? 'No results for "$query"'
                : 'No destinations in this category',
            style: GoogleFonts.inter(fontSize: 15, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
