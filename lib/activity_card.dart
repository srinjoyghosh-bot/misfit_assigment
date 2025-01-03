import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misfit_assigment/enums.dart';
import 'package:misfit_assigment/utils.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard(
      {super.key,
      required this.activityInfoType,
      this.meetUps,
      this.activeSince,
      this.isClubActivity = false});

  final ActivityInfoType activityInfoType;
  final int? meetUps;
  final DateTime? activeSince;
  final bool isClubActivity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF4F4F5),
          borderRadius: BorderRadius.all(Radius.circular(16.r))),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            activityInfoType.title,
            style: TextStyle(
                color: const Color(0xFF46474A),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(activityInfoType.icon, width: 28.r, height: 28.r),
              SizedBox(width: 8.w),
              Text(
                '${activityInfoType == ActivityInfoType.meetUp ? meetUps : Utils.formatDate(activeSince)}',
                style: TextStyle(
                    color: const Color(0xFF191C20),
                    fontSize:isClubActivity ?  16.sp : 20.sp,
                    fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }
}
