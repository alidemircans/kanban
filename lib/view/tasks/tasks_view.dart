import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban/core/di/locator.dart';
import 'package:kanban/core/ui_kit/text/text_withgooglefonts_widet.dart';
import 'package:kanban/helper/app_strings.dart';
import 'package:kanban/helper/color_helper.dart';
import 'package:kanban/model/task.dart';
import 'package:kanban/view/tasks/widgets/task_card_widget.dart';
import 'package:kanban/view/tasks/widgets/task_crud_widget.dart';
import 'package:kanban/view/tasks/widgets/task_tabbar_item.dart';
import 'package:kanban/view_model/tasks/task_view_model.dart';
import 'package:provider/provider.dart';

class TasksView extends StatefulWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, value, child) {
        return DefaultTabController(
          length: tabController.length,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorHelper.taskContainerBackColor,
              onPressed: onAddNewTask,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            appBar: _AppBar(
              controller: tabController,
              tabs: [
                TabbarTitleWidget(
                  title: AppStrings.todo.toUpperCase(),
                  count: value.getTodoList.length,
                ),
                TabbarTitleWidget(
                  title: AppStrings.inProgress.toUpperCase(),
                  count: value.getInProgressList.length,
                ),
                TabbarTitleWidget(
                  title: AppStrings.done.toUpperCase(),
                  count: value.getDoneList.length,
                ),
              ],
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                Container(
                  color: Colors.black,
                  child: ListView.builder(
                    itemCount: value.getTodoList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => onEditTask(value.getTodoList[index]),
                        child: TaskCardWidget(
                          task: value.getTodoList[index],
                          onStepPressed: () =>
                              onStepPressed(value.getTodoList[index]),
                          onUserPressed: () =>
                              onUserPressed(value.getTodoList[index]),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: ListView.builder(
                    itemCount: value.getInProgressList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => onEditTask(value.getInProgressList[index]),
                        child: TaskCardWidget(
                          task: value.getInProgressList[index],
                          onStepPressed: () =>
                              onStepPressed(value.getInProgressList[index]),
                          onUserPressed: () =>
                              onUserPressed(value.getInProgressList[index]),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: ListView.builder(
                    itemCount: value.getDoneList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => onEditTask(value.getDoneList[index]),
                        child: TaskCardWidget(
                          task: value.getDoneList[index],
                          onStepPressed: () =>
                              onStepPressed(value.getDoneList[index]),
                          onUserPressed: () =>
                              onUserPressed(value.getDoneList[index]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  onStepPressed(task) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return ChangeNotifierProvider.value(
            value: locator<TaskViewModel>(),
            child: Consumer<TaskViewModel>(
              builder: (context, value, child) {
                return Container(
                  height: 200.h,
                  width: 1.sw,
                  color: ColorHelper.taskContainerBackColor,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.steps.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            locator<TaskViewModel>()
                                .changeTaskStep(task, value.steps[index]);
                          },
                          title: TextStyleGenerator(
                            text: value.steps[index].toUpperCase(),
                            color: Colors.white,
                          ),
                        );
                      }),
                );
              },
            ),
          );
        });
  }

  onAddNewTask() {
    return showDialog(
        context: context,
        builder: (context) {
          return TaskCrudWidget();
        });
  }

  onEditTask(TaskModel task) {
    return showDialog(
        context: context,
        builder: (context) {
          return TaskCrudWidget(
            task: task,
          );
        });
  }

  onUserPressed(task) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return ChangeNotifierProvider.value(
            value: locator<TaskViewModel>(),
            child: Consumer<TaskViewModel>(
              builder: (context, value, child) {
                return Container(
                  height: 200.h,
                  width: 1.sw,
                  color: ColorHelper.taskContainerBackColor,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            locator<TaskViewModel>()
                                .changeTaskAssinged(task, value.users[index]);
                          },
                          title: Row(
                            children: [
                              CircleAvatar(
                                child: TextStyleGenerator(
                                  text: value.users[index].userName
                                      .substring(0, 1),
                                  color: Colors.white,
                                ),
                              ),
                              8.w.horizontalSpace,
                              TextStyleGenerator(
                                text: value.users[index].userName.toUpperCase(),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        );
                      }),
                );
              },
            ),
          );
        });
  }
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  TabController controller;
  List<Widget> tabs;
  _AppBar({required this.controller, required this.tabs, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: TextStyleGenerator(
        text: AppStrings.appBarTitle,
        color: Colors.white,
      ),
      elevation: 0,
      bottom: TabBar(
        indicatorColor: Colors.black,
        indicatorPadding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: .01,
        controller: controller,
        isScrollable: true,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120.h);
}
