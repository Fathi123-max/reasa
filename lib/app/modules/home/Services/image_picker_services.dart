import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  File? image;
  final _picker = ImagePicker();
  // This function allows the user to pick an image from their device's gallery

  Future<File?> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      return image;
    } else {
      Get.snackbar("No Image", "Image not Selected");
      return null;
    }
  }

  // This function uploads the given file to Firebase Storage and returns its download URL
  Future<String?> uploadImageToFirebaseStorage(File? imageFile) async {
    if (imageFile == null) {
      return null;
    }
    try {
      // Create a storage reference to the location where you want to store the image in Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images/${DateTime.now().millisecondsSinceEpoch}.jpeg');
      // Upload the file to the storage reference
      final uploadTask = storageRef.putFile(imageFile);
      // Monitor the upload progress and handle any errors
      final snapshot = await uploadTask.whenComplete(() {});
      if (snapshot.state == TaskState.success) {
        // Get the download URL of the uploaded image
        final downloadURL = await snapshot.ref.getDownloadURL();
        return downloadURL;
      } else {
        print('Error uploading image');
        return null;
      }
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  // This function saves the given image download URL to Firestore for a specific user
  Future<void> saveImageDownloadURLToFirestore(
      String imageDownloadURL, String userId) async {
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    try {
      await userRef.update({'image_download_url': imageDownloadURL});
    } catch (e) {
      print('Error updating user image download URL: $e');
    }
  }
//  // Example usage:
// final imageFile = await pickImage();
// final imageDownloadURL = await uploadImageToFirebaseStorage(imageFile);
// if (imageDownloadURL != null) {
//   await saveImageDownloadURLToFirestore(imageDownloadURL, 'user123');
// }
}
