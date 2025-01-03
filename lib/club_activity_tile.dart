import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misfit_assigment/activity_card.dart';
import 'package:misfit_assigment/enums.dart';
import 'package:misfit_assigment/sample.dart';
import 'package:misfit_assigment/user.dart';

class ClubActivityTile extends StatelessWidget {
  const ClubActivityTile({super.key, required this.userClub});

  final UserClub userClub;

  @override
  Widget build(BuildContext context) {
    final club =
        SampleData.clubs.firstWhere((club) => club.id == userClub.clubId);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFABABAE), width: 0.5.w),
        borderRadius: BorderRadius.all(Radius.circular(24.w)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, 3), // Offset in the vertical direction
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      margin: EdgeInsets.only(bottom: 32.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(18.w)),
                    child: Image.asset(
                      club.thumbnail,
                      height: 130.r,
                      width: 130.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0.h,
                    left: -5.w,
                    child: Image.asset(
                      'assets/icons/dice.png',
                      height: 36.r,
                      width: 36.w,
                    ),
                  )
                ],
              ),
              SizedBox(width: 12.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    club.name,
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: const Color(0xFF191C20),
                        overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '📍 ${club.location}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xFF46474A),
                    ),
                    textAlign: TextAlign.start,
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ActivityCard(
                  activityInfoType: ActivityInfoType.meetUp,
                  meetUps: userClub.meetUps,
                  isClubActivity: true,
                  icon: club.name == 'Poets without borders'
                      ? 'assets/icons/starstruck.png'
                      : null,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: ActivityCard(
                  activityInfoType: ActivityInfoType.activeSince,
                  activeSince: userClub.dateJoined,
                  isClubActivity: true,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
