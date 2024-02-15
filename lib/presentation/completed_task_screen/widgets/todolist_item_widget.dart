import 'package:ui_flutter_course/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodolistItemWidget extends StatelessWidget {
  const TodolistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 21.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TODO TITLE",
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 4.v),
          Text(
            "TODO SUB TITLE",
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
