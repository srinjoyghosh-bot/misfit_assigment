enum Badges { veteran, og, innerCircle }

extension BadgeDetails on Badges {
  String get title {
    switch (this) {
      case Badges.veteran:
        return "Veterans";
      case Badges.og:
        return "The OG";
      case Badges.innerCircle:
        return "Inner Circle";
    }
  }

  String get description {
    switch (this) {
      case Badges.veteran:
        return "Been to over 30 meetups, knows how to vibe with the crowd, and keeps the spirit alive!";
      case Badges.og:
        return "The first-ever Misfits! They’ve been part of the community from the start, making every meetup memorable.";
      case Badges.innerCircle:
        return "This person is part of a close knit Inner circle of a misfits club";
    }
  }

  String get icon {
    switch (this) {
      case Badges.veteran:
        return "assets/icons/veteran.png";
      case Badges.og:
        return "assets/icons/og.png";
      case Badges.innerCircle:
        return "assets/icons/inner_circle.png";
    }
  }
}

enum ActivityInfoType { meetUp, activeSince }

extension ActivityInfoDetails on ActivityInfoType {
  String get title {
    switch (this) {
      case ActivityInfoType.meetUp:
        return 'Meet-ups attended';
      case ActivityInfoType.activeSince:
        return 'Active since';
    }
  }

  String get icon {
    switch (this) {
      case ActivityInfoType.meetUp:
        return 'assets/icons/happy.png';
      case ActivityInfoType.activeSince:
        return 'assets/icons/calendar.png';
    }
  }
}
