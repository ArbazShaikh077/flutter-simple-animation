import 'package:flutter/material.dart';
import 'package:flutter_animation/advance_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationScreen(),
    );
  }
}

class SimpleAnimation extends StatefulWidget {
  const SimpleAnimation({super.key});

  @override
  State<SimpleAnimation> createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Simple Animation"),
          centerTitle: true,
        ),
        body: Center(
          child: GestureDetector(
            onTap: _toggleExpanded,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: _isExpanded ? 200 : 100,
              width: _isExpanded ? 200 : 100,
              color: _isExpanded ? Colors.red : Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

class ComplexAnimation extends StatefulWidget {
  const ComplexAnimation({super.key});

  @override
  State<ComplexAnimation> createState() => _ComplexAnimationState();
}

class _ComplexAnimationState extends State<ComplexAnimation> {
  bool _isVisible = true;
  double _animatedOpacity = 1;
  double _animatedPadding = 0;
  double _leftPosition = 0;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
      _animatedOpacity = _isVisible ? 1 : 0;
      _animatedPadding = _isVisible ? 0 : 20;
      _leftPosition = _isVisible ? 0 : 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex Animation"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: _toggleVisibility,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          opacity: _animatedOpacity,
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(_animatedPadding),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  left: _leftPosition,
                  right: _leftPosition,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
