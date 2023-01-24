import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban/core/di/locator.dart';
import 'package:kanban/core/ui_kit/form/text_form.dart';
import 'package:kanban/core/ui_kit/text/text_withgooglefonts_widet.dart';
import 'package:kanban/helper/app_strings.dart';
import 'package:kanban/helper/color_helper.dart';
import 'package:kanban/model/task.dart';
import 'package:kanban/model/user.dart';
import 'package:kanban/view_model/tasks/task_view_model.dart';
import 'package:provider/provider.dart';

class TaskCrudWidget extends StatefulWidget {
  TaskModel? task;

  TaskCrudWidget({this.task, Key? key}) : super(key: key);

  @override
  State<TaskCrudWidget> createState() => _TaskCrudWidgetState();
}

class _TaskCrudWidgetState extends State<TaskCrudWidget> {
  late TextEditingController textEditingController;

  String? selectedKanban = AppStrings.todo;
  UserModel? selectedUserModel;

  @override
  void initState() {
    textEditingController = TextEditingController(
      text: widget.task?.title ?? "",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<TaskViewModel>(),
      child: Consumer<TaskViewModel>(
        builder: (context, viewModel, child) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          content: Container(
            width: .8.sw,
            padding: EdgeInsets.all(36.sp),
            color: ColorHelper.taskContainerBackColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormFieldWidget(
                  title: "Task Title",
                  maxLines: 5,
                  controller: textEditingController,
                ),
                16.h.verticalSpace,
                if (widget.task == null) ...[
                  DropdownButton<String>(
                    value: widget.task?.kanban ?? selectedKanban,
                    dropdownColor: ColorHelper.taskContainerBackColor,
                    items: [
                      DropdownMenuItem(
                        value: AppStrings.todo,
                        child: TextStyleGenerator(
                          text: AppStrings.todo,
                          color: Colors.white,
                        ),
                      ),
                      DropdownMenuItem(
                        value: AppStrings.inProgress,
                        child: TextStyleGenerator(
                          text: AppStrings.inProgress,
                          color: Colors.white,
                        ),
                      ),
                      DropdownMenuItem(
                        value: AppStrings.done,
                        child: TextStyleGenerator(
                          text: AppStrings.done,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    onChanged: (val) {
                      setState(() {
                        selectedKanban = val!;
                      });
                    },
                  ),
                  DropdownButton<UserModel>(
                    value: selectedUserModel ??
                        const UserModel(userName: "Ali Demircan"),
                    dropdownColor: ColorHelper.taskContainerBackColor,
                    items: viewModel.users.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: TextStyleGenerator(
                          text: e.userName,
                          color: Colors.white,
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedUserModel = val!;
                      });
                    },
                  ),
                  24.h.verticalSpace,
                ],
                GestureDetector(
                  onTap: () {
                    if (widget.task == null) {
                      if (textEditingController.text.trim() == "") {
                        SnackBar snackBar = SnackBar(
                            content: TextStyleGenerator(
                          text: "Please dont breake emtpty area",
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        TaskModel task = TaskModel(
                          assigned: selectedUserModel ??
                              const UserModel(userName: "Ali Demircan"),
                          title: textEditingController.text,
                          kanban: selectedKanban!,
                          id: UniqueKey().toString().substring(0, 7),
                          createdDate: DateTime.now(),
                          complatedTime: "-",
                        );
                        viewModel.addNewTask(task);
                      }
                    } else {
                      viewModel.updateTaskTitle(
                          widget.task!, textEditingController.text);
                    }

                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 1.sw,
                    padding: EdgeInsets.all(10.sp),
                    color: Colors.lightBlue,
                    child: Center(
                      child: TextStyleGenerator(
                        text: widget.task != null
                            ? AppStrings.saveTask
                            : AppStrings.addNewTask,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                16.h.verticalSpace,
                if (widget.task?.createdDate != null)
                  TextStyleGenerator(
                    text:
                        "Created Time : ${widget.task?.createdDate.toString().substring(5, 16)}",
                    color: Colors.white,
                  ),
                if (widget.task?.complatedTime != "" &&
                    widget.task?.complatedTime != null)
                  TextStyleGenerator(
                    text: "Complated Time : ${widget.task?.complatedTime}",
                    color: Colors.white,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
