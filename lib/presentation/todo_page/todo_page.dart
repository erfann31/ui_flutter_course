import '../todo_page/widgets/todocomponent_item_widget.dart';
import 'package:ui_flutter_course/core/app_export.dart';
import 'package:ui_flutter_course/widgets/app_bar/appbar_title.dart';
import 'package:ui_flutter_course/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ui_flutter_course/widgets/app_bar/custom_app_bar.dart';
import 'package:ui_flutter_course/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray300,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillGray,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 22.v),
                  _buildTodoComponent(context),
                  Spacer()
                ])),
            floatingActionButton: _buildFloatingActionButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title:
            AppbarTitle(text: "TODO APP", margin: EdgeInsets.only(left: 19.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgVector,
              margin: EdgeInsets.fromLTRB(21.h, 17.v, 21.h, 25.v))
        ],
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildTodoComponent(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 21.v);
            },
            itemCount: 5,
            itemBuilder: (context, index) {
              return TodocomponentItemWidget(onTapImgEditImage: () {
                onTapImgEditImage(context);
              });
            }));
  }

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(
        height: 70,
        width: 70,
        backgroundColor: appTheme.indigo200,
        child: CustomImageView(
            imagePath: ImageConstant.imgPlus, height: 35.0.v, width: 35.0.h));
  }

  /// Navigates to the editTodoScreen when the action is triggered.
  onTapImgEditImage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editTodoScreen);
  }
}
