import 'dart:developer';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ieeewie/core/blocs/interfaces/i_gallery_service.dart';
import 'package:ieeewie/core/helpers/ui_helpers.dart';

class GalleryService implements IGalleryService {
  final FirebaseStorage _storage;

  GalleryService() : _storage = FirebaseStorage.instance;

  @override
  Future<List<Uint8List>> pickImages() async {
    final List<Uint8List> imagesBytes = [];

    final files = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      withData: true,
    );

    if (files != null && files.files.isNotEmpty && files.files.length < 5) {
      for (final file in files.files) {
        if (file.bytes != null && file.size < 3145728) {
          imagesBytes.add(file.bytes!);
          UiAlerts.showSuccessNotification("Image Added Successfully");
        } else {
          log("maximum size");
          // TODO: Handle maximum size error
        }
      }
    } else {
      // TODO: Handle maximum number of files error
    }
    return imagesBytes;
  }

  @override
  Future<List<String>> uploadImages(List<Uint8List> images, String path) async {
    try {
      final List<String> urls = [];

      for (final image in images) {
        final ref = _storage.ref().child(path);
        await ref.putData(image);
        final url = await ref.getDownloadURL();
        urls.add(url);
      }

      return urls;
    } on FirebaseException catch (e) {
      log(e.toString(), name: "failed to upload");
      return [];
    }
  }
}
