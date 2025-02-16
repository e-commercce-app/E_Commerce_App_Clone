import '../../../../../../Export/e_commerce_export.dart';

sealed class SearchState {
  const SearchState();
}

class InitialState extends SearchState {}

final class SearchInitialState extends SearchState {
  TextEditingController searchController;
  SearchInitialState({required this.searchController});
}
