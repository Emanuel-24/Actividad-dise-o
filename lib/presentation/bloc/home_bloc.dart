import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_budget_usecase.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBudgetUsecase getBudget;
  final GetCategoriesUsecase getCategories;

  HomeBloc({required this.getBudget, required this.getCategories})
      : super(HomeInitial()) {
    on<LoadHomeData>(_onLoad);
    on<ChangeTab>(_onChangeTab);
  }

  void _onLoad(LoadHomeData event, Emitter<HomeState> emit) {
    emit(HomeLoaded(
      budget:     getBudget(),
      categories: getCategories(),
    ));
  }

  void _onChangeTab(ChangeTab event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      emit((state as HomeLoaded).copyWith(selectedTab: event.index));
    }
  }
}
