import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/features/MemberShip/data/remote/interface/i_membership_service.dart';
import 'package:ieeewie/features/MemberShip/model/membership.dart';

class MembershipNotifier {
  final IMembershipService _service;

  static final provider = Provider.autoDispose<MembershipNotifier>(
    (ref) => MembershipNotifier(ref.watch(
      IMembershipService.provider,
    ),),
  );

  MembershipNotifier(this._service);

  Future<void> addMembership (Membership membership) async{
    await _service.addMembership(membership);
  }

  Stream<List<Membership>> getBenefits() {
    return _service.getMembershipBenefits();
  }

  Future<void> deleteMembership (String id) async {
    await _service.deleteMembership(id);
  }

  Future<void> updateMembershipInformation (Membership membership) async{
    await _service.updateMembershipInfo(membership);
  }
}
