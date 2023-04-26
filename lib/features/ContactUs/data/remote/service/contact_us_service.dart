import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ieeewie/core/helpers/ui_helpers.dart';
import 'package:ieeewie/features/ContactUs/data/remote/constants/paths.dart';
import 'package:ieeewie/features/ContactUs/data/remote/interface/i_contact_us_service.dart';
import 'package:ieeewie/features/ContactUs/model/contact_us.dart';

class ContactUsService implements IContactUsService {
  ContactUsService();

  final FirebaseFirestore _database = FirebaseFirestore.instance;

  @override
  Stream<List<ContactUs>> getMessages({String? query}) {
    return _database.collection(ContactUsPaths.contactUs).snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => ContactUs.fromJson(doc.data()))
              .toList(),
        );
  }

  @override
  Future<bool> sendMessage(ContactUs message) async {
    try {
      await _database
          .collection(ContactUsPaths.contactUs)
          .doc()
          .set(message.toJson());
      UiAlerts.showSuccessNotification("Message sent successfully");
      return true;
    } on FirebaseException catch (message) {
      log(message.toString(), name: "error send message");
      return false;
    }
  }

  @override
  Future<bool> deleteMessage(String id) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _database
          .collection(ContactUsPaths.contactUs)
          .where("id", isEqualTo: id)
          .get();
      await Future.wait(
        querySnapshot.docs.map((doc) => doc.reference.delete()),
      );
      return true;
    } catch (error) {
      log('Error deleting member: $error');
      return false;
    }
  }
}
