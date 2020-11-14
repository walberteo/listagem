import 'package:meta/meta.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String city;
  final String state;
  final String username;
  final String email;
  final String profileImage;

  UserModel({
    @required this.firstName,
    @required this.lastName,
    @required this.city,
    @required this.state,
    @required this.username,
    @required this.email,
    @required this.profileImage,
  });

  get fullName => '$firstName $lastName';

  factory UserModel.fromJson(Map json) {
    return UserModel(
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      city: json['location']['city'],
      state: json['location']['state'],
      username: json['login']['username'],
      email: json['email'],
      profileImage: json['picture']['thumbnail'],
    );
  }
}
