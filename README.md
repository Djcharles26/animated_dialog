# animated_dialog

Dialogs without constraints, letting us set any width and height, this is very useful
to animate it in a beautiful way.

## Getting Started

This is a very useful and powerful project,

### To start create a showDialog function adding our AnimatedDialog Widget
```dart
  showDialog(context: context,
    child: AnimatedDialog(
      width: w*0.8, //final width of the dialog
      height: h*0.6, //final height of the dialog
      durationTime: Duration(seconds: 1),
      color: mainWhite,
      borderRadius: BorderRadius.circular(20.0),
      child: Center(
        child: Container(
          child: Text("Hello"),
        ),
      ),
    )
  );
```

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
