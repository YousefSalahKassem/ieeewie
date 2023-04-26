import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'event.g.dart';

@HiveType(typeId: 1)
class Event extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String id;
  @HiveField(3)
  final List<dynamic>? images;
  @HiveField(4)
  final String? video;
  @HiveField(5)
  final String startDate;
  @HiveField(6)
  final String? location;
  @HiveField(7)
  final String? category;
  @HiveField(8)
  final String hostName;
  @HiveField(9)
  final String? linkExplore;
  @HiveField(10)
  final String? meetingLink;

  Event({
    required this.title,
    required this.description,
    this.images,
    this.video,
    required this.startDate,
    this.location,
    this.category,
    required this.hostName,
    this.linkExplore,
    this.meetingLink,
    required this.id,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    final imageList = json['images'] as List<dynamic>?;
    final images = imageList?.map((image) => image.toString()).toList();
    return Event(
      title: json['title'] as String,
      id: json['id'] as String,
      description: json['description'] as String,
      startDate: json['startDate'] as String,
      hostName: json['hostName'] as String,
      video: json['video'] as String?,
      location: json['location'] as String?,
      category: json['category'] as String?,
      linkExplore: json['linkExplore'] as String?,
      meetingLink: json['meetingLink'] as String?,
      images: images,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['startDate'] = startDate;
    data['hostName'] = hostName;
    data['video'] = video;
    data['location'] = location;
    data['category'] = category;
    data['linkExplore'] = linkExplore;
    data['meetingLink'] = meetingLink;
    data['hostName'] = hostName;
    data['images'] = images;
    data['id'] = id;
    return data;
  }

  Event copyWith({
    String? title,
    String? description,
    List<dynamic>? images,
    String? video,
    String? startDate,
    String? location,
    String? category,
    String? hostName,
    String? linkExplore,
    String? meetingLink,
    String? id,
  }) {
    return Event(
      title: title ?? this.title,
      description: description ?? this.description,
      images: images ?? this.images,
      video: video ?? this.video,
      startDate: startDate ?? this.startDate,
      location: location ?? this.location,
      category: category ?? this.category,
      hostName: hostName ?? this.hostName,
      linkExplore: linkExplore ?? this.linkExplore,
      meetingLink: meetingLink ?? this.meetingLink,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [id,title,description,images,video,startDate,location,category,hostName,linkExplore,meetingLink];
}
