import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/features/Events/data/local/interface/i_event_local_service.dart';
import 'package:ieeewie/features/Events/model/event.dart';

class EventsLocalProvider extends ChangeNotifier {
  static final provider = ChangeNotifierProvider(
    (ref) => EventsLocalProvider(
      ref.watch(IEventLocalService.provider),
    ),
  );

  final IEventLocalService _eventLocalService;

  List<Event> _events = [];

  List<Event> get events => _events;

  EventsLocalProvider(this._eventLocalService) {
    fetchEvents();
  }

  bool checkIfExist(Event event) {
    return _events.where((element) => element.id==event.id).isNotEmpty;
  }

  Future<void> addEvent(Event event) async {
    if (_events.where((element) => element.id==event.id).isNotEmpty) {
    } else {
      await _eventLocalService.addEvent(event);
      _events.add(event);
    }
    notifyListeners();
  }

  Future<void> removeItem(Event event) async {
    await _eventLocalService.deleteEvent(event);
    _events.remove(event);
    notifyListeners();
  }

  Future<void> fetchEvents() async {
    _events = await _eventLocalService.getEvents();
    notifyListeners();
  }

  Future<void> clearCart() async {
    await _eventLocalService.clearEvents();
    _events = [];
    notifyListeners();
  }


  void toggleEvent(Event event) {
    if (_events.where((element) => element.id==event.id).isNotEmpty) {
      removeItem(event);
    } else {
      addEvent(event);
    }
  }
}
