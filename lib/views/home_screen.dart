import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/destination_controller.dart';
import '../controllers/favorite_controller.dart';
import '../models/destination_model.dart';
import '../widgets/section_title.dart';
import 'destination_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final DestinationController controller;
  final FavoriteController favoriteController;
  final VoidCallback onGoToDestinations;

  const HomeScreen({
    super.key,
    required this.controller,
    required this.favoriteController,
    required this.onGoToDestinations,
  });

  @override
  Widget build(BuildContext context) {
    final featured = controller.getFeaturedDestinations();
    final historical = controller.getDestinationsByCategory('Historical');

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EF),
      body: CustomScrollView(
        slivers: [
          // ── Hero App Bar ──────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 240,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF1A1A2E),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background gradient
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF1A1A2E),
                          Color(0xFF8B2500),
                          Color(0xFFC0392B),
                        ],
                      ),
                    ),
                  ),
                  // Decorative pattern overlay
                  Opacity(
                    opacity: 0.05,
                    child: Image.network(
                      'https://www.transparenttextures.com/patterns/arabesque.png',
                      repeat: ImageRepeat.repeat,
                      errorBuilder: (_, __, ___) => const SizedBox(),
                    ),
                  ),
                  // Content
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '🇯🇴 Jordan',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Explore Jordan',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Discover the wonders of the Hashemite Kingdom',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Jordan Introduction ────────────────────────────────
                _JordanIntroSection(),

                // ── Featured Destinations ──────────────────────────────
                SectionTitle(
                  title: 'Featured Destinations',
                  subtitle: 'Hand-picked places you must visit',
                  onSeeAll: onGoToDestinations,
                ),
                SizedBox(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: featured.length,
                    itemBuilder: (context, index) {
                      return _FeaturedCard(
                        destination: featured[index],
                        onTap: () => _openDetails(context, featured[index]),
                      );
                    },
                  ),
                ),

                // ── Historical Places ──────────────────────────────────
                SectionTitle(
                  title: 'Historical Treasures',
                  subtitle: 'Thousands of years of human civilisation',
                  onSeeAll: onGoToDestinations,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: historical.length,
                  itemBuilder: (context, index) {
                    return _HistoricalListTile(
                      destination: historical[index],
                      onTap: () => _openDetails(context, historical[index]),
                    );
                  },
                ),

                // ── Jordan Facts ───────────────────────────────────────
                _JordanFactsSection(),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openDetails(BuildContext context, DestinationModel dest) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DestinationDetailsScreen(
          destination: dest,
          favoriteController: favoriteController,
        ),
      ),
    );
  }
}

// ── Jordan Introduction Card ────────────────────────────────────────────────
class _JordanIntroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 20, 16, 4),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A1A2E), Color(0xFF2D3561)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🏛️  Welcome to Jordan',
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Jordan is a land of ancient civilisations, dramatic desert landscapes, and legendary hospitality. Home to the rose-red city of Petra, the vast desert of Wadi Rum, the healing waters of the Dead Sea, and the Roman ruins of Jerash, Jordan offers a journey through 10,000 years of human history in one remarkable country.',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.white70,
              height: 1.65,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _StatBadge(icon: '🏛️', label: '10 UNESCO Sites'),
              _StatBadge(icon: '🌍', label: '10,000+ Years History'),
              _StatBadge(icon: '🛤️', label: 'King\'s Highway'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final String icon;
  final String label;
  const _StatBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$icon  $label',
        style: GoogleFonts.inter(
          fontSize: 11,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ── Featured Card ─────────────────────────────────────────────────────────
class _FeaturedCard extends StatelessWidget {
  final DestinationModel destination;
  final VoidCallback onTap;
  const _FeaturedCard({required this.destination, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 14, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Image
              Positioned.fill(
                child: Image.asset(
                  destination.assetImage,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFB5651D),
                      child: const Icon(Icons.landscape,
                          color: Colors.white, size: 50)),
                ),
              ),
              // Gradient overlay
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.75),
                      ],
                    ),
                  ),
                ),
              ),
              // Text
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 11, color: Color(0xFFFF6B6B)),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            destination.city,
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              color: Colors.white70,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Historical List Tile ──────────────────────────────────────────────────
class _HistoricalListTile extends StatelessWidget {
  final DestinationModel destination;
  final VoidCallback onTap;
  const _HistoricalListTile({required this.destination, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(
                  destination.assetImage,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFFB5651D),
                    child: const Icon(Icons.account_balance,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    destination.city,
                    style: GoogleFonts.inter(
                        fontSize: 12, color: Colors.grey[500]),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    destination.shortDescription,
                    style: GoogleFonts.inter(
                        fontSize: 12, color: Colors.grey[600], height: 1.4),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFFC0392B)),
          ],
        ),
      ),
    );
  }
}

// ── Jordan Facts Section ──────────────────────────────────────────────────
class _JordanFactsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final facts = [
      {'icon': '🏺', 'title': 'Petra', 'fact': 'Carved by the Nabataeans in the 4th century BC — a city of 30,000 people'},
      {'icon': '🏛️', 'title': 'Jerash', 'fact': '6,500 years of history — the best-preserved Roman city outside Italy'},
      {'icon': '🏰', 'title': 'As-Salt', 'fact': 'UNESCO World Heritage city — almost became Jordan\'s capital in 1921'},
      {'icon': '🌊', 'title': 'Dead Sea', 'fact': '430m below sea level — the lowest point on the surface of the Earth'},
      {'icon': '♨️', 'title': 'Hammam Ma\'een', 'fact': 'King Herod bathed here 2,000 years ago — hot springs at up to 63°C'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: 'Did You Know?',
          subtitle: 'Fascinating facts about Jordan',
        ),
        ...facts.map((f) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border(
              left: const BorderSide(color: Color(0xFFC0392B), width: 3),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(f['icon']!, style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      f['title']!,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A1A2E),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      f['fact']!,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
