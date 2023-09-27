import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dutch3 extends StatefulWidget {
  const Dutch3({super.key});

  @override
  State<Dutch3> createState() => _Dutch3State();
}

class _Dutch3State extends State<Dutch3> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  String result = '';
  String errorMessage = '';
  var f = NumberFormat('###,###,###,###');
  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  void _performOperation() {
    int? num1 = int.tryParse(_controller1.text);
    int? num2 = int.tryParse(_controller2.text);
    int? num3 = int.tryParse(_controller3.text);
    int? num4 = int.tryParse(_controller4.text);

    if (num1 == null) {
      setState(() {
        errorMessage = '총 인원을 입력해주세요.';
        result = '숫자만 입력할 수 있어요.';
      });
      return;
    }

    if (num2 == null) {
      setState(() {
        errorMessage = '술 안먹은 인원을 입력해주세요.';
        result = '숫자만 입력할 수 있어요.';
      });
      return;
    }
    if (num3 == null) {
      setState(() {
        errorMessage = '총 비용을 입력해주세요\n(음식+술).';
        result = '숫자만 입력할 수 있어요.';
      });
    }
    if (num4 == null) {
      setState(() {
        errorMessage = '술값을 입력해주세요\n(술값만).';
        result = '숫자만 입력할 수 있어요.';
      });
    }

    if (num1 > 99 || num2 > 99) {
      setState(() {
        errorMessage = '인원이 너무 많아요.';
        result = '';
      });
      return;
    }
    if (num1 < num2) {
      setState(() {
        errorMessage = '총인원보다 술안먹은 인원이 더 많아요\n다시입력해주세요..';
        result = '';
      });
      return;
    }
    if (num3! < num4!) {
      setState(() {
        errorMessage = '술값이 총 비용보다 더 많아요\n다시입력해주세요..';
        result = '';
      });
      return;
    }
    if (num1 >= num2 && num3 >= num4) {
      int totalP = num1; // 총 인원
      // ignore: non_constant_identifier_names
      int Ndrink = num2; // 술 안먹은인원
      int totalC = num3; // 총 비용
      // ignore: non_constant_identifier_names
      int Odrink = num4; // 술 값만
      int o = totalP - Ndrink;

      double okgo = (Odrink / (totalP - Ndrink)) +
          ((totalC - Odrink) / totalP); // 술마신사람인당금액
      double nope = ((totalC - Odrink) / totalP); // 술안마신사람인당금액

      // 소숫점 버림
      int nno = nope.floor();
      int okg = okgo.floor();

      String okgo2 = f.format(okg);
      String nope2 = f.format(nno);

      setState(() {
        errorMessage = '비용이 인원수대로 정확히 나누어 져요!';
        result = '술마신사람은 인당 $okgo2원 입니다.\n술 안마신사람은 인당$nope2원 입니다.';

        // 값이 정확히 나누어지지않고 나머지가 있을때
        // ignore: unrelated_type_equality_checks
        if (nope2 * Ndrink + okgo2 * o != totalC) {
          int remain = totalC - ((nno * Ndrink) + (okg * o));
          setState(() {
            errorMessage = '비용이 인원수대로 정확히 나눠지지 않습니다.\n$remain원을 한분이 더 내주세요.';
            result = '술마신사람은 인당 $okgo2원 입니다.\n술 안마신사람은 인당 $nope2원 입니다.';
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
                  "일정금액 빼고 나누기",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "술 안드신분이 있다면 사용해보세요",
                  style: TextStyle(fontSize: 20),
                ),
                const Text(
                  "인원수는 최대 99명입니다.",
                  style: TextStyle(fontSize: 15, color: Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10),
                  child: Row(
                    children: [
                      const Text("총 인원 : "),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          controller: _controller1,
                          keyboardType: TextInputType.number,
                          maxLength: 2,
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
                      const Text("술 안먹은 인원: "),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          controller: _controller2,
                          keyboardType: TextInputType.number,
                          maxLength: 2,
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
                      const Text("총 비용\n(음식+술): "),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextField(
                          controller: _controller3,
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
                  padding: const EdgeInsets.only(left: 8, top: 8, bottom: 20),
                  child: Row(
                    children: [
                      const Text("술값만\n(술): "),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextField(
                          controller: _controller4,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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