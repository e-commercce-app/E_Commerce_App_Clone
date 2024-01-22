import 'package:flutter_bloc/flutter_bloc.dart';
import 'page_view_event.dart';
import 'page_view_state.dart';

class PageViewBloc extends Bloc<PageViewEvent, PageViewState> {
  PageViewBloc() : super(InitialPageViewState(selectedIndex: 0)) {
    on<PageViewEvent>((event, emit) {
      // if (event is IndexedPageViewEvent) {
      InitialPageViewState(selectedIndex: state.selectedIndex);
      // }
    });
  }
}
