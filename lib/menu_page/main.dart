import 'package:flutter/material.dart';
import 'package:nbbang/menu_page/menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GestureDetector(
        onTap: () {
          // 화면을 터치하면 다음 페이지로 이동
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Menu1screen(),
            ),
          );
        },
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // 이미지 중앙 배치
              Image.asset(
                'assets/images/main.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),

              // 텍스트
              const Positioned(
                bottom: 30.0, // 이미지 내에서의 위치 조정 (아래로부터의 거리)
                child: Text(
                  '아무곳이나 클릭하세요',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
