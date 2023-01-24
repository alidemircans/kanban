import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban/core/ui_kit/text/text_withgooglefonts_widet.dart';

class TabbarTitleWidget extends StatelessWidget {
  String title;
  int count;
  TabbarTitleWidget({required this.title, required this.count, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 50.h,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextStyleGenerator(
                  text: title,
                  color: Colors.white,
                  fontSize: 24.sp,
                ),
                TextStyleGenerator(
                  text: " $count",
                  color: Colors.grey,
                  fontSize: 24.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
