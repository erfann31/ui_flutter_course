import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> stringList = [];
    for (int i = 0; i < 20; i++) {
      stringList.add("Item $i");
    }
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Scaffold(
          body: stringList.isNotEmpty
              ? ListView.builder(
                  itemCount: stringList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(12),
                            color: Colors.lightGreenAccent,
                          ),
                          height: 40,
                          child: Center(
                            child: Text('Item ${stringList[index]}'),
                          ),
                        ),
                      ),
                    );
                  },
                )
              // ListView(
              //     padding: EdgeInsets.all(20.0),
              //     children: <Widget>[
              //       AspectRatio(
              //         aspectRatio: 1.5,
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Image.asset(
              //             fit: BoxFit.fill,
              //             'assets/images/cat.jpeg',
              //           ),
              //         ),
              //       ),
              //       AspectRatio(
              //         aspectRatio: 1.5,
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Image.asset(
              //             fit: BoxFit.fill,
              //             'assets/images/Cat.jpg',
              //           ),
              //         ),
              //       ),
              //     ],
              //   )
              : const Center(child: CircularProgressIndicator()),
        ),
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
        Container(
          width: 90,
          height: 90,
          color: Colors.green,
        ),
        Container(
          width: 80,
          height: 80,
          color: Colors.blue,
        ),
      ],
    );
  }
}
