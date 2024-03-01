import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/View/Screens/Home_Page_Tabs/Bata_Shoes/bata_shoes_main.dart';
import 'package:e_commerce/View/Screens/Home_Page_Tabs/Nike_Shoes/nike_shoes_main.dart';
import 'package:e_commerce/View/Screens/Home_Page_Tabs/Puma_Shoes/puma_shoes_main.dart';
import 'package:e_commerce/View/Screens/Home_Page_Tabs/Reebok_Shoes/reebok_shoes_main.dart';
import 'package:e_commerce/View/Screens/Navigation_Bar_Screens/Home/Components/custom_drawer_home_page.dart';
import 'package:e_commerce/View/Screens/Navigation_Bar_Screens/Home/bloc/matrix4_rotation_bloc.dart';

import '../../../../Components/Widgets/custom_image_view.dart';
import '../../../../Components/Widgets/custom_search_bar_text_field.dart';
import '../../../../Export/e_commerce_export.dart';
import '../Home/Components/home_page_app_bar.dart';
import '../Home/bloc/search_bloc.dart';
import '../Home/bloc/search_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // All Screen Size .
  late Size size;
  late TabController tabController;

  // double xOffset = 0.0;
  // double yOffset = 0.0;
  // bool isDrawerOpen = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => Matrix4RotationBloc(),
          lazy: false,
        ),
      ],
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              // ! Custom Drawer AppBar Section
              const CustomDrawer(),
              // ! Home Screen Section
              BlocBuilder<Matrix4RotationBloc, Matrix4RotationState>(
                builder: (context, state) {
                  (state as RotationMatrixState);
                  return AnimatedContainer(
                    color: Resources.colors.kAllAppColor,
                    transform: Matrix4.translationValues(
                        state.xOffset, state.yOffset, 0.0)
                      ..scale(state.isDrawerOpen ? 0.85 : 1.0)
                      ..rotateZ(state.isDrawerOpen ? -50 : 0.0),
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: Column(
                      children: [
                        homePageAppBar(context,
                            child: state.isDrawerOpen
                                ? Icon(
                                    CupertinoIcons.arrow_left,
                                    color: Resources.colors.kBlack,
                                  )
                                : CustomImageView(
                                    imagePath: Resources.imagePath.homeDrawer),
                            onTap: () {
                          developer.log("message");
                          BlocProvider.of<Matrix4RotationBloc>(context,
                                  listen: false)
                              .add(RotationHomePageEvents());
                        }, size: size),
                        // some Space .
                        const CustomSizedBox(heightRatio: 0.02),
                        // ! Search TextField Section .
                        BlocBuilder<SearchBloc, SearchState>(
                          builder: (context, state) {
                            (state as SearchInitialState);
                            return CustomSearchView(
                              controller: state.searchController,
                              hintText: "Looking for shoes",
                              suffix: Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                ),
                                child: IconButton(
                                  onPressed: () =>
                                      state.searchController.clear(),
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const CustomSizedBox(heightRatio: 0.02),
                        // ! TabBar Sections .
                        DefaultTabController(
                            length: 4,
                            child: Column(
                              children: [
                                Material(
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        unselectedLabelColor: Colors.black,
                                        indicatorSize:
                                            TabBarIndicatorSize.label,
                                        dividerColor: Colors.transparent,
                                        indicator: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color:
                                                Resources.colors.kButtonColor),
                                        // ! Tabs
                                        tabs: [
                                          Tab(
                                            child: _customTabBarItem(
                                                tabBarImage: Resources
                                                    .imagePath.nikeShoes),
                                          ),
                                          Tab(
                                              child: _customTabBarItem(
                                                  tabBarImage: Resources
                                                      .imagePath.pumaShoes)),
                                          Tab(
                                              child: _customTabBarItem(
                                                  tabBarImage: Resources
                                                      .imagePath.adidasShoes)),
                                          Tab(
                                            child: _customTabBarItem(
                                                tabBarImage: Resources
                                                    .imagePath.rebookShoes),
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            )),
                        //  ! _Build New Arrivals .
                        _buildNewArrivals(context,
                            newArrivalsText: "Popular Shoes",
                            seeAllText: "See All"),
                        Expanded(
                            child: TabBarView(
                                controller: tabController,
                                // ! TabBar Screen List .
                                children: const [
                              NikeShoesScreen(),
                              PumaShoesScreen(),
                              BataShoesScreen(),
                              ReebokShoesScreen(),
                            ])),
                      ],
                    ),
                  );
                },
              ),
            ],
          )
          //   },
          // )
          ),
    );
  }

  // ** TabBar itemView Image function !
  Widget _customTabBarItem({required String tabBarImage}) {
    return Container(
      height: 35,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Resources.colors.kButtonColor, width: 1)),
      child: Align(
          alignment: Alignment.center,
          child: CustomImageView(
            fit: BoxFit.cover,
            imagePath: tabBarImage,
          )),
    );
  }

  /// ** Common Popular see all widget
  Widget _buildNewArrivals(
    BuildContext context, {
    required String newArrivalsText,
    required String seeAllText,
  }) {
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
}
