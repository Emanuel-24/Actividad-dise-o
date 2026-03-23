import '../../domain/entities/budget_entity.dart';

class BudgetModel extends BudgetEntity {
  const BudgetModel({
    required super.total,
    required super.incomes,
    required super.spending,
    required super.period,
  });

  factory BudgetModel.fromMap(Map<String, dynamic> map) => BudgetModel(
        total:    (map['total'] as num).toDouble(),
        incomes:  (map['incomes'] as num).toDouble(),
        spending: (map['spending'] as num).toDouble(),
        period:   map['period'],
      );
}
