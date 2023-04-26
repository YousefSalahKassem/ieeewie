import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/features/Board/data/remote/service/board_service.dart';
import 'package:ieeewie/features/Board/model/board.dart';


abstract class IBoardService {

  static final provider = Provider<BoardService>((ref) => BoardService());

  Future<bool> addMember(Board member);

  Stream<List<Board>> getTeam();

  Future<bool> deleteMember(String id);

  Future<bool> updateMemberInfo(Board member);


}
