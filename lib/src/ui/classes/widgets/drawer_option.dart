import 'package:cloudmate/src/themes/app_colors.dart';
import 'package:cloudmate/src/themes/font_family.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class DrawerOption extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DrawerOptionState();
}

class _DrawerOptionState extends State<DrawerOption> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100.h,
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20.sp),
                  _buildLine(
                    context,
                    'Roadmap',
                    PhosphorIcons.graduationCap,
                    null,
                  ),
                  _buildDividerTransparant(context),
                  _buildLine(
                    context,
                    'Members',
                    PhosphorIcons.usersFour,
                    null,
                  ),
                  _buildDividerTransparant(context),
                  _buildLine(
                    context,
                    'Notification',
                    PhosphorIcons.bellSimple,
                    null,
                  ),
                  _buildDividerTransparant(context),
                  _buildLine(
                    context,
                    'Report',
                    PhosphorIcons.info,
                    null,
                  ),
                  _buildDivider(context),
                  _buildLine(
                    context,
                    'Leave Class',
                    PhosphorIcons.signOut,
                    colorPrimary,
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLine(context, title, icon, color) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(left: 12.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 16.sp,
              color: color,
            ),
            SizedBox(width: 8.sp),
            Padding(
              padding: EdgeInsets.only(top: 1.25.sp),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: color ??
                      Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(.75),
                  fontFamily: FontFamily.lato,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDividerTransparant(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.8),
      child: Divider(
        thickness: .1,
        height: .1,
        indent: 8.sp,
        endIndent: 10.w,
      ),
    );
  }

  Widget _buildDivider(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.8),
      child: Divider(
        thickness: .12,
        height: .12,
        indent: 8.sp,
        endIndent: 10.w,
      ),
    );
  }
}
