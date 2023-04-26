import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/features/ContactUs/data/remote/service/contact_us_service.dart';
import 'package:ieeewie/features/ContactUs/model/contact_us.dart';

abstract class IContactUsService {

  static final provider = Provider<ContactUsService>((ref) => ContactUsService());

  Future<bool> sendMessage(ContactUs message);

  Stream<List<ContactUs>> getMessages({String? query});

  Future<bool> deleteMessage(String id);

}
