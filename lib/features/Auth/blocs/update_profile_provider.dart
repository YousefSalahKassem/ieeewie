import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/blocs/interfaces/i_gallery_service.dart';
import 'package:ieeewie/core/blocs/state/global_state.dart';
import 'package:ieeewie/features/Auth/model/user.dart';
import 'package:ieeewie/features/auth/data/remote/interfaces/i_auth_service.dart';

class UpdateProfileProvider extends StateNotifier<GlobalStates<bool>> {
  final IAuthService authService;
  final IGalleryService galleryService;
  List<Uint8List>? images;
  final GlobalKey<FormState> updateProfileKey = GlobalKey();

  UpdateProfileProvider(this.authService, this.galleryService)
      : super(GlobalStates.initial());

  static final provider =
  StateNotifierProvider<UpdateProfileProvider, GlobalStates<bool>>(
        (ref) => UpdateProfileProvider(
      ref.watch(IAuthService.provider),
      ref.watch(IGalleryService.provider),
    ),
  );

  Future<void> updateProfile(UserModel user) async {
    if(updateProfileKey.currentState!.validate()){
      updateProfileKey.currentState!.save();

      state = GlobalStates.loading();
      List<String> imagesUrl = [];
      bool isUpdated = false;

      if (images != null) {
        imagesUrl = await galleryService.uploadImages(images!, 'profile/${DateTime.now()}.png');
        isUpdated = await authService.updateProfile(user.copyWith(photoUrl: imagesUrl.first));
      } else {
        isUpdated = await authService.updateProfile(user);
      }

      if (isUpdated) {
        state = GlobalStates.success(true);
      }
    }
  }
}
