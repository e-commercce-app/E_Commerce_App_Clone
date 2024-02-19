// ignore_for_file: library_private_types_in_public_api

import 'package:e_commerce/View/Screens/Navigation_Bar_Screens/bloc/bottom_navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Export/e_commerce_export.dart';
import 'Home/home_screen.dart';

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
      const Cart(),
      const Profile(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          // BottomNavigationBar
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              BlocProvider.of<BottomNavigationBloc>(context)
                  .add(BottomNavigationEvent(currentIndex: index));
            },
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedLabelStyle: GoogleFonts.adamina(color: Colors.blue),
            unselectedItemColor: Resources.colors.kGrey,
            selectedItemColor: Resources.colors.kButtonColor,
            currentIndex: (state as BottomNavigationInitial).index,
            items: const [
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
            ],
          ),
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

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Cart')),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('User info')),
    );
  }
}




//**
//  @override
  // Widget build(BuildContext context) {
  //   return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
  //     builder: (context, state) {
  //       return Scaffold(
  //         resizeToAvoidBottomInset: true,
  //         body: _pages![(state as BottomNavigationInitial).index],
  //         bottomNavigationBar: BottomAppBar(
  //           color: Colors.transparent,
  //           padding: const EdgeInsets.all(5),
  //           shape: const CircularNotchedRectangle(),
  //           notchMargin: 0.01,
  //           clipBehavior: Clip.antiAlias,
  //           child: SizedBox(
  //             height: kBottomNavigationBarHeight * 0.15,
  //             child: BottomNavigationBar(
  //               onTap: (int index) {
  //                 BlocProvider.of<BottomNavigationBloc>(context)
  //                     .add(BottomNavigationEvent(currentIndex: index));
  //               },
  //               elevation: 0,
  //               backgroundColor: Colors.transparent,
  //               selectedLabelStyle: GoogleFonts.adamina(color: Colors.blue),
  //               unselectedItemColor: Resources.colors.grey,
  //               selectedItemColor: Resources.colors.buttonColor,
  //               currentIndex: state.index,
  //               items: const [
  //                 BottomNavigationBarItem(
  //                   icon: Icon(Icons.home),
  //                   label: 'Home',
  //                 ),
  //                 BottomNavigationBarItem(
  //                   icon: Icon(Icons.favorite_border),
  //                   label: 'Favorite',
  //                 ),
  //                 BottomNavigationBarItem(
  //                   activeIcon: null,
  //                   icon: Icon(null),
  //                   label: 'Search',
  //                 ),
  //                 BottomNavigationBarItem(
  //                   icon: Icon(
  //                     Icons.shopping_bag,
  //                   ),
  //                   label: 'Cart',
  //                 ),
  //                 BottomNavigationBarItem(
  //                   icon: Icon(Icons.person),
  //                   label: 'Profile',
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         floatingActionButtonLocation:
  //             FloatingActionButtonLocation.centerDocked,
  //         floatingActionButton: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: FloatingActionButton(
  //               backgroundColor: Resources.colors.buttonColor,
  //               hoverElevation: 10,
  //               splashColor: Resources.colors.white.withOpacity(0.3),
  //               elevation: 8,
  //               child: const Icon(Icons.shopify_rounded, size: 35),
  //               onPressed: () => state.index = 2),
  //         ),
  //       );
  //     },
  //   );
  // }
// */