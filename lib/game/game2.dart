import 'dart:math';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class game2 extends StatefulWidget {
  const game2({Key? key}) : super(key: key);

  @override
  State<game2> createState() => _game2State();
}

// ignore: camel_case_types
class _game2State extends State<game2> with TickerProviderStateMixin {
  final List<TextEditingController> _controllers = [];
  late AnimationController _controller;
  double _rotationAngle = 0.0;
  final _random = Random();
  int _imageCount = 0;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _controller.dispose();
    super.dispose();
  }

  void _spinWheel() {
    setState(() {
      _rotationAngle = _random.nextDouble() * 360;
      _controller.reset();
      _controller.forward();
    });
  }

  void _addTextField() {
    if (_controllers.length < 8) {
      setState(() {
        _controllers.add(TextEditingController());
        _imageCount = _controllers.length;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controllers.add(TextEditingController());
    _controllers.add(TextEditingController()); // Initialize with 2 text fields
    _imageCount = _controllers.length;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RotationTransition(
                turns: Tween(begin: 0.0, end: _rotationAngle / 90)
                    .animate(_controller),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/roulette/$_imageCount.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: CustomPaint(
                      painter: TextCirclePainter(_controllers),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 20.0),
              const Icon(
                Icons.arrow_upward,
                size: 30,
              ),
              ElevatedButton(
                onPressed: _spinWheel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // 버튼 배경색
                  textStyle: const TextStyle(
                    fontSize: 20.0, // 텍스트 크기
                    fontWeight: FontWeight.bold, // 텍스트 굵기
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0), // 내부 간격
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 버튼 모양
                  ),
                ),
                child: const Text('확인'), // 버튼 텍스트
              ),
              const Text(
                "색깔을 생각하고 돌려주세요",
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ),
              for (var controller in _controllers)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: TextField(
                        controller: controller,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        maxLength: 5,
                      ),
                    ),
                  ],
                ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: _addTextField,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // 버튼 배경색
                    textStyle: const TextStyle(
                      fontSize: 20.0, // 텍스트 크기
                      fontWeight: FontWeight.bold, // 텍스트 굵기
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0), // 내부 간격
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // 버튼 모양
                    ),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (BuildContext context) => const game2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // 버튼 배경색
                  textStyle: const TextStyle(
                    fontSize: 20.0, // 텍스트 크기
                    fontWeight: FontWeight.bold, // 텍스트 굵기
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0), // 내부 간격
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 버튼 모양
                  ),
                ),
                child: const Text('초기화'), // 버튼 텍스트
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextCirclePainter extends CustomPainter {
  final List<TextEditingController> controllers;

  TextCirclePainter(this.controllers);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    double angleStep = 2 * pi / controllers.length;

    for (int i = 0; i < controllers.length; i++) {
      double angle = i * angleStep;

      // ignore: unused_local_variable
      double x = centerX + radius * cos(angle);
      // ignore: unused_local_variable
      double y = centerY + radius * sin(angle);

      // double textWidth = getTextWidth(controllers[i].text, 16.0);

      // TextSpan span = TextSpan(
      //   text: controllers[i].text,
      //   style: TextStyle(fontSize: 16.0, color: Colors.black),
      // );

      // TextPainter textPainter = TextPainter(
      //   text: span,
      //   textAlign: TextAlign.center,
      //   textDirection: TextDirection.ltr,
      // );

      // textPainter.layout(maxWidth: textWidth, minWidth: textWidth);
      // textPainter.paint(canvas, Offset(x - textWidth / 2, y + i * 30.0));
    }
  }

  double getTextWidth(String text, double fontSize) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(fontSize: fontSize),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
