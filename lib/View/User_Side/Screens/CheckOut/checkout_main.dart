import 'dart:async';
import 'dart:developer';

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/order_model_class.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../Components/Widgets/custom_form_field.dart';
import '../Google_Payement/custom_google_payement.dart';
import 'Components/checkout_app_bar.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  // TextEditingController Objects .
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  // Form Global Key .
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Google Map Completer Objects Controll GoogleMapController
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  //  store this current Location .
  String currentLocation = "";

  // ! Using Internet Fetch This Current Location .
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(locationAreDisabled);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(locationPermissionDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(locationPermissionPermanentlyDenied);
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getLatLong() {
    Future<Position> data = _determinePosition();
    data.then((value) {
      debugPrint("value $value");
      setState(() {
        value.latitude;
        value.longitude;
      });

      getAddress(value.latitude, value.longitude);
    }).catchError((error) {
      debugPrint("Error $error");
    });
  }

  /// ! For convert latitude longitude to address
  /// !Using (GeoCoding) Package .
  getAddress(
    lat,
    long,
  ) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    setState(() {
      currentLocation =
          "${placemarks[0].street!} ${placemarks[0].country!} ${placemarks[0].name} ${placemarks[0].locality}";
    });

    for (int i = 0; i < placemarks.length; i++) {
      debugPrint("INDEX $i ${placemarks[i]}");
    }
  }

  // ** Camera Position show this google map Directions .
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(29.802813, 71.739063),
    zoom: 13.4746,
  );

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _determinePosition().then((value) {
      currentLocation.toString();
      getLatLong();
      CustomDialog.toastMessage(message: findThisLocation);
    });
  }

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: checkOutAppBar(size: size),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  // ! User Current Location sections
                  const CustomSizedBox(heightRatio: 0.005),
                  Container(
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GoogleMap(
                        initialCameraPosition: _kGooglePlex,
                        compassEnabled: true,
                        myLocationEnabled: true,
                        mapType: MapType.normal,
                        trafficEnabled: true,
                        mapToolbarEnabled: false,
                        scrollGesturesEnabled: true,
                        rotateGesturesEnabled: true,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                          currentLocation.toString();
                        },
                      ),
                    ),
                  ),
                  // ! Location Text .
                  Text.rich(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      TextSpan(children: [
                        TextSpan(
                            text: "Find Location :\t\t",
                            style: Resources.textStyle
                                .userNameTextStyle(size: size)
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Resources.colors.kButtonColor),
                            children: [
                              TextSpan(
                                text: currentLocation.toString(),
                                style: Resources.textStyle
                                    .userNameTextStyle(size: size)
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Resources.colors.kBlack,
                                        decorationStyle:
                                            TextDecorationStyle.double),
                              )
                            ])
                      ])),

                  const CustomSizedBox(heightRatio: 0.008),
                  // ! Name sections
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      yourName,
                      style: Resources.textStyle
                          .userNameTextStyle(size: size)
                          .copyWith(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const CustomSizedBox(heightRatio: 0.008),
                  //  User Name Input Field
                  CustomTextFormField(
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    hintText: eCommerce,
                    borderRadius: BorderRadius.circular(15),
                    contentPadding: const EdgeInsets.all(12),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter A Name";
                      } else if (value.length <= 4) {
                        return "Username should be less than 4 characters.";
                      }
                      return null;
                    },
                  ),

                  // some space
                  const CustomSizedBox(heightRatio: 0.03),
                  // ! Email sections
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      signInEmailAddress,
                      style: Resources.textStyle
                          .userNameTextStyle(size: size)
                          .copyWith(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const CustomSizedBox(heightRatio: 0.008),
                  // Email Address Input Field
                  CustomTextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    hintText: signInEnterEmail,
                    borderRadius: BorderRadius.circular(15),
                    contentPadding: const EdgeInsets.all(12),
                    validator: (value) {
                      if (value == null ||
                          !isValidEmail(value, isRequired: true)) {
                        return "Please Enter Valid Email";
                      }
                      return null;
                    },
                  ),

                  // some space
                  const CustomSizedBox(heightRatio: 0.03),
                  // ! User Number sections
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      number,
                      style: Resources.textStyle
                          .userNameTextStyle(size: size)
                          .copyWith(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const CustomSizedBox(heightRatio: 0.008),
                  //  User Name Input Field
                  CustomTextFormField(
                    controller: phoneController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    hintText: "03034...",
                    borderRadius: BorderRadius.circular(15),
                    contentPadding: const EdgeInsets.all(12),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter A Number";
                      } else if (value.length <= 11) {
                        return "Minimum 11 Character .";
                      }
                      return null;
                    },
                  ),
                  // some space
                  const CustomSizedBox(heightRatio: 0.03),
                  CustomButton(
                      size: size,
                      onPressed: () => NavigatorService.push(MaterialPageRoute(
                            builder: (context) => const CustomPaymentWidget(),
                          )),
                      background: Resources.colors.kBlack,
                      buttonText: googlePayment),
                  // some space
                  const CustomSizedBox(heightRatio: 0.03),
                  CustomButton(
                      size: size,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          var dateAndTime =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          OrderModelClass order = OrderModelClass();

                          order.orderUid = FirebaseServices.currentUser?.uid;
                          order.orderLocation = currentLocation.toString();
                          order.orderName = nameController.text.toString();
                          order.orderEmail = emailController.text.toString();
                          order.orderPhone = phoneController.text.toString();

                          await FirebaseServices.currentUserCollection
                              .doc(FirebaseServices.currentUser?.uid)
                              .collection("MyOrder")
                              .doc(
                                  "$dateAndTime${FirebaseServices.currentUser?.uid}")
                              .set(order.toJson())
                              .then((value) {
                            CustomDialog.toastMessage(message: "Add To Cart");
                            NavigatorService.pushReplacementsNamed(
                                RoutesName.bottomBarScreen);
                          }).onError((error, stackTrace) {
                            log("Add To Cart Error : ${error.toString()}");
                            CustomDialog.toastMessage(
                                message: error.toString());
                          });
                        }
                      },
                      buttonText: payment)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }
}
