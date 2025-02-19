import 'package:e_commerce/Export/e_commerce_export.dart';

sealed class SearchState {
  const SearchState();
}

class InitialState extends SearchState {}

final class SearchInitialState extends SearchState {
  SearchInitialState({required this.searchController});
  TextEditingController searchController;
}
