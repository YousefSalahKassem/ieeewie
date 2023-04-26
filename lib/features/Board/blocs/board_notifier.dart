import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/blocs/interfaces/i_gallery_service.dart';
import 'package:ieeewie/features/Board/data/remote/contants/paths.dart';
import 'package:ieeewie/features/Board/data/remote/interface/i_board_service.dart';
import 'package:ieeewie/features/Board/model/board.dart';

class BoardNotifier {
  final IBoardService _service;
  final IGalleryService _galleryService;

  static final provider = Provider.autoDispose<BoardNotifier>(
    (ref) => BoardNotifier(
      ref.watch(IBoardService.provider),
      ref.watch(IGalleryService.provider),
    ),
  );

  BoardNotifier(this._service, this._galleryService);

  Future<void> addMember(Board member, Uint8List image) async {
    final imageUrl = await _uploadImage(image, BoardPaths.memberImage);
    if (imageUrl != null) {
      await _service.addMember(member.copyWith(image: imageUrl));
    }
  }

  Stream<List<Board>> getTeam() {
    return _service.getTeam();
  }

  Future<void> updateMemberInformation(Board member, Uint8List? image) async {
    if (image != null) {
      final imageUrl = await _uploadImage(image, BoardPaths.memberImage);
      if (imageUrl != null) {
        await _updateMemberInfo(member.copyWith(image: imageUrl));
      }
    } else {
      await _updateMemberInfo(member);
    }
  }

  Future<String?> _uploadImage(Uint8List image, String path) async {
    final uploadedImages = await _galleryService.uploadImages([image], path);
    if (uploadedImages.isNotEmpty) {
      return uploadedImages.first;
    } else {
      return null;
    }
  }

  Future<void> _updateMemberInfo(Board member) async {
    await _service.updateMemberInfo(member);
  }

  Future<void> deleteMember(String id) async {
    await _service.deleteMember(id);
  }
}
