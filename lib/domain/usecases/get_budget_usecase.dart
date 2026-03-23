import '../entities/budget_entity.dart';
import '../repositories/budget_repository.dart';

class GetBudgetUsecase {
  final BudgetRepository repository;
  const GetBudgetUsecase(this.repository);
  BudgetEntity call() => repository.getBudget();
}
