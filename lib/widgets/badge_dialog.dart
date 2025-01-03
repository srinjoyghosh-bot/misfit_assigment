import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misfit_assigment/widgets/activity_card.dart';
import 'package:misfit_assigment/core/enums/enums.dart';
import 'package:misfit_assigment/core/constants/strings.dart';

class BadgeDialog extends StatelessWidget {
  const BadgeDialog({super.key, required this.badge});

  final Badges badge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 64.h),
            Image.asset(
              badge.icon,
              width: 128.r,
              height: 128.r,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                    child:
                        Divider(color: const Color(0xFFC6C6CA), height: 16.h)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    badge.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 28.sp),
                  ),
                ),
                Expanded(
                    child:
                        Divider(color: const Color(0xFFC6C6CA), height: 16.h)),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              badge.description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E7ACC),
                minimumSize: Size.fromHeight(60.h),
                textStyle: TextStyle(fontSize: 14.sp),
              ),
              child: Text(
                '${AppStrings.cool}!',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
        Positioned(
          top: 0, // Adjust top position as needed
          left: 0, // Adjust left position as needed
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ),
      ],
    );
  }
}
