// ignore_for_file: invalid_use_of_visible_for_testing_member, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:e_commerce/View/Screens/Home/bloc/search_state.dart';

import '../../../../Export/e_commerce_export.dart';

part 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  TextEditingController searchController = TextEditingController();
  SearchBloc() : super(InitialState()) {
    loadingState;
    on<SearchEvent>((event, emit) {});
  }
  get loadingState =>
      emit(SearchInitialState(searchController: searchController));
}
