import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ieeewie/features/Events/data/constants/paths.dart';
import 'package:ieeewie/features/Events/data/remote/interface/i_event_service.dart';
import 'package:ieeewie/features/Events/model/event.dart';

class EventService extends IEventService{

  final _database = FirebaseFirestore.instance;
  EventService(){
    _database.settings = const Settings(persistenceEnabled: true, cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  }

  @override
  Future<bool> addEvent(Event event) async {
    try {
      await _database.collection(EventPaths.event).doc().set(event.toJson());
      return true;
    } on FirebaseException catch (message) {
      log(message.toString(), name: "error send message");
      return false;
    }
  }

  @override
  Stream<List<Event>> getEvents({String? query}) {

    Query<Map<String, dynamic>> eventsQuery =
    _database.collection(EventPaths.event);

    if (query != null && query.isNotEmpty) {
      eventsQuery = eventsQuery.where('message', isEqualTo: query);
    }

    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshots =
    eventsQuery.snapshots();

    final Stream<List<Event>> events =
    snapshots.map((snapshot) => snapshot.docs
        .map((doc) => Event.fromJson(doc.data()))
        .toList(),);


    return events;
  }

  @override
  Future<bool> deleteEvent(String id) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await _database.collection(EventPaths.event).where("id", isEqualTo: id).get();

      for (final DocumentSnapshot<Map<String, dynamic>> snapshot in querySnapshot.docs) {
        await snapshot.reference.delete();
      }
      return true;
    } catch (error) {
      log('Error deleting member: $error');
      return false;
    }
  }


  @override
  Future<bool> updateEventInformation(Event event) async {
    try {
      final CollectionReference<Map<String, dynamic>> collectionRef =
      _database.collection(EventPaths.event);

      final QuerySnapshot<Map<String, dynamic>> snapshot =
      await collectionRef.where('id', isEqualTo: event.id).get();

      if (snapshot.docs.isNotEmpty) {
        final DocumentReference<Map<String, dynamic>> docRef =
        collectionRef.doc(snapshot.docs.first.id);
        await docRef.update(event.toJson());
        return true;
      } else {
        log('Document with id ${event.id} not found.');
        return false;
      }
    } catch (error) {
      log('Error updating event info: $error');
      return false;
    }
  }

}
