import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dutch1 extends StatefulWidget {
  const Dutch1({super.key});

  @override
  State<Dutch1> createState() => _Dutch1State();
}

class _Dutch1State extends State<Dutch1> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String result = '';
  String errorMessage = '';
  var f = NumberFormat('###,###,###,###');
  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void _performOperation() {
    int? num1 = int.tryParse(_controller1.text);
    int? num2 = int.tryParse(_controller2.text);

    if (num1 == null) {
      setState(() {
        errorMessage = '인원수를 입력해주세요.';
        result = '숫자만 입력할 수 있어요';
      });
      return;
    }

    if (num2 == null) {
      setState(() {
        errorMessage = '가격을 입력해주세요.';
        result = '';
      });
      return;
    }

    if (num1 > 99) {
      setState(() {
        errorMessage = '인원이 너무 많아요.';
        result = 'aa';
      });
      return;
    }
    // 널값 이중체킹 무시
    // ignore: unnecessary_null_comparison
    if (num1 != null && num2 != null) {
      int nNum = (num2 / num1).floor(); // 소수점내림 필수
      int npNum = num2 % num1;

      String formattedNNum = f.format(nNum);
      String formattedNum2 = f.format(num2);
      setState(() {
        errorMessage = '';
        result =
            '$num1명\n$formattedNum2원 나왔어요!\n\n\n 1명당 $formattedNNum원씩 입니다!';
        if (npNum != 0) {
          setState(() {
            errorMessage = '';
            result =
                '총 $num1명 입니다.\n$formattedNum2원 을 나눠야해요!\n\n\n 1명당 $formattedNNum원씩 입니다.\n\n금액이 딱 떨어지지 않아서\n한분이 $npNum원 더주세요!';
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/main1_1100x1860_2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "인원수로 나누기",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "나머지까지 정확히 나눌수 있어요",
                  style: TextStyle(fontSize: 25),
                ),
                const Text(
                  "인원수는 최대 99명입니다.",
                  style: TextStyle(fontSize: 15, color: Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Text(
                        "  인원수: ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          controller: _controller1,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: const InputDecoration(
                            hintText: '숫자만 입력하세요.', // 힌트 텍스트
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "   금액: ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextField(
                          controller: _controller2,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: const InputDecoration(
                            hintText: '숫자만 입력하세요.', // 힌트 텍스트
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _performOperation,
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
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    result,
                    textAlign: TextAlign.center,
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
