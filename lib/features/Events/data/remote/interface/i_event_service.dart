import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/features/Events/data/remote/service/event_service.dart';
import 'package:ieeewie/features/Events/model/event.dart';

abstract class IEventService {

  static final provider = Provider<EventService>((ref) => EventService());

  Future<bool> addEvent(Event event);

  Stream<List<Event>> getEvents({String? query});

  Future<bool> deleteEvent(String id);

  Future<bool> updateEventInformation(Event event);
}
