import 'dart:math';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class game3 extends StatefulWidget {
  const game3({super.key});

  @override
  State<game3> createState() => _game3State();
}

// ignore: camel_case_types
class _game3State extends State<game3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/game_1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          children: [
            Padding(padding: EdgeInsets.all(100)),
            Text(
              "랜덤주사위",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "1부터 12까지 동일한확률로 나옵니다!!",
              style: TextStyle(fontSize: 20),
            ),
            Center(
              child: WebDiceContent(),
            ),
          ],
        ),
      ),
    );
  }
}

class WebDiceContent extends StatefulWidget {
  const WebDiceContent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WebDiceContentState createState() => _WebDiceContentState();
}

class _WebDiceContentState extends State<WebDiceContent> {
  int diceValue = 1;
  bool loading = false; // 추가: 로딩 상태를 나타내는 변수

  // 추가: 비동기 함수로 주사위 굴리기 구현
  Future<void> rollDice(int initialValue) async {
    setState(() {
      loading = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    int randomDiceValue = Random().nextInt(6) + 1;

    setState(() {
      diceValue = randomDiceValue + initialValue; // 기존 주사위 값에 새로운 값을 더함
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20.0),
        DiceRollButton(
          onRoll: (value) {
            rollDice(value); // 주사위 값 전달
          },
        ),
        const SizedBox(height: 20.0),
        // 로딩 상태에 따라 다이스 이미지 또는 로딩 이미지를 표시
        loading
            ? const CircularProgressIndicator()
            : DiceResult(diceValue: diceValue),
      ],
    );
  }
}

class DiceRollButton extends StatelessWidget {
  final Function(int) onRoll; // 추가: 콜백 함수

  const DiceRollButton({super.key, required this.onRoll}); // 추가: 생성자로 콜백 함수 받음

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        int randomDiceValue = Random().nextInt(6) + 1;
        onRoll(randomDiceValue); // 콜백 호출
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
      child: const Text('굴리기'),
    );
  }
}

class DiceResult extends StatelessWidget {
  final int diceValue; // 주사위 숫자를 나타내는 변수

  // 생성자에서 diceValue를 받도록 수정
  const DiceResult({super.key, required this.diceValue});

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/dice/$diceValue.png';

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        imagePath,
        width: 50.0,
        height: 50.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
