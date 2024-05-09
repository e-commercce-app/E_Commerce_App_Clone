// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

// import '../../Export/e_commerce_export.dart';

// class CurrentLocationECommerce {
//   // ! Using Internet Fetch This Current Location .
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }

//   getLatLong() {
//     Future<Position> data = _determinePosition();
//     data.then((value) {
//       debugPrint("value $value");
//       setState(() {
//         value.latitude;
//         value.longitude;
//       });

//       getAddress(value.latitude, value.longitude);
//     }).catchError((error) {
//       debugPrint("Error $error");
//     });
//   }

//   /// ! For convert latitude longitude to address
//   /// !Using (GeoCoding) Package .
//   getAddress(
//     lat,
//     long,
//   ) async {
//     List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
//     setState(() {
//       currentLocation =
//           "${placemarks[0].street!} ${placemarks[0].country!} ${placemarks[0].name} ${placemarks[0].locality}";
//     });

//     for (int i = 0; i < placemarks.length; i++) {
//       debugPrint("INDEX $i ${placemarks[i]}");
//     }
//   }
// }
