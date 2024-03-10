class UserAuth {
  String? name;
  String? email;
  String? phonenumber;
  String? uid;

  UserAuth({
    required this.name,
    required this.email,
    required this.phonenumber,
    required this.uid,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(
        name: json['name'],
        email: json['email'],
        phonenumber: json['phonenumber'],
        uid: json['uid']);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phonenumber': phonenumber,
    };
  }
}
