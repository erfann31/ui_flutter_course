import 'package:flutter/material.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.amber,
                  padding: EdgeInsets.all(20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(12),
                    ),
                  ),
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
              FilledButton(
                onPressed: () {
                  print("FilledButton");
                },
                child: const Text('Filled'),
              ),
              FilledButton.tonal(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Awesome Snackbar!'),
                        // action: SnackBarAction(
                        //   label: 'Action',
                        //   onPressed: () {
                        //     // Code to execute.
                        //   },
                        // ),
                      ),
                    );
                  },
                  child: const Text('Filled Tonal')),
              OutlinedButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('AlertDialog Title'),
                      content: const Text('AlertDialog description'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Outlined'),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 5.0, color: Colors.blue),
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('Text')),
              IconButton(onPressed: () {}, icon: Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}
