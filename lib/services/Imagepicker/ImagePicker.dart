import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  // Get Image From Camera/Gallery
  static Future getImageFromSource(ImageSource imageSource) async {
    // File? imagefile;
    try {
      XFile? image = await ImagePicker().pickImage(source: imageSource);

      if (image == null) return;

      // imagefile = File(image.path);

      return image;
    } catch (e) {
      print('Failed To Pic image >>>: $e');
    }
  }
}
