import 'dart:ui';
import 'package:sandy/testpages/main_screen_three.dart';
import 'package:flutter/material.dart';


//메인스크린2는 데이터를 넣지 않은 단순한 코드
class MainScreenTwo extends StatelessWidget {
  const MainScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sandy`s Demo ',
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: Stack(children: [
        Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.womansense.co.kr/upload/woman/article/202103/thumb/47622-447515-sample.jpg'),
                  fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            )),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding:
                    EdgeInsets.symmetric(vertical:5, horizontal: 5),
                  height: 150,
                  width:10,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),

                    child: Center(
                      child: const Text(
                        "당신이 추천받고 싶은 향수는?",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )),


              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber),
                    // padding: MaterialStateProperty.all<EdgeInsets>(
                    // EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
                  ),
                  child: const Text("Next Click 1"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreenTrd()),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber),
                  ),
                  child: const Text("Next Click 2"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreenTrd()),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.cyan),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
                  ),
                  child: const Text("이전"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ]),
      ]),
    );
  }
}
