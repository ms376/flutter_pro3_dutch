import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dutch2 extends StatefulWidget {
  const Dutch2({super.key});

  @override
  State<Dutch2> createState() => _Dutch2State();
}

class _Dutch2State extends State<Dutch2> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  String result = '';
  String errorMessage = '';
  var f = NumberFormat('###,###,###,###');
  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  void _performOperation() {
    int? num1 = int.tryParse(_controller1.text);
    int? num2 = int.tryParse(_controller2.text);
    int? num3 = int.tryParse(_controller3.text);

    if (num1 == null) {
      setState(() {
        errorMessage = '인원수를 입력해주세요.';
        result = '숫자만 입력할 수 있어요.';
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
    if (num3 == null) {
      setState(() {
        errorMessage = '회비를 입력해주세요.';
        result = '';
      });
    }

    if (num1 > 99) {
      setState(() {
        errorMessage = '인원이 너무 많아요.';
        result = '';
      });
      return;
    }
    if (num2 > num3!) {
      String formattedNum2 = f.format(num2 - num3);
      int npNum = (num2 - num3) % num1;
      int asd = ((num2 - num3) / num1).floor(); // 소수점내림계산
      String formattedNNum3 = f.format(asd);
      setState(() {
        errorMessage = '';
        result =
            '회비가 남았어요!\n$num1명이서 $formattedNum2원을 나누세요!\n그러면 1명당 $formattedNNum3원이에요~';
        if ((num2 - num3) % num1 != 0) {
          setState(() {
            errorMessage = '';
            result =
                '회비가 남았어요!\n\n$num1명이서 $formattedNum2원을 나누세요!\n그러면 1명당 $formattedNNum3원이고,$npNum원이남아요.';
          });
        }
      });
    }
    // 널값 이중체킹 무시
    // ignore: unnecessary_null_comparison
    if (num1 != null && num2 != null && num3 != null && num3 > num2) {
      int nNum = ((num3 - num2) / num1).floor();
      int npNum = (num3 - num2) % num1;
      int asd = num3 - num2;
      String formattedNNum = f.format(nNum);
      String formattedNum2 = f.format(num2);
      String formattedNum3 = f.format(asd);

      setState(() {
        errorMessage = '';
        result =
            '$num1명\n$formattedNum2원 나왔어요!\n\n\n 1명당 $formattedNNum원씩 입니다!';
        if ((num3 - num2) % num1 != 0) {
          setState(() {
            errorMessage = '';
            result =
                '총 $num1명 입니다.\n$formattedNum3원 을 나눠야해요!\n\n\n 1명당 $formattedNNum원씩 입니다.\n\n금액이 딱 떨어지지 않아서\n한분이 $npNum원 더주세요!';
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
                  "회비 초과금액 나누기",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "회비보다 결제금액이 많거나 적을때 나눌 수 있어요!",
                  style: TextStyle(fontSize: 15),
                ),
                const Text(
                  "인원수는 최대 99명입니다.",
                  style: TextStyle(fontSize: 15, color: Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Row(
                    children: [
                      const Text("  인원수: "),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          controller: _controller1,
                          keyboardType: TextInputType.number,
                          maxLength: 2, // 최대2글자
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      const Text("총 결제가격: "),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextField(
                          controller: _controller3,
                          keyboardType: TextInputType.number,
                          maxLength: 10, // 최대10글자
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      const Text("회비: "),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextField(
                          controller: _controller2,
                          keyboardType: TextInputType.number,
                          maxLength: 10, // 최대10글자
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
