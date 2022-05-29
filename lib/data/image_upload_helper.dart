import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class ImageUploadHelper {
  final _firestoreInstance = FirebaseStorage.instance;
  Future uploadImage({required File? imageFile}) async {
    try {
      if (imageFile != null) {
        //Upload to Firebase
        var snapshot = await _firestoreInstance
            .ref()
            .child('images/${imageFile.path.split("/").last}')
            .putFile(imageFile);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }
}
