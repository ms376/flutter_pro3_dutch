// ignore: file_names
import 'package:flutter/material.dart';
import 'package:nbbang/game/game1.dart';
import 'package:nbbang/game/game2.dart';
import 'package:nbbang/game/game3.dart';

// ignore: camel_case_types
class Menu2_1screen extends StatelessWidget {
  const Menu2_1screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main2_1100x1860.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Game1()),
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
                child: const Text('순발력게임'), // 버튼 텍스트
              ),
              const SizedBox(height: 80.0), // 간격
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const game2()),
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
                child: const Text('룰렛 돌리기'), // 버튼 텍스트
              ),
              const SizedBox(height: 80.0), // 간격
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const game3()),
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
                child: const Text('주사위 돌리기'), // 버튼 텍스트
              ),
            ],
          ),
        ),
      ),
    );
  }
}
