import 'package:ui_flutter_course/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgMegaphone,
      activeIcon: ImageConstant.imgMegaphone,
      title: "All",
      type: BottomBarEnum.All,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCheckmarkBlueGray400,
      activeIcon: ImageConstant.imgCheckmarkBlueGray400,
      title: "Completed",
      type: BottomBarEnum.Completed,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68.v,
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: SizedBox(
              height: 40.v,
              width: 30.h,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].icon,
                    height: 30.adaptSize,
                    width: 30.adaptSize,
                    color: appTheme.indigo200,
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(bottom: 10.v),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 7.h,
                        top: 25.v,
                        right: 12.h,
                      ),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: CustomTextStyles.bodySmallIndigo200.copyWith(
                          color: appTheme.indigo200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            activeIcon: SizedBox(
              height: 44.v,
              width: 46.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].activeIcon,
                    height: 30.adaptSize,
                    width: 30.adaptSize,
                    color: appTheme.blueGray400,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      left: 7.h,
                      right: 9.h,
                      bottom: 14.v,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 29.v),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: CustomTextStyles.bodySmallBluegray400.copyWith(
                          color: appTheme.blueGray400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  All,
  Completed,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
