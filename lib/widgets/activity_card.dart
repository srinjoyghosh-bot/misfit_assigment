import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misfit_assigment/core/enums/enums.dart';
import 'package:misfit_assigment/core/constants/styles.dart';
import 'package:misfit_assigment/core/utils/utils.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard(
      {super.key,
      required this.activityInfoType,
      this.meetUps,
      this.activeSince,
      this.isClubActivity = false,
      this.icon});

  final ActivityInfoType activityInfoType;
  final int? meetUps;
  final DateTime? activeSince;
  final bool isClubActivity;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Styles.surfaceLevel,
          borderRadius: BorderRadius.all(Radius.circular(24.r))),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            activityInfoType.title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(icon ?? activityInfoType.icon,
                  width: 28.r, height: 28.r),
              SizedBox(width: 8.w),
              Text(
                '${activityInfoType == ActivityInfoType.meetUp ? meetUps : Utils.formatDate(activeSince)}',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontSize: isClubActivity ? 16.sp : 20.sp),
              )
            ],
          )
        ],
      ),
    );
  }
}
