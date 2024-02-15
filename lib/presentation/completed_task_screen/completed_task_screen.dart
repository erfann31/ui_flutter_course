import '../completed_task_screen/widgets/todolist_item_widget.dart';
import 'package:ui_flutter_course/core/app_export.dart';
import 'package:ui_flutter_course/presentation/todo_page/todo_page.dart';
import 'package:ui_flutter_course/widgets/app_bar/appbar_leading_image.dart';
import 'package:ui_flutter_course/widgets/app_bar/appbar_title.dart';
import 'package:ui_flutter_course/widgets/app_bar/custom_app_bar.dart';
import 'package:ui_flutter_course/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CompletedTaskScreen extends StatelessWidget {
  CompletedTaskScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray300,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 16.v),
                  _buildTodoList(context)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 47.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgTurnBackpageButton,
            margin: EdgeInsets.only(left: 22.h, top: 34.v, bottom: 37.v),
            onTap: () {
              onTapTurnBackPageButton(context);
            }),
        title: AppbarTitle(
            text: "Completed Task",
            margin: EdgeInsets.only(left: 41.h),
            onTap: () {
              onTapCompletedTask(context);
            }),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildTodoList(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.h),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16.v);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return TodolistItemWidget();
                })));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.All:
        return "/";
      case BottomBarEnum.Completed:
        return AppRoutes.todoPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.todoPage:
        return TodoPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the todoPageContainerScreen when the action is triggered.
  onTapTurnBackPageButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.todoPageContainerScreen);
  }

  /// Navigates to the todoPageContainerScreen when the action is triggered.
  onTapCompletedTask(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.todoPageContainerScreen);
  }
}
