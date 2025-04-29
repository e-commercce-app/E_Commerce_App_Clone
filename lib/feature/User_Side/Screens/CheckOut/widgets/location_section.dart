import 'dart:async';

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/core/Components/Helper/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({
    required this.size,
    required this.controller,
    required this.currentLocation,
    super.key,
  });
  final Size size;
  final Completer<GoogleMapController> controller;
  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSizedBox(heightRatio: 0.005),
        Container(
          height: size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GoogleMap(
              initialCameraPosition: LocationService.kGooglePlex,
              myLocationEnabled: true,
              trafficEnabled: true,
              mapToolbarEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                this.controller.complete(controller);
                currentLocation;
              },
            ),
          ),
        ),
        Text.rich(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          TextSpan(
            children: [
              TextSpan(
                text: 'Find Location :\t\t',
                style:
                    Resources.textStyle.userNameTextStyle(size: size).copyWith(
                          fontWeight: FontWeight.bold,
                          color: Resources.colors.kButtonColor,
                        ),
                children: [
                  TextSpan(
                    text: currentLocation,
                    style: Resources.textStyle
                        .userNameTextStyle(size: size)
                        .copyWith(
                          fontWeight: FontWeight.w400,
                          color: Resources.colors.kBlack,
                          decorationStyle: TextDecorationStyle.double,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
