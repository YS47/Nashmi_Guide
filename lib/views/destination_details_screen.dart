import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/favorite_controller.dart';
import '../models/destination_model.dart';

class DestinationDetailsScreen extends StatefulWidget {
  final DestinationModel destination;
  final FavoriteController favoriteController;

  const DestinationDetailsScreen({
    super.key,
    required this.destination,
    required this.favoriteController,
  });

  @override
  State<DestinationDetailsScreen> createState() =>
      _DestinationDetailsScreenState();
}

class _DestinationDetailsScreenState extends State<DestinationDetailsScreen> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite =
        widget.favoriteController.isFavorite(widget.destination.id);
  }

  void _toggleFavorite() {
    setState(() {
      widget.favoriteController.toggleFavorite(widget.destination);
      _isFavorite = widget.favoriteController.isFavorite(widget.destination.id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite
              ? '❤️ Added to favourites'
              : '💔 Removed from favourites',
          style: GoogleFonts.inter(fontSize: 13),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFF1A1A2E),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final dest = widget.destination;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EF),
      body: CustomScrollView(
        slivers: [
          // ── Hero Image App Bar ────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: const Color(0xFF1A1A2E),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: _toggleFavorite,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.red[400] : Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    dest.assetImage,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFF2D3561),
                      child: const Icon(Icons.landscape,
                          color: Colors.white38, size: 80),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.6),
                        ],
                      ),
                    ),
                  ),
                  // Name overlay at bottom of image
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _CategoryBadge(category: dest.category),
                        const SizedBox(height: 6),
                        Text(
                          dest.name,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 14, color: Color(0xFFFF6B6B)),
                            const SizedBox(width: 4),
                            Text(
                              dest.city,
                              style: GoogleFonts.inter(
                                  fontSize: 13, color: Colors.white70),
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

          // ── Body Content ──────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick Info Row
                  _QuickInfoRow(destination: dest),
                  const SizedBox(height: 20),

                  // Full Description
                  _SectionHeader(title: 'About ${dest.name}', icon: Icons.info_outline),
                  const SizedBox(height: 10),
                  Text(
                    dest.fullDescription,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF3D3D3D),
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Activities
                  _SectionHeader(
                      title: 'Things to Do', icon: Icons.explore_outlined),
                  const SizedBox(height: 10),
                  ...dest.activities.map((a) => _BulletItem(text: a,
                      color: const Color(0xFF2E8B57))),
                  const SizedBox(height: 24),

                  // Tips
                  _SectionHeader(
                      title: 'Travel Tips', icon: Icons.lightbulb_outline),
                  const SizedBox(height: 10),
                  ...dest.tips.map((t) => _BulletItem(
                      text: t, color: const Color(0xFFB5651D))),
                  const SizedBox(height: 24),

                  // Book a Ticket button
                  const BookTicketButton(),
                  const SizedBox(height: 10),

                  // Favorite button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: _toggleFavorite,
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 20,
                        color: const Color(0xFFC0392B),
                      ),
                      label: Text(
                        _isFavorite
                            ? 'Saved to Favourites'
                            : 'Save to Favourites',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFC0392B),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0xFFC0392B), width: 1.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Quick Info Row ────────────────────────────────────────────────────────
class _QuickInfoRow extends StatelessWidget {
  final DestinationModel destination;
  const _QuickInfoRow({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 10,
              offset: const Offset(0, 3))
        ],
      ),
      child: Row(
        children: [
          _InfoItem(
            icon: Icons.confirmation_number_outlined,
            label: 'Entry Fee',
            value: destination.ticketPrice,
            color: const Color(0xFF8B6914),
          ),
          _Divider(),
          _InfoItem(
            icon: Icons.calendar_month_outlined,
            label: 'Best Time',
            value: destination.bestTimeToVisit,
            color: const Color(0xFF2E8B57),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  const _InfoItem(
      {required this.icon,
      required this.label,
      required this.value,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 6),
          Text(label,
              style: GoogleFonts.inter(
                  fontSize: 11, color: Colors.grey[500])),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1A1A2E)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40, width: 1, color: Colors.grey[200],
        margin: const EdgeInsets.symmetric(horizontal: 8));
  }
}

// ── Section Header ────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFC0392B), size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A2E),
          ),
        ),
      ],
    );
  }
}

// ── Bullet Item ───────────────────────────────────────────────────────────
class _BulletItem extends StatelessWidget {
  final String text;
  final Color color;
  const _BulletItem({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, right: 10),
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: const Color(0xFF3D3D3D),
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Category Badge ────────────────────────────────────────────────────────
class _CategoryBadge extends StatelessWidget {
  final String category;
  const _CategoryBadge({required this.category});

  Color get _color {
    switch (category) {
      case 'Historical': return const Color(0xFFB5651D);
      case 'Nature':     return const Color(0xFF2E8B57);
      case 'Desert':     return const Color(0xFFCD853F);
      case 'Religious':  return const Color(0xFF6A5ACD);
      default:           return const Color(0xFF546E7A);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        category,
        style: GoogleFonts.inter(
          fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }
}

// ── Book Ticket Button (Stateful Widget) ──────────────────────────────────
class BookTicketButton extends StatefulWidget {
  const BookTicketButton({super.key});

  @override
  State<BookTicketButton> createState() => _BookTicketButtonState();
}

class _BookTicketButtonState extends State<BookTicketButton> {
  bool _showComingSoon = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            _showComingSoon = true;
          });
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Ticket booking is coming soon in the next update!',
                style: GoogleFonts.inter(fontWeight: FontWeight.w500),
              ),
              backgroundColor: const Color(0xFF1A1A2E),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
            ),
          );
        },
        icon: Icon(
          _showComingSoon ? Icons.hourglass_empty : Icons.confirmation_number_outlined,
          size: 20,
        ),
        label: Text(
          _showComingSoon ? 'Coming Soon!' : 'Book a Ticket',
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8B6914),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 3,
        ),
      ),
    );
  }
}
