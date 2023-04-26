import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ieeewie/features/MemberShip/data/remote/constants/paths.dart';
import 'package:ieeewie/features/MemberShip/data/remote/interface/i_membership_service.dart';
import 'package:ieeewie/features/MemberShip/model/membership.dart';

class MembershipService implements IMembershipService {
  MembershipService() {
    _database.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  final FirebaseFirestore _database = FirebaseFirestore.instance;

  @override
  Stream<List<Membership>> getMembershipBenefits() {
    return _database.collection(MembershipPaths.membership).snapshots().map(
          (snapshot) =>
          snapshot.docs.map((doc) => Membership.fromJson(doc.data())).toList(),
    );
  }

  @override
  Future<bool> addMembership(Membership membership) async {
    try {
      await _database
          .collection(MembershipPaths.membership)
          .doc()
          .set(membership.toJson());
      return true;
    } on FirebaseException catch (message) {
      log(message.toString(), name: "error send message");
      return false;
    }
  }

  @override
  Future<bool> deleteMembership(String id) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _database
          .collection(MembershipPaths.membership)
          .where("id", isEqualTo: id)
          .get();

      for (final DocumentSnapshot<Map<String, dynamic>> snapshot
          in querySnapshot.docs) {
        await snapshot.reference.delete();
      }
      return true;
    } catch (error) {
      log('Error deleting member: $error');
      return false;
    }
  }

  @override
  Future<bool> updateMembershipInfo(Membership membership) async {
    try {
      final CollectionReference<Map<String, dynamic>> collectionRef =
          _database.collection(MembershipPaths.membership);

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await collectionRef.where('id', isEqualTo: membership.id).get();

      if (snapshot.docs.isNotEmpty) {
        final DocumentReference<Map<String, dynamic>> docRef =
            collectionRef.doc(snapshot.docs.first.id);
        await docRef.update(membership.toJson());
        return true;
      } else {
        log('Document with id ${membership.id} not found.');
        return false;
      }
    } catch (error) {
      log('Error updating member info: $error');
      return false;
    }
  }
}
