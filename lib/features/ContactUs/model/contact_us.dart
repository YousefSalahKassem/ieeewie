class ContactUs {
  final String name;
  final String email;
  final String? subject;
  final String? message;
  final String id;
  ContactUs({
    required this.name,
    required this.email,
    required this.id,
    this.message,
    this.subject,
  });

  factory ContactUs.fromJson(Map<String, dynamic> json) {
    return ContactUs(
      name: json['name'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
      message: json['message'] as String?,
      subject: json['subject'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['subject'] = subject;
    data['message'] = message;
    data['id'] = id;
    return data;
  }
}
