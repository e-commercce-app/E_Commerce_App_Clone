// ignore_for_file: library_private_types_in_public_api

import '../../../../Export/e_commerce_export.dart';
import 'Cart/cart_screen_main.dart';
import 'Favorite_Items/favorite_main_page.dart';
import 'Home/home_screen.dart';
import 'Profile_Page/profile_main_screen.dart';
import 'bloc/bottom_navigation_bloc.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Widget>? _pages;
  // int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      const HomeScreen(),
      const FavoriteScreen(),
      const Search(),
      const CartBottomBarScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  List<BottomNavigationBarItem> itemsList = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      label: 'Favorite',
    ),
    BottomNavigationBarItem(
      activeIcon: null,
      icon: Icon(null),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_bag,
      ),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          // BottomNavigationBar
          bottomNavigationBar: BottomNavigationBar(
              onTap: (int index) {
                BlocProvider.of<BottomNavigationBloc>(context, listen: false)
                    .add(
                  BottomNavigationEvent(currentIndex: index),
                );
              },
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedLabelStyle: GoogleFonts.adamina(color: Colors.blue),
              unselectedItemColor: Resources.colors.kGrey,
              selectedItemColor: Resources.colors.kButtonColor,
              currentIndex: (state as BottomNavigationInitial).index,
              items: itemsList),
          // floatingActionButton notch .
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
                backgroundColor: Resources.colors.kButtonColor,
                hoverElevation: 10,
                splashColor: Resources.colors.kWhite.withOpacity(0.3),
                elevation: 8,
                child: const Icon(Icons.shopify_rounded, size: 35),
                onPressed: () => state.index = 2),
          ),
          // Generate Widgets List .
          body: _pages![(state).index],
        );
      },
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(search)),
    );
  }
}
