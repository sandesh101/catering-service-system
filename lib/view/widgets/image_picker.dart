import 'package:image_picker/image_picker.dart';

import '../../provider/image_picker_provider.dart';

class PickImage {
  XFile? pickedImage;
  final ImagePickerProvider imagePickerProvider = ImagePickerProvider();
  pickImage() async {
    ImagePicker picker = ImagePicker();
    pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imagePickerProvider.setIsPickedImage(true);
      print(imagePickerProvider.isPickedImage);
    }
    print(pickedImage!.name);
  }
}
