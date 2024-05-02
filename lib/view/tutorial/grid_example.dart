
import 'package:flutter/material.dart';

class GridExample extends StatelessWidget {
  const GridExample({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> stringList = [];
    for (int i = 0; i < 20; i++) {
      stringList.add("Item $i");
    }
    return Scaffold(
      body: Center(
        child:
        // GridView.count(
        //   padding: const EdgeInsets.all(8),
        //   crossAxisCount: 3, // number of items in each row
        //   mainAxisSpacing: 8.0, // spacing between rows
        //   crossAxisSpacing: 8.0, // spacing between columns
        //   children: [
        //     for (int i = 0; i < 20; i++)
        //       Container(
        //         color: Colors.amber,
        //         child: Center(
        //           child: Text(
        //             'Item $i',
        //           ),
        //         ),
        //       ),
        //   ],
        // ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
          ),
          padding: const EdgeInsets.all(8.0), // padding around the grid
          itemCount: stringList.length, // total number of items
          itemBuilder: (context, index) {
            return Container(
              color: Colors.amber,
              child: Center(
                child: Text(
                  stringList[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
