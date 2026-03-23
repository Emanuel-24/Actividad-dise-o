import 'package:flutter/material.dart';
import '../../domain/entities/category_entity.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryEntity category;
  const CategoryItemWidget({super.key, required this.category});

  String _fmt(double v) {
    final parts = v.toStringAsFixed(2).split('.');
    final intPart = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return '\$ $intPart,${parts[1]}';
  }

  @override
  Widget build(BuildContext context) {
    final color = category.isPositive
        ? const Color(0xFF00C853)
        : const Color(0xFFFF1744);
    final arrow = category.isPositive
        ? Icons.arrow_upward
        : Icons.arrow_downward;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                category.iconPath,
                style: const TextStyle(fontSize: 26),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '+ \$ ${_fmt(category.todayAmount).replaceAll('\$ ', '')} Today',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  _fmt(category.totalAmount),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF3D5AFE),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(arrow, color: color, size: 12),
                const SizedBox(width: 2),
                Text(
                  '${category.percentage} %',
                  style: TextStyle(
                    color: color,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
