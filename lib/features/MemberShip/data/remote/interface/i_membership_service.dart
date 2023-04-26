import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/features/MemberShip/data/remote/service/membership_service.dart';
import 'package:ieeewie/features/MemberShip/model/membership.dart';

abstract class IMembershipService {

  static final provider = Provider<MembershipService>((ref) => MembershipService());

  Future<bool> addMembership(Membership membership);

  Stream<List<Membership>> getMembershipBenefits();

  Future<bool> deleteMembership(String id);

  Future<bool> updateMembershipInfo(Membership membership);
}
