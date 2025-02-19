abstract class PageViewState {
  PageViewState({required this.selectedIndex});
  int selectedIndex;
}

class InitialPageViewState extends PageViewState {
  InitialPageViewState({required super.selectedIndex});
}
