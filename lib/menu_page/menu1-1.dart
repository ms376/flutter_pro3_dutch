// ignore: file_names
import 'package:flutter/material.dart';
import 'package:nbbang/dutch/dutch1.dart';
import 'package:nbbang/dutch/dutch2.dart';
import 'package:nbbang/dutch/dutch3.dart';

// ignore: camel_case_types
class Menu1_1screen extends StatelessWidget {
  const Menu1_1screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main1_1100x1860.png'),
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
                    MaterialPageRoute(builder: (context) => const Dutch1()),
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
                child: const Text('공정하게 인원수로 나누기'), // 버튼 텍스트
              ),
              const SizedBox(height: 10.0),
              const Text(
                "(평화롭게 인원수로 나누자!)",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),

              const SizedBox(height: 50.0), // 간격

              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Dutch2()),
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
                    child: const Text('회비 초과금액 나누기!'), // 버튼 텍스트
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "(회비보다 돈이 더 나왔거나,남았을때!!)",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 50.0), // 간격
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Dutch3()),
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
                    child: const Text('술 안마신사람 따로계산~'), // 버튼 텍스트
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "(혹시 술자리에 술을 안마신사람이 있다면?)",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
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
