import 'package:flutter/material.dart';
import './CustomDialog.dart' as custom;

class AnimatedDialog extends StatefulWidget {
  final Widget child;
  final double width;
  final double height; //the max height the dialog will get
  final Color color;
  final bool changeToDialog;
  final BorderRadius borderRadius;
  final Gradient gradient;
  final Duration animationTime;
  AnimatedDialog({
    @required this.child,
    this.width,
    this.height,
    this.color,
    this.gradient,
    this.borderRadius,
    this.changeToDialog = false,
    this.animationTime,
  });

  @override
  _AnimatedDialogState createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  Animation transformAnimation,
      heightAnimation,
      widthAnimation,
      opacityAnimation;

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    
    animationController = AnimationController(
        duration: this.widget.animationTime ?? Duration(milliseconds: 700),
        vsync: this);

    transformAnimation = Tween(begin: 0.5, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.5, curve: Curves.linear)));

    heightAnimation = Tween(begin: 0.7, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, .9, curve: Curves.elasticOut)));

    widthAnimation = Tween(begin: 0.3, end: 1).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, .9, curve: Curves.elasticOut)));

    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(.7, 1.0, curve: Curves.easeIn)));

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.animationController.stop();
    this.animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final w = this.widget.width ?? MediaQuery.of(context).size.width * 0.6;
    final h = this.widget.height ?? MediaQuery.of(context).size.height * 0.3;
    bool changeCondition = false;

    
    return AnimatedBuilder(
        animation: this.animationController,
        builder: (ctx, _) {
          if(this.widget.changeToDialog){
            changeCondition = this.transformAnimation.value == 0;
            if(changeCondition) {
              this.animationController.stop();
            }
            
          }else {
            changeCondition = this.animationController.isCompleted;
          }

          double currentWidth = (w) * this.widthAnimation.value;
          double currentHeight = (h) * this.heightAnimation.value;
          return Transform(
              transform: Matrix4.translationValues(
                  0.0,
                  this.transformAnimation.value *
                      MediaQuery.of(context).size.height,
                  0.0),
              child: changeCondition && this.widget.changeToDialog ?
              Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: this.widget.borderRadius ??
                        BorderRadius.circular(20.0)),
                child:ClipRRect(
                  borderRadius:  this.widget.borderRadius ?? BorderRadius.circular(20.0),
                  child: this.widget.child
                )
              ):
              custom.Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: this.widget.borderRadius ??
                        BorderRadius.circular(20.0)),
                child: Container(
                  width: currentWidth,
                  height: currentHeight,
                  decoration: BoxDecoration(
                      color: this.widget.color,
                      borderRadius: this.widget.borderRadius ??
                          BorderRadius.circular(20.0)),
                  child: ClipRRect(
                    borderRadius: this.widget.borderRadius?? BorderRadius.circular(20.0),
                    child: Opacity(
                        opacity: this.opacityAnimation.value,
                        child: this.widget.child ?? Container()),
                  ),
                ) ,
              ));
        });
  }
}
