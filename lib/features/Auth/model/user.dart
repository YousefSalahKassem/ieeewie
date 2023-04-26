class UserModel {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String photoUrl;

  UserModel({
    this.name = "",
    required this.email,
    required this.password,
    this.phoneNumber = "",
    this.photoUrl = "",
  });

  factory UserModel.fromJson(Map<String, String> json) {
    return UserModel(
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      phoneNumber: json['phoneNumber'] ?? "",
      photoUrl: json['photoUrl'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['photoUrl'] = photoUrl;
    return data;
  }

  factory UserModel.empty() {
    return UserModel(
      email: "Guest@Guest.com",
      password: "",
      name: "Guest",
    );
  }

  UserModel copyWith({
    String? photoUrl,
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
  }) {
    return UserModel(
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }
}
