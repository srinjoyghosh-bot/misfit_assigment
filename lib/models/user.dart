import 'package:misfit_assigment/core/enums/enums.dart';

class User {
  final String id;
  final String userName;
  final String bio;
  final String profilePic;
  final List<Badges> badges;
  final int meetUps;
  final DateTime dateJoined;
  final List<UserClub> clubs;

  User(
      {required this.id,
      required this.userName,
      required this.bio,
      required this.profilePic,
      required this.badges,
      required this.meetUps,
      required this.dateJoined,
      required this.clubs});
}

class UserClub {
  final String clubId;
  final int meetUps;
  final DateTime dateJoined;

  UserClub(
      {required this.clubId, required this.meetUps, required this.dateJoined});
}
