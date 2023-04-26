import 'package:hive/hive.dart';
import 'package:ieeewie/core/helpers/ui_helpers.dart';
import 'package:ieeewie/features/Events/data/constants/paths.dart';
import 'package:ieeewie/features/Events/data/local/interface/i_event_local_service.dart';
import 'package:ieeewie/features/Events/model/event.dart';

class EventLocalService implements IEventLocalService {
  @override
  Future<bool> addEvent(Event event) async{
    try {
      final box = Hive.box<Event>(EventPaths.event);
      box.add(event);
      UiAlerts.showSuccessNotification("Saved Successfully");
      return true;
    } catch (e){
      UiAlerts.showErrorNotification(e.toString());
      return false;
    }
  }

  @override
  Future<bool> clearEvents() async {
    try {
      final box = Hive.box<Event>(EventPaths.event);
      box.clear();
      UiAlerts.showSuccessNotification("Cleared Successfully");
      return true;
    } catch (e){
      UiAlerts.showErrorNotification(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteEvent(Event event) async {
    try {
      final box = Hive.box<Event>(EventPaths.event);
      box.delete(event.key);
      UiAlerts.showSuccessNotification("Deleted Successfully");
      return true;
    } catch (e){
      UiAlerts.showErrorNotification(e.toString());
      return false;
    }
  }

  @override
  Future<List<Event>> getEvents() async {
    final box = Hive.box<Event>(EventPaths.event);
    return box.values.toList();
  }

  Future<void> dispose()async{
    await Hive.close();
  }

}
