import 'package:ui_flutter_course/core/app_export.dart';
import 'package:ui_flutter_course/widgets/app_bar/appbar_leading_image.dart';
import 'package:ui_flutter_course/widgets/app_bar/appbar_title.dart';
import 'package:ui_flutter_course/widgets/app_bar/custom_app_bar.dart';
import 'package:ui_flutter_course/widgets/custom_elevated_button.dart';
import 'package:ui_flutter_course/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class EditTodoScreen extends StatelessWidget {
  EditTodoScreen({Key? key}) : super(key: key);

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
                  _buildTitle(context),
                  SizedBox(height: 40.v),
                  _buildDetail(context),
                  SizedBox(height: 53.v),
                  _buildRow(context),
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
            AppbarTitle(text: "Edit Task", margin: EdgeInsets.only(left: 37.h)),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildTitle(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: CustomTextFormField(
            controller: titleController, hintText: "Title"));
  }

  /// Section Widget
  Widget _buildDetail(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 12.h),
        child: CustomTextFormField(
            controller: detailController,
            hintText: "Detail",
            textInputAction: TextInputAction.done));
  }

  /// Section Widget
  Widget _buildUpdateButton(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            text: "Update",
            margin: EdgeInsets.only(right: 23.h),
            onPressed: () {
              onTapUpdateButton(context);
            }));
  }

  /// Section Widget
  Widget _buildCancelButton(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            text: "Cancel",
            margin: EdgeInsets.only(left: 23.h),
            onPressed: () {
              onTapCancelButton(context);
            }));
  }

  /// Section Widget
  Widget _buildRow(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildUpdateButton(context), _buildCancelButton(context)]);
  }

  /// Navigates to the todoPageContainerScreen when the action is triggered.
  onTapUpdateButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.todoPageContainerScreen);
  }

  /// Navigates to the todoPageContainerScreen when the action is triggered.
  onTapCancelButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.todoPageContainerScreen);
  }
}
