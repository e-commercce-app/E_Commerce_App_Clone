import 'package:e_commerce/Components/Localization/app_strings.dart';
import 'package:e_commerce/Controller/Routes/routes_method.dart';
import 'package:e_commerce/View/Screens/OnBoarding_Screen/Bloc/page_view_bloc.dart';
import 'package:e_commerce/View/Screens/OnBoarding_Screen/Bloc/page_view_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../Export/e_commerce_export.dart';
import 'Bloc/page_view_state.dart';
import 'Components/heading_text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // page Controller .
  PageController pageController = PageController();

  //Pixel of the Screen .
  late Size size;
  bool changeText = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Resources.colors.transparentColor));
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(body: BlocBuilder<PageViewBloc, PageViewState>(
      builder: (context, state) {
        return SafeArea(
          top: false,
          // ! Page View .
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  allowImplicitScrolling: false,
                  controller: pageController,
                  onPageChanged: (index) {
                    state.selectedIndex = index;
                    BlocProvider.of<PageViewBloc>(context).add(PageViewEvent());
                  },
                  scrollDirection: Axis.horizontal,
                  // Todo => Define 3 pages .
                  children: pages,
                ),
              ),

              // ! Handle this
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColoredBox(
                      color: Colors.transparent,
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        onDotClicked: (index) {
                          state.selectedIndex = index;
                          // BlocProvider.of<PageViewBloc>(context)
                          //     .add(PageViewEvent());
                        },
                        axisDirection: Axis.horizontal,
                        effect: ExpandingDotsEffect(
                          dotColor: Resources.colors.grey,
                          activeDotColor: Resources.colors.buttonColor,
                        ),
                      ),
                    ),
                    //  ! Custom Button Section .
                    CustomButton(
                      size: size,
                      buttonText: state.selectedIndex == 2
                          ? "Get Started"
                          : "Next Page",
                      onPressed: () {
                        state.selectedIndex += 1;
                        pageController.animateToPage(state.selectedIndex,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                        if (state.selectedIndex == pages.length - 0) {
                          Navigator.pushNamed(context, RoutesName.splashScreen)
                              .then((value) {
                            state.selectedIndex = 2;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              // Some Space .
              const CustomSizedBox(
                heightRatio: 0.03,
              )
            ],
          ),
        );
      },
    ));
  }

  // Define Pages
  List<Widget> get pages {
    return [
      // 1 Page .
      Container(
          height: size.height,
          width: size.width,
          color: Resources.colors.allAppColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Big Text OnBoarding Screen
              textAndNikeBoots(size, Resources.imagePath.sneaker5),
              // ! Sneaker App Description in OnBoarding Screens .
              HeadingsOnboardingScreen(
                size: size,
                boldText1: "$msgStartJourneyWith\t",
                boldText2: "$msgWithNike\t",
                smallText1: "$msgSmartGorgeous\t",
                smallText2: "$msgCollection\t",
              ),
            ],
          )),
      // 2 Page .
      Container(
          height: size.height,
          width: size.width,
          color: Resources.colors.allAppColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Big Text OnBoarding Screen
              textAndNikeBoots(size, Resources.imagePath.sneaker6),
              // ! Sneaker App Description in OnBoarding Screens .
              HeadingsOnboardingScreen(
                size: size,
                boldText1: "$msgFollowLatest\t",
                boldText2: "$msgStyle\t",
                smallText1: "$msgThereAreManyBeautiful\t",
                smallText2: "$msgAttractivePlants\t",
              ),
            ],
          )),
      // 3 Page .
      Container(
          height: size.height,
          width: size.width,
          color: Resources.colors.allAppColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Big Text OnBoarding Screen
              textAndNikeBoots(size, Resources.imagePath.sneaker7),
              // ! Sneaker App Description in OnBoarding Screens .
              HeadingsOnboardingScreen(
                size: size,
                boldText1: "$msgSummerShoes\t",
                boldText2: "$msgNike2024\t",
                smallText1: "$msgAmetMinimLit\t",
                smallText2: "$msgNodeseru\t",
              ),
            ],
          )),
    ];
  }

  // ! Every initial OnBoarding screens
  Widget textAndNikeBoots(Size size, String imageNike) {
    return SizedBox(
      height: size.height * 0.5,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left: size.width * 0.4,
            bottom: size.width * 0.4,
            child: Container(
              width: size.width * 1,
              height: size.height * 0.5,
              decoration: const ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(
                      width: 90, color: Color.fromARGB(255, 226, 242, 251)),
                ),
              ),
            ),
          ),
          // ! Sneaker Nike Text .
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
            child: SizedBox(
              height: size.height * 0.25,
              width: double.infinity,
              child: Center(
                  child: Text("NIKE",
                      style: Resources.textStyle.nikeTextStyleText(size))),
            ),
          ),
          // ! Sneaker Image
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.07, horizontal: size.width * 0.09),
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(-0.15),
              child: Image(
                image: AssetImage(imageNike),
                height: size.height * 0.32,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
