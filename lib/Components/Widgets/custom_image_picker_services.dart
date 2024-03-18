import 'dart:developer' as developer;

import '../../Export/e_commerce_export.dart';

class ImagePickerService {
  ImagePicker picker = ImagePicker();

  // ! Pick Gallery Images .
  Future<XFile?> galleryImage() async {
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 90);
    developer.log(image!.path.toString());
    return image;
  }

  // ! Pick Camera Images .
  Future<XFile?> cameraCaptureImage() async {
    final XFile? cameraImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 90);
    return cameraImage;
  }

  // ! Get Image From Camera Image And Gallery Image
  static Future getImageFromSource({
    required ImageSource imageSource,
  }) async {
    // File? imagefile;
    try {
      XFile? image = await ImagePicker().pickImage(
          source: imageSource,
          imageQuality: 80,
          preferredCameraDevice: CameraDevice.rear);

      if (image != null) return;

      // imagefile = File(image.path);

      return image;
    } catch (error) {
      developer.log('Failed To Pic image >>>: ${error.toString()}');
    }
  }
}
