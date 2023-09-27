import 'package:flutter/material.dart';

class Game1 extends StatefulWidget {
  const Game1({Key? key}) : super(key: key);

  @override
  State<Game1> createState() => _Game1State();
}

class _Game1State extends State<Game1> with TickerProviderStateMixin {
  late AnimationController _controller;
  Duration _elapsedTime = Duration.zero;
  bool _isRunning = false;
  bool _showPauseButton = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _start() {
    _controller.duration = const Duration(seconds: 10);
    _controller.reverse(
      from: _controller.value == 0.0 ? 1.0 : _controller.value,
    );
    _controller.addListener(() {
      setState(() {
        _elapsedTime = Duration(
          milliseconds: (_controller.value * 1000).floor(),
        );
        setState(() {
          _showPauseButton = true;
        });
      });
    });
    setState(() {
      _isRunning = true;
    });
  }

  void _pause() {
    _controller.stop();
    setState(() {
      _showPauseButton = false;

      double elapsedSeconds = _elapsedTime.inMilliseconds / 1000.0;

      if (elapsedSeconds == 500) {
        _showText("헉.. 정확한 500!! \n엄청난 순발력을 지니셨군요!?");
      } else if (elapsedSeconds >= 450 || elapsedSeconds <= 550) {
        _showText("아까워요!");
      } else {
        _showText("다시해보세요~");
      }
    });
  }

  void _showText(String text) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/game_3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "핫타이머 게임",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "정확히 500에 멈추면 성공!",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${_elapsedTime.inMilliseconds} 초',
              style: const TextStyle(fontSize: 40.0),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!_isRunning)
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: _start,
                    ),
                  ),
                if (_showPauseButton)
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.pause),
                      onPressed: _pause,
                    ),
                  ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Game1()),
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
    );
  }
}
