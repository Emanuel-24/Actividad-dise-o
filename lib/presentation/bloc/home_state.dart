import 'package:equatable/equatable.dart';
import '../../domain/entities/budget_entity.dart';
import '../../domain/entities/category_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final BudgetEntity budget;
  final List<CategoryEntity> categories;
  final int selectedTab;

  const HomeLoaded({
    required this.budget,
    required this.categories,
    this.selectedTab = 0,
  });

  HomeLoaded copyWith({int? selectedTab}) => HomeLoaded(
        budget:      budget,
        categories:  categories,
        selectedTab: selectedTab ?? this.selectedTab,
      );

  @override
  List<Object?> get props => [budget, categories, selectedTab];
}
