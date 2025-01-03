import 'package:misfit_assigment/enums.dart';
import 'package:misfit_assigment/user.dart';
import 'package:uuid/uuid.dart';

import 'club.dart';

class SampleData {
  static List<Club> clubs = [
    Club(
        id: const Uuid().v1(),
        name: 'Poets without borders',
        location: 'Sec 30, Gurugram',
        thumbnail: 'assets/images/club_1.jpg'),
    Club(
        id: const Uuid().v1(),
        name: 'All things pop culture',
        location: 'Sec 30, Gurugram',
        thumbnail: 'assets/images/club_2.png'),
  ];

  static User user = User(
      id: const Uuid().v1(),
      userName: 'Komal Pandey',
      bio:
          'I’m a board game fan! I love crafting wild strategies and having fun with friends. Who knew dice could cause such chaos?',
      profilePic: 'assets/images/profile_pic.png',
      badges: Badges.values,
      meetUps: 2,
      dateJoined: DateTime(2024, 6),
      clubs: clubs
          .map((club) => UserClub(
              clubId: club.id, meetUps: 2, dateJoined: DateTime(2024, 6)))
          .toList());
}
