// ignore_for_file: flutter_style_todos

import 'dart:developer';

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/category_model.dart';
import 'package:e_commerce/core/Components/Helper/location_service.dart';
import 'package:e_commerce/feature/User_Side/Screens/Home_Page_Tabs/Bata_Shoes/bata_shoes_main.dart';
import 'package:e_commerce/feature/User_Side/Screens/Home_Page_Tabs/Nike_Shoes/nike_shoes_main.dart';
import 'package:e_commerce/feature/User_Side/Screens/Home_Page_Tabs/Puma_Shoes/puma_shoes_main.dart';
import 'package:e_commerce/feature/User_Side/Screens/Home_Page_Tabs/Reebok_Shoes/reebok_shoes_main.dart';
import 'package:e_commerce/feature/User_Side/Screens/Home_Page_Tabs/Sale_Product/sale_product.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Home/Components/custom_drawer_home_page.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Home/Components/home_page_app_bar.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Home/bloc/matrix4_rotation_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late Size size;
  TabController? tabController; // * TabController for TabBar and TabBarView
  List<CategoriesModel> categories = []; // * List to store fetched categories
  bool isLoading = true; // * Loading state for category fetch

  String currentLocation = '';
  String newArrivalsText = 'Puma Shoes';
  String seeAllText = seeAll;

  @override
  void initState() {
    super.initState();
    _fetchCategories(); // ! Fetch categories from Firestore on startup
  }

  /// * Fetch categories from Firestore and initialize TabController
  Future<void> _fetchCategories() async {
    final snapshot = await FirebaseServices.categoryCollection
        // .where('categoryId', isEqualTo: true)
        .get();
    categories = snapshot.docs
        .map((doc) => CategoriesModel.fromMap(doc.data()))
        .toList();
    tabController = TabController(length: categories.length, vsync: this);
    tabController!.addListener(_onTabChanged); // * Listen for tab changes
    setState(() {
      isLoading = false; // * Hide loader after fetching
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchCurrentLocation(); // ! Get user location on startup
  }

  @override
  void dispose() {
    tabController?.removeListener(_onTabChanged); // * Remove listener
    tabController?.dispose(); // * Dispose controller
    super.dispose();
  }

  //! Fetch the current location using LocationService
  Future<void> fetchCurrentLocation() async {
    await LocationService.determinePosition().then((_) async {
      await LocationService().fetchLatLong().then(
            (onValue) => CustomDialog.showCustomSnackBar(
              context: context,
              title: 'Location',
              message: 'Find This Current Locations',
              contentType: ContentType.success,
            ),
          );
    });

    setState(() {
      currentLocation = LocationData().currentLocation ?? '';
    });
  }

  /// ! Get and update user location

  // Future<void> _initializeLocation() async {
  //   try {
  //     final position = await _determinePosition();
  //     await _updateCurrentLocation(position);
  //     CustomDialog.showCustomSnackBar(
  //       context: context,
  //       title: 'Location',
  //       message: 'Find This Current Locations',
  //       contentType: ContentType.success,
  //     );
  //   } on Exception catch (error) {
  //     debugPrint('Error initializing location: $error');
  //   }
  // }

  /// * Determine device position using Geolocator
  // Future<Position> _determinePosition() async {
  //   if (!await Geolocator.isLocationServiceEnabled()) {
  //     throw Exception(locationAreDisabled); // ? Location service disabled
  //   }

  //   var permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       throw Exception(locationPermissionDenied); // ? Permission denied
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     throw Exception(
  //         locationPermissionPermanentlyDenied); // ? Permission denied forever
  //   }

  //   return Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  // }

  /// * Update currentLocation string using placemark data
  // Future<void> _updateCurrentLocation(Position position) async {
  //   try {
  //     final placemarks = await placemarkFromCoordinates(
  //       position.latitude,
  //       position.longitude,
  //     );
  //     setState(() {
  //       currentLocation =
  //           '${placemarks[0].street!} ${placemarks[0].country!} ${placemarks[0].name} ${placemarks[0].locality}';
  //     });
  //   } on Exception catch (error) {
  //     debugPrint('Error fetching address: $error');
  //   }
  // }

  /// * Update UI text based on selected tab
  void _onTabChanged() {
    setState(() {
      final category = categories[tabController!.index];
      final cat = category.categoryName.toLowerCase();
      if (cat == 'sale') {
        newArrivalsText = 'Discount Shoes';
        seeAllText = seeAll;
      } else if (cat == 'nike') {
        newArrivalsText = 'Nike Shoes';
        seeAllText = 'Explore Nike';
      } else if (cat == 'puma') {
        newArrivalsText = 'Puma Shoes';
        seeAllText = 'Explore Puma';
      } else if (cat == 'adidas') {
        newArrivalsText = 'Bata Shoes';
        seeAllText = 'Explore Bata';
      } else if (cat == 'reebok') {
        newArrivalsText = 'Reebok Shoes';
        seeAllText = 'Explore Reebok';
      } else {
        newArrivalsText = category.categoryName;
        seeAllText = 'Explore $category.categoryName';
      }
    });
  }

// switch (category.categoryName.toLowerCase()) {
//         case 0:
//           newArrivalsText = 'Discount Shoes';
//           seeAllText = seeAll;
//         case 1:
//           newArrivalsText = 'Nike Shoes';
//           seeAllText = 'Explore Nike';
//         case 2:
//           newArrivalsText = 'Puma Shoes';
//           seeAllText = 'Explore Puma';
//         case 3:
//           newArrivalsText = 'Bata Shoes';
//           seeAllText = 'Explore Bata';
//         case 4:
//           newArrivalsText = 'Reebok Shoes';
//           seeAllText = 'Explore Reebok';
//         default:
//       }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context); // * Get screen size
    return BlocProvider(
      create: (context) => Matrix4RotationBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const CustomDrawer(), // * Custom navigation drawer
            BlocBuilder<Matrix4RotationBloc, Matrix4RotationState>(
              builder: (context, state) {
                return _buildHomeScreenContent(
                  context,
                  state as RotationMatrixState,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// * Main content with animated container and all widgets
  Widget _buildHomeScreenContent(
    BuildContext context,
    RotationMatrixState state,
  ) {
    if (isLoading) {
      // ! Show loader while fetching categories
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Resources.colors.kWhite,
        ),
      );
    }
    if (categories.isEmpty) {
      // ! Show message if no categories found
      return const Center(child: Text('No categories found.'));
    }
    return AnimatedContainer(
      color: Resources.colors.kAllAppColor,
      transform: Matrix4.translationValues(
        state.xOffset,
        state.yOffset,
        0,
      )
        ..scale(state.isDrawerOpen ? 0.85 : 1.0)
        ..rotateZ(state.isDrawerOpen ? -50 : 0.0),
      duration: const Duration(seconds: 1),
      curve: Curves.fastEaseInToSlowEaseOut,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          _buildAppBar(context, state), // * Custom AppBar
          const CustomSizedBox(heightRatio: 0.02),
          _buildSearchBar(), // * Search bar widget
          const CustomSizedBox(heightRatio: 0.02),
          _buildTabBar(), // * TabBar with category images
          _buildNewArrivalsSection(), // * Section header
          _buildTabBarView(), // * TabBarView for tab content
        ],
      ),
    );
  }

  /// * Custom AppBar for HomeScreen
  Widget _buildAppBar(BuildContext context, RotationMatrixState state) {
    return homePageAppBar(
      context,
      child: state.isDrawerOpen
          ? Icon(CupertinoIcons.arrow_left, color: Resources.colors.kBlack)
          : CustomImageView(imagePath: Resources.imagePath.homeDrawer),
      onTap: () {
        if (kDebugMode) log('message');
        BlocProvider.of<Matrix4RotationBloc>(context, listen: false)
            .add(RotationHomePageEvents());
      },
      size: size,
      currentLocation: currentLocation,
    );
  }

  /// * Search bar widget
  Widget _buildSearchBar() {
    return CustomSearchClickView(
      size: size,
      onTap: () {
        NavigatorService.pushNamed(RoutesName.searchHomeView);
      },
    );
  }

  /// * TabBar with category images
  Widget _buildTabBar() {
    return Material(
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      child: Container(
        height: 60,
        color: Colors.transparent,
        child: TabBar(
          controller: tabController,
          physics: const ClampingScrollPhysics(),
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Resources.colors.kButtonColor,
          ),
          tabs: categories
              .map((cat) => _buildTabBarItem(cat.categoryImg))
              .toList(),
        ),
      ),
    );
  }

  /// * Single tab item with category image
  Widget _buildTabBarItem(String tabBarImage) {
    return Container(
      height: 35,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Resources.colors.kButtonColor, width: 0),
      ),
      child: Align(
        child: CustomImageView(
          fit: BoxFit.cover,
          imagePath: tabBarImage,
        ),
      ),
    );
  }

  /// * Section header for new arrivals and see all
  Widget _buildNewArrivalsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          newArrivalsText,
          presetFontSizes: const [16.0, 12.0, 8.0, 5.0],
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Resources.colors.kBlack,
              ),
        ),
        AutoSizeText(
          seeAllText,
          presetFontSizes: const [14.0, 10.0, 7.0, 4.0],
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Resources.colors.kButtonColor, fontSize: 14),
        ),
      ],
    );
  }

  /// * TabBarView for displaying tab content
  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: categories.map((cat) {
          // * Open the correct page based on categoryName or categoryId
          switch (cat.categoryName.toLowerCase()) {
            case 'sale':
              return SaleShoesProductScreen(categoryId: cat.categoryId);
            case 'nike':
              return NikeShoesScreen(categoryId: cat.categoryId);
            case 'puma':
              return PumaShoesScreen(categoryId: cat.categoryId);
            case 'adidas':
              return BataShoesScreen(categoryId: cat.categoryId);
            case 'reebok':
              return ReebokShoesScreen(categoryId: cat.categoryId);
            default:
              // * Fallback: show category name if no match
              return Center(child: Text(cat.categoryName));
          }
        }).toList(),
      ),
    );
  }
}
