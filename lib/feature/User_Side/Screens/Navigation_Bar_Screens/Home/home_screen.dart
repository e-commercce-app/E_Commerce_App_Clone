import 'dart:developer' as developer;

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/feature/User_Side/Screens/Home_Page_Tabs/Bata_Shoes/bata_shoes_main.dart';
import 'package:e_commerce/feature/User_Side/Screens/Home_Page_Tabs/Nike_Shoes/nike_shoes_main.dart';
import 'package:e_commerce/feature/User_Side/Screens/Home_Page_Tabs/Puma_Shoes/puma_shoes_main.dart';
import 'package:e_commerce/feature/User_Side/Screens/Home_Page_Tabs/Reebok_Shoes/reebok_shoes_main.dart';
import 'package:e_commerce/feature/User_Side/Screens/Home_Page_Tabs/Sale_Product/sale_product.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Home/Components/custom_drawer_home_page.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Home/Components/home_page_app_bar.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Home/bloc/matrix4_rotation_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late Size size;
  late TabController tabController;

  String currentLocation = '';
  String newArrivalsText = 'Discount Shoes';
  String seeAllText = seeAll;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this, initialIndex: 0);
    tabController.addListener(_onTabChanged);
    _initializeLocation();
  }

  @override
  void dispose() {
    tabController
      ..removeListener(_onTabChanged)
      ..dispose();
    super.dispose();
  }

  Future<void> _initializeLocation() async {
    try {
      final position = await _determinePosition();
      await _updateCurrentLocation(position);
      CustomDialog.showCustomSnackBar(
        context: context,
        title: 'Location',
        message: 'Find This Current Locations',
        contentType: ContentType.success,
      );
    } on Exception catch (error) {
      debugPrint('Error initializing location: $error');
    }
  }

  Future<Position> _determinePosition() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw Exception(locationAreDisabled);
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception(locationPermissionDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(locationPermissionPermanentlyDenied);
    }

    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _updateCurrentLocation(Position position) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      setState(() {
        currentLocation =
            '${placemarks[0].street!} ${placemarks[0].country!} ${placemarks[0].name} ${placemarks[0].locality}';
      });
    } catch (error) {
      debugPrint('Error fetching address: $error');
    }
  }

  void _onTabChanged() {
    setState(() {
      switch (tabController.index) {
        case 0:
          newArrivalsText = 'Discount Shoes';
          seeAllText = seeAll;
        case 1:
          newArrivalsText = 'Nike Shoes';
          seeAllText = 'Explore Nike';
        case 2:
          newArrivalsText = 'Puma Shoes';
          seeAllText = 'Explore Puma';
        case 3:
          newArrivalsText = 'Bata Shoes';
          seeAllText = 'Explore Bata';
        case 4:
          newArrivalsText = 'Reebok Shoes';
          seeAllText = 'Explore Reebok';
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => Matrix4RotationBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const CustomDrawer(),
            BlocBuilder<Matrix4RotationBloc, Matrix4RotationState>(
              builder: (context, state) {
                return _buildHomeScreenContent(
                    context, state as RotationMatrixState);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeScreenContent(
    BuildContext context,
    RotationMatrixState state,
  ) {
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
          _buildAppBar(context, state),
          const CustomSizedBox(heightRatio: 0.02),
          _buildSearchBar(),
          const CustomSizedBox(heightRatio: 0.02),
          _buildTabBar(),
          _buildNewArrivalsSection(),
          _buildTabBarView(),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, RotationMatrixState state) {
    return homePageAppBar(
      context,
      child: state.isDrawerOpen
          ? Icon(CupertinoIcons.arrow_left, color: Resources.colors.kBlack)
          : CustomImageView(imagePath: Resources.imagePath.homeDrawer),
      onTap: () {
        developer.log('message');
        BlocProvider.of<Matrix4RotationBloc>(context, listen: false)
            .add(RotationHomePageEvents());
      },
      size: size,
      currentLocation: currentLocation,
    );
  }

  Widget _buildSearchBar() {
    return CustomSearchClickView(
      size: size,
      onTap: () {
        NavigatorService.pushNamed(RoutesName.searchHomeView);
      },
    );
  }

  Widget _buildTabBar() {
    return DefaultTabController(
      length: 5,
      child: Material(
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
            tabs: [
              _buildTabBarItem(Resources.imagePath.pumaShoes),
              _buildTabBarItem(Resources.imagePath.nikeShoes),
              _buildTabBarItem(Resources.imagePath.pumaShoes),
              _buildTabBarItem(Resources.imagePath.adidasShoes),
              _buildTabBarItem(Resources.imagePath.rebookShoes),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBarItem(String tabBarImage) {
    return Container(
      height: 35,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Resources.colors.kButtonColor, width: 1),
      ),
      child: Align(
        child: CustomImageView(
          fit: BoxFit.cover,
          imagePath: tabBarImage,
        ),
      ),
    );
  }

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

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: const [
          SaleShoesProductScreen(),
          NikeShoesScreen(),
          PumaShoesScreen(),
          BataShoesScreen(),
          ReebokShoesScreen(),
        ],
      ),
    );
  }
}
