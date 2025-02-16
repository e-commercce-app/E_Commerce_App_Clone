abstract class PageViewState {
  int selectedIndex;

  PageViewState({required this.selectedIndex});
}

class InitialPageViewState extends PageViewState {
  InitialPageViewState({required super.selectedIndex});
}
