import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ieeewie/features/Board/data/remote/contants/paths.dart';
import 'package:ieeewie/features/Board/data/remote/interface/i_board_service.dart';
import 'package:ieeewie/features/Board/model/board.dart';

class BoardService implements IBoardService {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  BoardService() {
    _database.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  @override
  Future<bool> addMember(Board member) async {
    try {
      await _database.collection(BoardPaths.team).doc().set(member.toJson());
      return true;
    } on FirebaseException catch (message) {
      log(message.toString(), name: "error send message");
      return false;
    }
  }

  @override
  Stream<List<Board>> getTeam() {
    return _database.collection(BoardPaths.team).snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => Board.fromJson(doc.data())).toList(),
        );
  }

  @override
  Future<bool> deleteMember(String id) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _database
          .collection(BoardPaths.team)
          .where("id", isEqualTo: id)
          .get();
      await Future.wait(
          querySnapshot.docs.map((doc) => doc.reference.delete()),);
      return true;
    } catch (error) {
      log('Error deleting member: $error');
      return false;
    }
  }

  @override
  Future<bool> updateMemberInfo(Board member) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _database
          .collection(BoardPaths.team)
          .where('id', isEqualTo: member.id)
          .get();
      if (snapshot.docs.isNotEmpty) {
        await _database
            .doc(snapshot.docs.first.reference.path)
            .update(member.toJson());
        return true;
      } else {
        log('Document with id ${member.id} not found.');
        return false;
      }
    } catch (error) {
      log('Error updating member info: $error');
      return false;
    }
  }
}
