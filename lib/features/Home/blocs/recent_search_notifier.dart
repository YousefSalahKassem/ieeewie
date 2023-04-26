import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentSearchNotifier extends StateNotifier<List<String>> {
  RecentSearchNotifier(this._prefsFuture) : super([]){
    loadRecent();
  }

  static final provider =
  StateNotifierProvider<RecentSearchNotifier, List<String>>((ref) {
    final prefsFuture = SharedPreferences.getInstance();
    return RecentSearchNotifier(prefsFuture);
  });

  final Future<SharedPreferences> _prefsFuture;
  Future<void> loadRecent() async {
    final prefs = await _prefsFuture;
    state = prefs.getStringList("recentSearch") ?? [];
  }

  Future<void> addToRecent(String query) async {
    state = {...state, query}.toList();
    _checkRecent();
  }

  Future<void> deleteRecentItem(String query) async {
    state = state.where((element) => element != query).toList();
    final prefs = await _prefsFuture;
    await prefs.setStringList("recentSearch", state);
  }

  Future<void> clearRecent() async {
    state = [];
    final prefs = await _prefsFuture;
    await prefs.remove("recentSearch");
  }

  Future<void> _checkRecent() async {
    if (state.length > 10) {
      state = state.sublist(1);
    }
    final prefs = await _prefsFuture;
    await prefs.setStringList("recentSearch", state);
  }
}
