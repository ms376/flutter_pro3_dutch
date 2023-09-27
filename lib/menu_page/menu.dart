import 'package:flutter/material.dart';
import 'package:nbbang/menu_page/menu1-1.dart';
import 'package:nbbang/menu_page/menu2-1.dart';

class Menu1screen extends StatelessWidget {
  const Menu1screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/menu_back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Menu1_1screen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // 버튼 배경색
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
                    child: const Text('더치페이'), // 버튼 텍스트
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "어느상황에서도 부담을 나누어요.",
                    style: TextStyle(fontSize: 18.0, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 240.0), // 간격
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Menu2_1screen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo, // 버튼 배경색
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
                    child: const Text('랜덤 뽑기 게임'), // 버튼 텍스트
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "공정하고 투명한 랜덤게임",
                    style: TextStyle(fontSize: 18.0, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
