import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misfit_assigment/widgets/activity_card.dart';
import 'package:misfit_assigment/core/constants/assets.dart';
import 'package:misfit_assigment/core/enums/enums.dart';
import 'package:misfit_assigment/core/sample.dart';
import 'package:misfit_assigment/core/constants/styles.dart';
import 'package:misfit_assigment/models/user.dart';

class ClubActivityTile extends StatelessWidget {
  const ClubActivityTile({super.key, required this.userClub});

  final UserClub userClub;

  @override
  Widget build(BuildContext context) {
    final club =
        SampleData.clubs.firstWhere((club) => club.id == userClub.clubId);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Styles.borderPrimary, width: 0.5.w),
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
              SizedBox(
                width: 100.w,
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(18.w)),
                      child: Image.asset(
                        club.thumbnail,
                        height: 100.w,
                        width: 100.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: -2.h,
                      left: 0.w,
                      child: Image.asset(
                        AssetManager.diceIcon,
                        height: 36.r,
                        width: 36.r,
                      ),
                    )
                  ],
                ),
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
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 20.sp, overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '📍 ${club.location}',
                    style: Theme.of(context).textTheme.bodySmall,
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
                      ? AssetManager.starStruckIcon
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
