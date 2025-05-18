// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/notification_model.dart';
import 'package:e_commerce/Models/order_model_class.dart';
import 'package:e_commerce/core/Components/Helper/location_service.dart';
import 'package:e_commerce/core/Components/Helper/notification_server.dart';
import 'package:e_commerce/core/Components/Helper/send_notification_service.dart';
import 'package:e_commerce/feature/User_Side/Screens/CheckOut/widgets/checkout_app_bar.dart';
import 'package:e_commerce/feature/User_Side/Screens/CheckOut/widgets/email_section.dart';
import 'package:e_commerce/feature/User_Side/Screens/CheckOut/widgets/location_section.dart';
import 'package:e_commerce/feature/User_Side/Screens/CheckOut/widgets/name_section.dart';
import 'package:e_commerce/feature/User_Side/Screens/CheckOut/widgets/payment_buttons.dart';
import 'package:e_commerce/feature/User_Side/Screens/CheckOut/widgets/phone_section.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  //! TextEditingController Objects .
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  //! Form Global Key .
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //! Google Map Completer Objects Control GoogleMapController
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final dateAndTime = DateTime.now().microsecondsSinceEpoch.toString();
  final notificationService = NotificationServer();
  //!  store this current Location .
  String currentLocation = '';

  @override
  void initState() {
    super.initState();
    initializeControllers();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchCurrentLocation();
  }

  //! Initialize TextEditingController objects
  void initializeControllers() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  //! Fetch the current location using LocationService
  Future<void> fetchCurrentLocation() async {
    await LocationService().fetchLatLong();
    setState(() {
      currentLocation = LocationData().currentLocation ?? '';
    });
  }

  //! Handle order submission
  Future<void> handleOrderSubmission() async {
    if (formKey.currentState!.validate()) {
      final order = createOrderModel();
      await saveOrderToFirebase(order);
    }
  }

  //! Create an OrderModelClass object
  OrderModelClass createOrderModel() {
    return OrderModelClass()
      ..orderUid = FirebaseServices.currentUser?.uid
      ..orderLocation = currentLocation
      ..orderName = nameController.text
      ..orderEmail = emailController.text
      ..orderPhone = phoneController.text
      ..createdAt = DateTime.now().toString()
      ..orderStatus = 'Pending';
  }

  //! Save order to Firebase
  Future<void> saveOrderToFirebase(OrderModelClass order) async {
    try {
      await FirebaseServices.currentUserCollection
          .doc(FirebaseServices.currentUser?.uid)
          .collection('MyOrder')
          .doc('$dateAndTime${FirebaseServices.currentUser?.uid}')
          .set(order.toJson());
      await saveNotificationToFirebase();
      await sendOrderNotification();
    } on Exception catch (error) {
      log('Add To Cart Error : $error');
      CustomDialog.showCustomSnackBar(
        context: context,
        title: 'Order Error',
        message: error.toString(),
        contentType: ContentType.success,
      );
    }
  }

  //! Save notification to Firebase
  Future<void> saveNotificationToFirebase() async {
    final notification = NotificationModelClass()
      ..notificationUid = FirebaseServices.currentUser?.uid
      ..notificationLocation = currentLocation
      ..notificationName = nameController.text
      ..notificationEmail = emailController.text
      ..notificationPhone = phoneController.text;

    await FirebaseServices.currentUserCollection
        .doc(FirebaseServices.currentUser?.uid)
        .collection('notification')
        .doc('$dateAndTime${FirebaseServices.currentUser?.uid}')
        .set(notification.toJson());
  }

  //! Send order notification
  Future<void> sendOrderNotification() async {
    final token = await notificationService.getEndUserToken();
    await SendNotificationService.sendNotificationService(
      token: token!,
      title: 'Add Item: ${nameController.text}',
      description: 'Your Order has been placed successfully!',
      data: {'screen': 'notification'},
    );
    log('Send successfully');
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
                  LocationSection(
                    size: size,
                    controller: _controller,
                    currentLocation: currentLocation,
                  ),
                  NameSection(
                    size: size,
                    nameController: nameController,
                  ),
                  EmailSection(
                    size: size,
                    emailController: emailController,
                  ),
                  PhoneSection(
                    size: size,
                    phoneController: phoneController,
                  ),
                  PaymentButtons(
                    size: size,
                    formKey: formKey,
                    handleOrderSubmission: handleOrderSubmission,
                  ),
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
