import 'package:flutter/material.dart';

class PremiumButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool isPrimary;

  const PremiumButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isPrimary = true,
  });

  @override
  State<PremiumButton> createState() => _PremiumButtonState();
}

class _PremiumButtonState extends State<PremiumButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF2a54b0);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: widget.isPrimary
              ? (_hovering
              ? primaryBlue.withOpacity(0.92)
              : primaryBlue)
              : Colors.white,
          borderRadius: BorderRadius.circular(999), // pill
          border: widget.isPrimary
              ? null
              : Border.all(
            color: primaryBlue.withOpacity(0.35),
            width: 1.4,
          ),
          boxShadow: widget.isPrimary
              ? [
            BoxShadow(
              color: primaryBlue.withOpacity(0.18),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ]
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 34,
                vertical: 16,
              ),
              child: Text(
                widget.text,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: widget.isPrimary
                      ? Colors.white
                      : primaryBlue,
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
