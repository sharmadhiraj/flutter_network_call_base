class User {
  final int id;
  final String name;
  final String email;
  final String avatar;

  User(this.id, this.name, this.email, this.avatar);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["id"],
      json["first_name"] + " " + json["last_name"],
      json["email"],
      json["avatar"],
    );
  }

  static List<User> parseList(List<dynamic> list) {
    return list.map((i) => User.fromJson(i)).toList();
  }
}
