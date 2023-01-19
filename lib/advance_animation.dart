import 'package:flutter/material.dart';

class AdvancedAnimationExample extends StatefulWidget {
  @override
  _AdvancedAnimationExampleState createState() =>
      _AdvancedAnimationExampleState();
}

class _AdvancedAnimationExampleState extends State<AdvancedAnimationExample>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Animation Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'item-1',
              child: Image.network(
                  'https://images.unsplash.com/photo-1517694712202-14dd9538aa97'),
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  width: _animation.value,
                  height: _animation.value,
                  child: child,
                );
              },
              child: Image.network(
                  'https://images.unsplash.com/photo-1517694712202-14dd9538aa97'),
            ),
            SizedBox(height: 20),
            // StaggeredAnimation(
            //   controller: _controller,
            //   delay: Duration(milliseconds: 100),
            //   duration: Duration(milliseconds: 500),
            //   child: Text('Hello, World!'),
            // ),
          ],
        ),
      ),
    );
  }
}
