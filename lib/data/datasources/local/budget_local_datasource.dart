import '../../models/budget_model.dart';
import '../../models/category_model.dart';

class BudgetLocalDatasource {
  BudgetModel fetchBudget() => BudgetModel.fromMap({
        'total':    2868000.00,
        'incomes':  700000.00,
        'spending': 90000.00,
        'period':   'From January 1 to January 31',
      });

  List<CategoryModel> fetchCategories() => [
        CategoryModel.fromMap({
          'name':        'Food & Drink',
          'iconPath':    '🍕',
          'todayAmount': 2250,
          'totalAmount': 391254.01,
          'percentage':  1.8,
          'isPositive':  true,
        }),
        CategoryModel.fromMap({
          'name':        'Electronics',
          'iconPath':    '🖥️',
          'todayAmount': 2250,
          'totalAmount': 3176254.01,
          'percentage':  43.6,
          'isPositive':  true,
        }),
        CategoryModel.fromMap({
          'name':        'Health',
          'iconPath':    '🫧',
          'todayAmount': 110,
          'totalAmount': 38.01,
          'percentage':  25.6,
          'isPositive':  false,
        }),
      ];
}
