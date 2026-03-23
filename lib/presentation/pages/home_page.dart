import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_budget_usecase.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/budget_card_widget.dart';
import '../widgets/category_item_widget.dart';

class HomePage extends StatelessWidget {
  final GetBudgetUsecase getBudget;
  final GetCategoriesUsecase getCategories;

  const HomePage({
    super.key,
    required this.getBudget,
    required this.getCategories,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HomeBloc(getBudget: getBudget, getCategories: getCategories)
            ..add(const LoadHomeData()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2FF),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is! HomeLoaded) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  const _Header(),
                  const SizedBox(height: 20),
                  BudgetCardWidget(budget: state.budget),
                  const SizedBox(height: 20),
                  _TabBar(selectedIndex: state.selectedTab),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xFF3D5AFE),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ...state.categories.map(
                    (c) => CategoryItemWidget(category: c),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.orange.shade200,
          child: const Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 10),
        const Text(
          'Store Name',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3D5AFE),
          ),
        ),
        const Spacer(),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.notifications_none, size: 22),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.more_vert, size: 22),
        ),
      ],
    );
  }
}

class _TabBar extends StatelessWidget {
  final int selectedIndex;
  const _TabBar({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final tabs = ['Categories', 'Recent transaction'];
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: List.generate(tabs.length, (i) {
          final isSelected = i == selectedIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => context.read<HomeBloc>().add(ChangeTab(i)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFE8EBFF)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Text(
                  tabs[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                    fontSize: 13,
                    color: isSelected
                        ? const Color.fromARGB(255, 0, 0, 0)
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
