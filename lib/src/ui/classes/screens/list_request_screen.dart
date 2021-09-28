import 'package:cloudmate/src/routes/app_pages.dart';
import 'package:cloudmate/src/themes/font_family.dart';
import 'package:cloudmate/src/themes/theme_service.dart';
import 'package:cloudmate/src/ui/classes/widgets/user_request_card.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class ListRequestClassScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListRequestClassScreenState();
}

class _ListRequestClassScreenState extends State<ListRequestClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: ThemeService.systemBrightness,
        centerTitle: true,
        elevation: .0,
        leading: IconButton(
          onPressed: () {
            AppNavigator.pop();
          },
          icon: Icon(
            PhosphorIcons.caretLeft,
            size: 20.sp,
          ),
        ),
        title: Text(
          'Yêu cầu tham gia',
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: FontFamily.lato,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            SizedBox(height: 2.5.sp),
            Divider(
              height: .25,
              thickness: .25,
            ),
            SizedBox(height: 6.sp),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 16.sp),
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return UserRequestCard(
                    fullName: 'lambiengcode',
                    urlToImage:
                        'https://avatars.githubusercontent.com/u/60530946?v=4',
                    blurHash: '',
                    isLast: index == 3,
                    requestTime: DateTime.now(),
                    requestMessage: 'Tham gia lớp học',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
