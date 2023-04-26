import 'package:ieeewie/features/MemberShip/model/benefit.dart';


class Membership {
  final String title;
  final String? description;
  final List<Benefit>? benefits;
  final String id;

  Membership({
    required this.title,
    this.description,
    this.benefits,
    required this.id,
  });

  factory Membership.fromJson(Map<String, dynamic> json) {
    final benefitsJson = json['benefits'] as List<dynamic>?;

    return Membership(
      title: json['title'] as String,
      id: json['id'] as String,
      description: json['description'] as String?,
      benefits: benefitsJson != null
          ? benefitsJson.map((benefit) => Benefit.fromJson(benefit as Map<String, dynamic>)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['id'] = id;
    if (benefits != null) {
      data['benefits'] = benefits!.map((benefit) => benefit.toJson()).toList();
    }
    return data;
  }

}
