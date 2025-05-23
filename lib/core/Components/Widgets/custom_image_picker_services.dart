// import 'dart:developer' as developer;

// import 'package:e_commerce/Export/e_commerce_export.dart';

// class ImagePickerService {
//   ImagePicker picker = ImagePicker();

//   // ! Pick Gallery Images .
//   Future<XFile?> galleryImage() async {
//     final image =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 90);
//     // developer.log(image!.path.toString());
//     return image;
//   }

//   // ! Pick Camera Images .
//   Future<XFile?> cameraCaptureImage() async {
//     final cameraImage =
//         await picker.pickImage(source: ImageSource.camera, imageQuality: 90);
//     return cameraImage;
//   }

//   // ! Get Image From Camera Image And Gallery Image
//   static Future<dynamic> getImageFromSource({
//     required ImageSource imageSource,
//   }) async {
//     // File? imagefile;
//     try {
//       final image = await ImagePicker().pickImage(
//         source: imageSource,
//         imageQuality: 80,
//         preferredCameraDevice: CameraDevice.rear,
//       );

//       if (image != null) return;

//       // imagefile = File(image.path);

//       return image;
//     } on Exception catch (error) {
//       developer.log('Failed To Pic image >>>: ${error.toString()}');
//     }
//   }
// }
