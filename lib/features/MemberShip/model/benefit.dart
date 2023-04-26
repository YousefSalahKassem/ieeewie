class Benefit {
  final String title;
  final String? link;

  Benefit({
    required this.title,
    this.link,
  });

  factory Benefit.fromJson(Map<String, dynamic> json) {
    return Benefit(
      title: json['title'] as String,
      link: json['link'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['link'] = link;
    return data;
  }
}
