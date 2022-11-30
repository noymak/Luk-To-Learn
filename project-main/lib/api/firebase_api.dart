import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File _video){
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(_video);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  // static UploadTask? uploadBytes(String destination, Uint8List data){
  // try {
  //   final ref = FirebaseStorage.instance.ref(destination);

  //   return ref.putData(data);
  // } on FirebaseException catch (e) {
  //   return null;
  // }
  // }
}