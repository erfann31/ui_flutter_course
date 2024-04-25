import 'package:flutter/material.dart';

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    value = text;
                  });
                },
                maxLines: 1,
                maxLength: 10,
                decoration: const InputDecoration(
                  fillColor: Colors.lightGreenAccent,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.clear),
                  labelText: 'Filled',
                  hintText: 'hint text',
                  helperText: 'supporting text',
                  filled: true,
                  border: OutlineInputBorder(),
                ),
                // obscureText: true,
                // obscuringCharacter: "*",
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.send,
                autocorrect: false,
                textCapitalization: TextCapitalization.characters,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                ),
                cursorColor: Colors.red,
                cursorRadius: const Radius.circular(16.0),
                cursorWidth: 6.0,
              ),
            ),
          ),
          Text(value)
        ],
      ),
    );
  }
}
