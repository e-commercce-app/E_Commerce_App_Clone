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

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> fetchLatLong() async {
    final data = await _determinePosition();
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
