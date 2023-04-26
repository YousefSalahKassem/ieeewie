import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/blocs/interfaces/i_gallery_service.dart';
import 'package:ieeewie/features/Events/data/constants/paths.dart';
import 'package:ieeewie/features/Events/data/remote/interface/i_event_service.dart';
import 'package:ieeewie/features/Events/model/event.dart';

class EventsProvider {
  final IGalleryService _galleryService;
  final IEventService _eventService;

  static final provider = Provider<EventsProvider>(
    (ref) => EventsProvider(
      ref.watch(IEventService.provider),
      ref.watch(IGalleryService.provider),
    ),
  );

  EventsProvider(this._eventService, this._galleryService);

  Future<List<Uint8List>> pickImage() async {
    return _galleryService.pickImages();
  }

  Stream<List<Event>> getEvents() {
    return _eventService.getEvents();
  }

  Future<void> addEvent({required Event event, List<Uint8List>? images}) async {
    if (images != null) {
      final uploadedImages = await _uploadImages(images, EventPaths.eventImage);
      if (uploadedImages.isNotEmpty) {
        await _addEvent(event.copyWith(images: uploadedImages));
      }
    } else {
      await _addEvent(event);
    }
  }

  Future<void> updateMemberInformation(
    Event member,
    List<Uint8List>? images,
  ) async {
    if (images != null) {
      final uploadedImages = await _uploadImages(images, EventPaths.eventImage);
      if (uploadedImages.isNotEmpty) {
        await _updateEventInfo(member.copyWith(images: uploadedImages));
      }
    } else {
      await _updateEventInfo(member);
    }
  }

  Future<List<String>> _uploadImages(
    List<Uint8List> images,
    String path,
  ) async {
    final uploadedImages = await _galleryService.uploadImages(images, path);
    if (uploadedImages.isNotEmpty) {
      return uploadedImages;
    } else {
      return [];
    }
  }

  Future<void> _addEvent(Event event) async {
    await _eventService.addEvent(event);
  }

  Future<void> _updateEventInfo(Event event) async {
    await _eventService.updateEventInformation(event);
  }

  Future<void> deleteEvent(String id) async {
    await _eventService.deleteEvent(id);
  }
}
