import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misfit_assigment/badge_dialog.dart';
import 'package:misfit_assigment/club_activity_tile.dart';
import 'package:misfit_assigment/enums.dart';
import 'package:misfit_assigment/activity_card.dart';
import 'package:misfit_assigment/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.close,size: 32.r),
          title: Text(
            "Profile",
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF191C20)),
          ),
          titleSpacing: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200.r,
                  height: 200.r,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(user.profilePic)),
                    borderRadius: BorderRadius.all(Radius.circular(100.w)),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  user.userName,
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 16.w),
                    ...List.from(Badges.values
                        .map((badge) => BadgeWidget(badge: badge))),
                    SizedBox(width: 16.w)
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  '"${user.bio}"',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: ActivityCard(
                      activityInfoType: ActivityInfoType.meetUp,
                      meetUps: user.meetUps,
                    )),
                    SizedBox(width: 16.w),
                    Expanded(
                        child: ActivityCard(
                      activityInfoType: ActivityInfoType.activeSince,
                      activeSince: user.dateJoined,
                    ))
                  ],
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                            color: const Color(0xFFC6C6CA), height: 16.h)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Their Active Clubs',
                        style: TextStyle(
                            color: const Color(0xFF191C20),
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                            color: const Color(0xFFC6C6CA), height: 16.h)),
                  ],
                ),
                SizedBox(height: 32.h),
                ...List.from(
                    user.clubs.map((club) => ClubActivityTile(userClub: club)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({super.key, required this.badge});

  final Badges badge;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: ThemeData(
                dialogBackgroundColor: Colors.white
              ),
              child: AlertDialog(
                titlePadding: const EdgeInsets.all(0),
                contentPadding: const EdgeInsets.all(16),
                content: BadgeDialog(badge: badge),
              ),
            );
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(badge.icon, width: 56.w),
          SizedBox(height: 10.h),
          Text(
            badge.title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
