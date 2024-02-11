// ignore_for_file: library_private_types_in_public_api

import 'package:e_commerce/View/Screens/Navigation_Bar_Screens/bloc/bottom_navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Export/e_commerce_export.dart';
import '../Home/home_screen.dart';

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
      const Feeds(),
      const Search(),
      const Cart(),
      const UserInfo(),
    ];
    super.initState();
  }

  // void _selectPage(int index) {
  //   setState(() {
  //     _selectedPageIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        (state as BottomNavigationInitial);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: _pages![state.index],
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            padding: const EdgeInsets.all(5),
            shape: const CircularNotchedRectangle(),
            notchMargin: 0.01,
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              height: kBottomNavigationBarHeight * 0.15,
              child: BottomNavigationBar(
                onTap: (int index) {
                  BlocProvider.of<BottomNavigationBloc>(context)
                      .add(BottomNavigationEvent(currentIndex: index));
                },
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedLabelStyle: GoogleFonts.adamina(color: Colors.blue),
                unselectedItemColor: Colors.grey,
                selectedItemColor: Resources.colors.buttonColor,
                currentIndex: state.index,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.rss_feed),
                    label: 'Feeds',
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
                    label: 'User',
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
                backgroundColor: Resources.colors.buttonColor,
                hoverElevation: 10,
                splashColor: Colors.white.withOpacity(0.3),
                elevation: 8,
                child: const Icon(Icons.shopify_rounded, size: 35),
                onPressed: () => state.index = 2),
          ),
        );
      },
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Cart')),
    );
  }
}

class Feeds extends StatelessWidget {
  const Feeds({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Feeds')),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Home')),
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Search')),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('User info')),
    );
  }
}
