import 'package:animated_dialog/animated_dialog.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text("Press me"),
              onPressed: (){
                showDialog(
                  context: context,
                  child: AnimatedDialog(
                    child: Text("Hello"),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    animationTime: Duration(milliseconds: 700),
                  )
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}