import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController1, _animationController2;
  late Animation<double> _animation1, _animation2;

  @override
  void initState() {
    super.initState();

    _animationController1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animationController2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation1 = Tween(begin: 0.0, end: 1.0).animate(_animationController1);
    _animation2 = Tween(begin: 0.0, end: 1.0).animate(_animationController2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _animationController1.forward();
            _animationController2.forward();
          },
          child: Icon(Icons.play_arrow),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                  height: 40,
                  child: RiveAnimation.network(
                      'https://cdn.rive.app/animations/vehicles.riv')),
              SizedBox(
                  height: 40,
                  child: RiveAnimation.network(
                      'https://cdn.rive.app/animations/vehicles.riv')),
              SizedBox(
                  height: 40,
                  child: RiveAnimation.network(
                      'https://cdn.rive.app/animations/vehicles.riv')),
              ScaleTransition(
                scale: _animation1,
                child: Image.network(
                    'https://images.unsplash.com/photo-1661956602139-ec64991b8b16?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=365&q=80'),
              ),
              FadeTransition(
                opacity: _animation2,
                child: Text('Welcometo the Animation Screen'),
              ),
            ],
          ),
        ));
  }
}
