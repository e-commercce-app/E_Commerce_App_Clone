import 'package:e_commerce/feature/User_Side/Screens/OnBoarding_Screen/Bloc/page_view_event.dart';
import 'package:e_commerce/feature/User_Side/Screens/OnBoarding_Screen/Bloc/page_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewBloc extends Bloc<PageViewEvent, PageViewState> {
  PageViewBloc() : super(InitialPageViewState(selectedIndex: 0)) {
    on<PageViewEvent>((event, emit) {
      // if (event is IndexedPageViewEvent) {
      InitialPageViewState(selectedIndex: state.selectedIndex);
      // }
    });
  }
}
