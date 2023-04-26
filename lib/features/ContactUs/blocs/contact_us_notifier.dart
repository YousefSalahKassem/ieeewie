import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/blocs/state/global_state.dart';
import 'package:ieeewie/features/ContactUs/data/remote/interface/i_contact_us_service.dart';
import 'package:ieeewie/features/ContactUs/model/contact_us.dart';

class ContactUsNotifier extends StateNotifier<GlobalStates<bool>>  {
  final IContactUsService _service;

  static final provider = StateNotifierProvider<ContactUsNotifier, GlobalStates<bool>>(
    (ref) => ContactUsNotifier(ref.watch(
      IContactUsService.provider,
    ),),
  );

  ContactUsNotifier(this._service): super(GlobalStates.initial());

  final GlobalKey<FormState> contactUsKey = GlobalKey();

  Future<void> sendMessage (ContactUs message) async{
    state = GlobalStates.loading();
    if (contactUsKey.currentState!.validate()) {
      contactUsKey.currentState!.save();
      final isSent = await _service.sendMessage(message);
      if (isSent) {
        state = GlobalStates.success(true);
      }
    }
  }

  Stream<List<ContactUs>> getMessages() {
    return _service.getMessages();
  }

  Future<void> deleteMessage(String id) async {
    await _service.deleteMessage(id);
  }
}
