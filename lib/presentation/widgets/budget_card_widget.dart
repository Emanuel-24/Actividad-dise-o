import 'package:flutter/material.dart';
import '../../domain/entities/budget_entity.dart';

class BudgetCardWidget extends StatelessWidget {
  final BudgetEntity budget;
  const BudgetCardWidget({super.key, required this.budget});

  String _fmt(double v) {
    final parts = v.toStringAsFixed(2).split('.');
    final intPart = parts[0].replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.');
    return '\$ $intPart,${parts[1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
      decoration: BoxDecoration(
        color: const Color(0xFF3D5AFE),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Your budget',
              style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 6),
          Text(_fmt(budget.total),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          _RowItem(
            icon: Icons.arrow_upward,
            label: 'Incomes',
            amount: _fmt(budget.incomes),
            period: budget.period,
            iconColor: const Color(0xFF00C853),
          ),
          const SizedBox(height: 12),
          _RowItem(
            icon: Icons.arrow_downward,
            label: 'Spending',
            amount: _fmt(budget.spending),
            period: budget.period,
            iconColor: const Color(0xFFFF1744),
          ),
        ],
      ),
    );
  }
}

class _RowItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String amount;
  final String period;
  final Color iconColor;

  const _RowItem({
    required this.icon,
    required this.label,
    required this.amount,
    required this.period,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(width: 12),
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 15)),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
              Text(period,
                  style:
                      const TextStyle(color: Colors.white60, fontSize: 10)),
            ],
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.chevron_right,
                color: Colors.white, size: 16),
          ),
        ],
      ),
    );
  }
}
