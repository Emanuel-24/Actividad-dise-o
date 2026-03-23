import '../entities/budget_entity.dart';
import '../entities/category_entity.dart';

abstract class BudgetRepository {
  BudgetEntity getBudget();
  List<CategoryEntity> getCategories();
}
