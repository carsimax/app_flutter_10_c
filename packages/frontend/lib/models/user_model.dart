class User{
  final int? id;
  final String fullName;
  final String email;
  final String? password;

  User({
    this.id,
    required this.fullName,
    required this.email,
    this.password
  });

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'password': password
    };  
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'User{id: $id, fullName: $fullName, email: $email, password: $password}';
  }
}