import 'package:ui_flutter_course/core/app_export.dart';
import 'package:ui_flutter_course/widgets/app_bar/appbar_leading_image.dart';
import 'package:ui_flutter_course/widgets/app_bar/appbar_title.dart';
import 'package:ui_flutter_course/widgets/app_bar/custom_app_bar.dart';
import 'package:ui_flutter_course/widgets/custom_elevated_button.dart';
import 'package:ui_flutter_course/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AddTodoScreen extends StatelessWidget {
  AddTodoScreen({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();

  TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 41.v),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: CustomTextFormField(
                          controller: titleController, hintText: "Title")),
                  SizedBox(height: 40.v),
                  Padding(
                      padding: EdgeInsets.only(left: 18.h, right: 12.h),
                      child: CustomTextFormField(
                          controller: detailController,
                          hintText: "Detail",
                          textInputAction: TextInputAction.done)),
                  SizedBox(height: 53.v),
                  CustomElevatedButton(
                      text: "ADD",
                      buttonTextStyle: theme.textTheme.titleLarge!,
                      onPressed: () {
                        onTapADD(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 51.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgTurnBackpageButton,
            margin: EdgeInsets.only(left: 26.h, top: 34.v, bottom: 37.v)),
        title:
            AppbarTitle(text: "Add Task", margin: EdgeInsets.only(left: 37.h)),
        styleType: Style.bgFill);
  }

  /// Navigates to the todoPageContainerScreen when the action is triggered.
  onTapADD(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.todoPageContainerScreen);
  }
}
