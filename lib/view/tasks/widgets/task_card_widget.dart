import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban/core/ui_kit/text/text_withgooglefonts_widet.dart';
import 'package:kanban/helper/color_helper.dart';
import 'package:kanban/model/task.dart';
import 'package:kanban/view_model/tasks/task_view_model.dart';
import 'package:provider/provider.dart';

class TaskCardWidget extends StatelessWidget {
  TaskModel task;
  Function() onStepPressed;
  Function() onUserPressed;

  TaskCardWidget(
      {required this.task,
      required this.onStepPressed,
      required this.onUserPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, viewModel, child) => ListTile(
        title: Container(
          color: ColorHelper.taskContainerBackColor,
          margin: EdgeInsets.all(8.w),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: .8.sw,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: .40.sw,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 12.sp,
                                    color: Colors.green,
                                  ),
                                  8.w.horizontalSpace,
                                  TextStyleGenerator(
                                    text: task.id,
                                    color: Colors.lightBlue,
                                  ),
                                ],
                              ),
                            ),
                            TextStyleGenerator(
                              text: task.complatedTime,
                              color: Colors.lightBlue,
                            ),
                          ],
                        ),
                      ),
                      12.h.verticalSpace,
                      SizedBox(
                        width: .65.sw,
                        child: TextStyleGenerator(
                          text: task.title,
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              24.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => onStepPressed(),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.sp),
                          )),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextStyleGenerator(
                            text: task.kanban.toUpperCase(),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onUserPressed(),
                    child: CircleAvatar(
                      child: TextStyleGenerator(
                        text: task.assigned.userName.substring(0, 1),
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
