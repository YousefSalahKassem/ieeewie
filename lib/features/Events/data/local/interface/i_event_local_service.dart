import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/features/Events/data/local/service/event_local_service.dart';
import 'package:ieeewie/features/Events/model/event.dart';

abstract class IEventLocalService {

  static final provider = Provider<EventLocalService>((ref) => EventLocalService());

  Future<bool> addEvent(Event event);

  Future<List<Event>> getEvents();

  Future<bool> deleteEvent(Event event);

  Future<bool> clearEvents();
}
