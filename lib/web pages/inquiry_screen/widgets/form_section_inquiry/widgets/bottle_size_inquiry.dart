import 'package:flutter/material.dart';

class BottleSizeSection extends StatelessWidget {
  final Set<String> selected;
  final ValueChanged<String> onToggle;

  const BottleSizeSection({super.key, required this.selected, required this.onToggle});


  @override
  Widget build(BuildContext context) {
    final sizes = ['250 ml', '500 ml', '1 L', 'Not sure'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Bottle Size",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2A44),
          ),
        ),
        const SizedBox(height: 12),

        Wrap(
          spacing: 24,
          runSpacing: 12,
          children: sizes.map((size) {
            final isSelected = selected.contains(size);

            return InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => onToggle(size),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: (_) => onToggle(size),
                    activeColor: const Color(0xFF3558C9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Text(
                    size,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF1F2A44),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
