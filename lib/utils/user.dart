
class User {
  int id;
  String user_name;
  String pass;
  String access;

  User(
    this.id,
    this.user_name,
    this.pass,
    this.access,
  );

  factory User.fromJson(Map<String, dynamic> json) => User(
      int.parse(json["id"]),
      json["user_name"],
      json["pass"],
      json["accessibility"]);

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'user_name': user_name,
        'pass': pass,
        'accessibility': access,
      };
}
