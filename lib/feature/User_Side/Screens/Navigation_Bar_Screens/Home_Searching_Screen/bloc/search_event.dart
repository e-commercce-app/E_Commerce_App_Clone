part of 'search_bloc.dart';

sealed class SearchEvent {
  const SearchEvent();

}

class SearchClickEvent extends SearchEvent{}
