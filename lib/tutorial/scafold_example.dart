import 'package:flutter/material.dart';

class ScafoldExample extends StatelessWidget {
  const ScafoldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.green,
          elevation: 1,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Image(
                  image:
                  // NetworkImage('https://cbop.audubon.org/sites/default/files/styles/bean_wysiwyg_full_width/public/maple_2_0.jpg?itok=A4jeyFoH',
                  AssetImage('assets/images/Cat.jpg'),
                  // repeat:ImageRepeat.repeat
                ),
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text('Messages'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: Colors.green,
          elevation: 1,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Image(
                  image:
                  // NetworkImage('https://cbop.audubon.org/sites/default/files/styles/bean_wysiwyg_full_width/public/maple_2_0.jpg?itok=A4jeyFoH',
                  AssetImage('assets/images/Cat.jpg'),
                  // repeat:ImageRepeat.repeat
                ),
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text('Messages'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.lime,
          title: const Text('AppBar Demo eee'),
          // leading: IconButton(
          //   icon: const Icon(Icons.add_alert),
          //   tooltip: 'Show Snackbar',
          //   onPressed: () {
          //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
          //   },
          // ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: const Icon(Icons.add_alert),
          //     tooltip: 'Show Snackbar',
          //     onPressed: () {
          //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
          //     },
          //   ),
          //   IconButton(
          //     icon: const Icon(Icons.navigate_next),
          //     tooltip: 'Go to the next page',
          //     onPressed: () {
          //       Navigator.push(context, MaterialPageRoute<void>(
          //         builder: (BuildContext context) {
          //           return Scaffold(
          //             appBar: AppBar(
          //               title: const Text('Next page'),
          //             ),
          //             body: const Center(
          //               child: Text(
          //                 'This is the next page',
          //                 style: TextStyle(fontSize: 24),
          //               ),
          //             ),
          //           );
          //         },
          //       ));
          //     },
          //   ),
          // ],
        ),
        body: Container(
          color: Colors.grey,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          width: 500,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Container(
              color: Colors.amber,
              child: Container(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  textDirection: TextDirection.ltr,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      child: const Expanded(
                        child: Text(
                          'hosdadsdfgdthf',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      color: Colors.green,
                      child: const Expanded(
                        flex: 1,
                        child: Text(
                          'Flutters',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '3erf',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    // FlutterLogo(),
                    // Expanded(child: Text("Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.")),
                    // Icon(Icons.sentiment_very_satisfied),
                  ],
                ),
              )
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   mainAxisSize: MainAxisSize.max,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   textDirection: TextDirection.ltr,
            //   verticalDirection: VerticalDirection.down,
            //   children: <Widget>[
            //     // Text(
            //     //   'Deliver features faster',
            //     //   style: TextStyle(fontSize: 50),
            //     // ),
            //     // Text(
            //     //   'Craft beautiful UIs',
            //     //   style: TextStyle(fontSize: 50),
            //     // ),
            //     // FlutterLogo(
            //     //   size: 150,
            //     // ),
            //     SizedBox(
            //       child: ElevatedButton(
            //         style: const ButtonStyle(
            //             // backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
            //             ),
            //         onPressed: () {
            //           print("pressed");
            //         },
            //         onLongPress: () {
            //           print("pressed2");
            //         },
            //         child: const Column(
            //           children: [
            //             Icon(
            //               Icons.ac_unit,
            //               fill: 1,
            //               color: Colors.lightGreenAccent,
            //               weight: 1,
            //               size: 100,
            //               // semanticLabel: 'Text to announce in accessibility modes',
            //             ),
            //             // const Text('Enabled'),
            //           ],
            //         ),
            //       ),
            //     ),
            //     const Padding(
            //       padding: EdgeInsets.all(8.0),
            //       child: SizedBox(
            //         child: Image(
            //           image:
            //               // NetworkImage('https://cbop.audubon.org/sites/default/files/styles/bean_wysiwyg_full_width/public/maple_2_0.jpg?itok=A4jeyFoH',
            //               AssetImage('assets/images/cat.jpeg'),
            //           // repeat:ImageRepeat.repeat
            //         ),
            //         // fit:BoxFit.fitHeight,
            //       ),
            //     ),
            //     Placeholder(
            //       color: Colors.red,
            //       strokeWidth: 2,
            //       fallbackWidth: 100,
            //       fallbackHeight: 200,
            //       child: Image(
            //         image:
            //         // NetworkImage('https://cbop.audubon.org/sites/default/files/styles/bean_wysiwyg_full_width/public/maple_2_0.jpg?itok=A4jeyFoH',
            //         AssetImage('assets/images/cat.jpeg'),
            //         // repeat:ImageRepeat.repeat
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          elevation: 3,
          tooltip: 'Increment Counter',
          child: Icon(Icons.add),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
        ),
        // backgroundColor:Colors.white70 ,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat);
  }
}
