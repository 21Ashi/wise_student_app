import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wise_student_app/firebase/fire_database.dart';

class FireStorage {
  final FirebaseStorage fireStorage = FirebaseStorage.instance;

  Future<void> sendImage({
    required File file,
    required String roomId,
    required String uid,
  }) async {
    String ext = file.path.split('.').last;
    final ref = fireStorage.ref().child('image/$roomId/${DateTime.now().millisecondsSinceEpoch}.$ext');
    
    // Upload the file and wait for the upload to complete
    await ref.putFile(file);
    
    // Once the upload is complete, get the download URL
    String imageUrl = await ref.getDownloadURL();
    
    // Now you have the download URL, you can proceed with sending the message
    FireData().sendMessage(uid, imageUrl, roomId, type: 'image');
  }
}
