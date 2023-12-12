import 'package:flutter/material.dart';

class Alart extends StatefulWidget {
  @override
  _Alart createState() => _Alart();
}

class _Alart extends State<Alart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the AlertDialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Are you sure you want to quit?'),
                  content: Text('This is the content of the alert dialog.'),
                  backgroundColor:
                      Colors.white, // Background color of the dialog
                  elevation: 8.0, // Elevation for the shadow
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Show Alert Dialog'),
        ),
      ),
    );
  }
}
