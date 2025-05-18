// import 'package:device_info_plus/device_info_plus.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  factory LocationService() => _instance;

  LocationService._internal();
  static final LocationService _instance = LocationService._internal();

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(29.802813, 71.739063),
    zoom: 13.4746,
  );

  static Future<Position> determinePosition({bool fromSettings = false}) async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    var permission = await Geolocator.checkPermission();

    // LOOP until permission is granted
    while (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        await Geolocator.openAppSettings();
        await Future.delayed(const Duration(seconds: 2)); // small wait
        permission = await Geolocator.checkPermission();
      }
    }

    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> fetchLatLong() async {
    final data = await determinePosition();
    final placemarks =
        await placemarkFromCoordinates(data.latitude, data.longitude);
    if (placemarks.isNotEmpty) {
      LocationData().setLocation(
          '${placemarks[0].street!} ${placemarks[0].country!} ${placemarks[0].name} ${placemarks[0].locality}');
    }
  }
}

class LocationData {
  factory LocationData() => _instance;

  LocationData._internal();
  static final LocationData _instance = LocationData._internal();

  String? _currentLocation;

  String? get currentLocation => _currentLocation;

  void setLocation(String location) {
    _currentLocation = location;
  }
}

// class LocationService {
//   factory LocationService() => _instance;

//   LocationService._internal();
//   static final LocationService _instance = LocationService._internal();

//   static const CameraPosition kGooglePlex = CameraPosition(
//     target: LatLng(29.802813, 71.739063),
//     zoom: 13.4746,
//   );

//   static Future<int> _getAndroidVersion() async {
//     final deviceInfo = DeviceInfoPlugin();
//     final androidInfo = await deviceInfo.androidInfo;
//     return androidInfo.version.sdkInt;
//   }

//   static Future<Position> determinePosition({bool fromSettings = false}) async {
//     final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!isServiceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     final androidVersion = await _getAndroidVersion();
//     var permission = await Geolocator.checkPermission();

//     // Custom flow for Android 11 and below
//     if (androidVersion <= 30) {
//       // Some devices don't show dialog; open settings directly
//       if (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever) {
//         await Geolocator.requestPermission();
//         permission = await Geolocator.checkPermission();

//         if (permission == LocationPermission.denied ||
//             permission == LocationPermission.deniedForever) {
//           await Geolocator.openAppSettings();
//           await Future.delayed(const Duration(seconds: 2));
//           permission = await Geolocator.checkPermission();
//         }
//       }
//     } else {
//       // Android 12+ will handle normally
//       while (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever) {
//         permission = await Geolocator.requestPermission();

//         if (permission == LocationPermission.denied ||
//             permission == LocationPermission.deniedForever) {
//           await Geolocator.openAppSettings();
//           await Future.delayed(const Duration(seconds: 2));
//           permission = await Geolocator.checkPermission();
//         }
//       }
//     }

//     return Geolocator.getCurrentPosition(
//       locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
//       desiredAccuracy: LocationAccuracy.high,
//     );
//   }

//   Future<void> fetchLatLong() async {
//     final data = await determinePosition();
//     final placemarks =
//         await placemarkFromCoordinates(data.latitude, data.longitude);
//     if (placemarks.isNotEmpty) {
//       LocationData().setLocation(
//         '${placemarks[0].street ?? ''}, ${placemarks[0].locality ?? ''}, ${placemarks[0].country ?? ''}',
//       );
//     }
//   }
// }
