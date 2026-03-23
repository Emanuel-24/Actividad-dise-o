import '../entities/category_entity.dart';
import '../repositories/budget_repository.dart';

class GetCategoriesUsecase {
  final BudgetRepository repository;
  const GetCategoriesUsecase(this.repository);
  List<CategoryEntity> call() => repository.getCategories();
}
