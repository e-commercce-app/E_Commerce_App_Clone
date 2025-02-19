// ignore_for_file: invalid_use_of_visible_for_testing_member, depend_on_referenced_packages

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Home_Searching_Screen/bloc/search_state.dart';
part 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState()) {
    loadingState;
    on<SearchEvent>((event, emit) {});
  }
  TextEditingController searchController = TextEditingController();
  get loadingState =>
      emit(SearchInitialState(searchController: searchController));

  //Using Function Call bloc close means dispose function call .
  // Clean up the controller when this widget is disposed of.
  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
