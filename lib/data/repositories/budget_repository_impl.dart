import '../../domain/entities/budget_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/budget_repository.dart';
import '../datasources/local/budget_local_datasource.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetLocalDatasource dataSource;
  const BudgetRepositoryImpl(this.dataSource);

  @override
  BudgetEntity getBudget() => dataSource.fetchBudget();

  @override
  List<CategoryEntity> getCategories() => dataSource.fetchCategories();
}