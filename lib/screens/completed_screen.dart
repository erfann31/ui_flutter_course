///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:ui_flutter_course/main.dart';
import 'package:ui_flutter_course/widgets/todo_widget.dart';

class CompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd7d8ef),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Color(0xff9496d6),
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Completed Task",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 24,
              color: Color(0xffffffff),
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
            size: 24,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Color(0xffaeb2ea),
              shape: BoxShape.rectangle,
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              shrinkWrap: true,
              children: [
                TodoWidget(
                  showIconsRow: false,
                ),
                TodoWidget(
                  showIconsRow: false,
                ),
                TodoWidget(
                  showIconsRow: false,
                ),
                TodoWidget(
                  showIconsRow: false,
                ),
                TodoWidget(
                  showIconsRow: false,
                ),
                TodoWidget(
                  showIconsRow: false,
                ),
                TodoWidget(
                  showIconsRow: false,
                ),
                TodoWidget(
                  showIconsRow: false,
                ),
                TodoWidget(
                  showIconsRow: false,
                ),
                TodoWidget(
                  showIconsRow: false,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Transform.scale(
          scale: 1.3,
          child: FloatingActionButton(
            elevation: 0,
            shape: CircleBorder(),
            onPressed: () {
              // Add your onPressed logic here
            },
            backgroundColor: Color(0xff9193d2),
            child: Icon(Icons.add, color: Color(0xffffffff)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
