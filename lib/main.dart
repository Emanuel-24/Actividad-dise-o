import 'package:flutter/material.dart';
import 'presentation/pages/home_page.dart';
import 'data/datasources/local/budget_local_datasource.dart';
import 'data/repositories/budget_repository_impl.dart';
import 'domain/usecases/get_budget_usecase.dart';
import 'domain/usecases/get_categories_usecase.dart';

void main() {
  final dataSource    = BudgetLocalDatasource();
  final repository    = BudgetRepositoryImpl(dataSource);
  final getBudget     = GetBudgetUsecase(repository);
  final getCategories = GetCategoriesUsecase(repository);
  runApp(MyApp(getBudget: getBudget, getCategories: getCategories));
}

class MyApp extends StatelessWidget {
  final GetBudgetUsecase getBudget;
  final GetCategoriesUsecase getCategories;
  const MyApp({super.key, required this.getBudget, required this.getCategories});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF0F2FF),
      ),
      home: HomePage(getBudget: getBudget, getCategories: getCategories),
    );
  }
}
