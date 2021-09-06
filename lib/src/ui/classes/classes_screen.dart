import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobile_2school/src/resources/hard/hard_post.dart';
import 'package:flutter_mobile_2school/src/themes/app_colors.dart';
import 'package:flutter_mobile_2school/src/themes/font_family.dart';
import 'package:flutter_mobile_2school/src/themes/theme_service.dart';
import 'package:flutter_mobile_2school/src/ui/classes/widgets/class_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class ClassesScreen extends StatefulWidget {
  @override
  _ClassesScreenState createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            PhosphorIcons.slidersHorizontal,
            size: 22.sp,
          ),
        ),
        title: Text(
          'Classes',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamily.lato,
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              PhosphorIcons.magnifyingGlassBold,
              size: 20.sp,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Feather.plus_square,
              size: 20.sp,
              color: colorPrimary,
            ),
          ),
        ],
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 2.5.sp),
            Divider(
              height: .25,
              thickness: .25,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 8.sp, bottom: 16.sp),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return index == 0
                      ? _buildCurrentClasses(context)
                      : Container();
                },
              ),
            ),
          ],
        )),
      ),
    );
  }

  _buildCurrentClasses(context) {
    return Container(
      padding: EdgeInsets.only(left: 10.sp),
      child: Column(
        children: [
          _buildTitle(
            'Your Classes',
            PhosphorIcons.chalkboardSimpleBold,
            themeService.isSavedDarkMode() ? colorAttendance : colorActive,
          ),
          SizedBox(height: 4.sp),
          Container(
            height: 164.sp,
            width: 100.w,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ClassCard(
                  className: posts[index].groupName,
                  imageClass: posts[index].imageGroup,
                  teacher: posts[index].authorName,
                );
              },
            ),
          ),
          SizedBox(height: 4.sp),
          _buildTitle(
            'Recommend Class',
            PhosphorIcons.presentationChartBold,
            colorPrimary,
          ),
        ],
      ),
    );
  }

  _buildTitle(title, icon, color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 18.sp,
              color: color,
            ),
            SizedBox(width: 6.sp),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                fontFamily: FontFamily.lato,
                color: color,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () => null,
          icon: Icon(
            PhosphorIcons.squaresFour,
            size: 20.sp,
          ),
        ),
      ],
    );
  }
}
