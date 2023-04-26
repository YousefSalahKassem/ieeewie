import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/blocs/service/gallery_service.dart';

abstract class IGalleryService {
  static final provider =
      Provider<GalleryService>((ref) => GalleryService());

  Future<List<Uint8List>> pickImages();

  Future<List<String>> uploadImages(List<Uint8List> images, String path);

}
