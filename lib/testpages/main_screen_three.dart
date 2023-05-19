import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sandy/testpages/main_screen_two.dart';
import 'package:sandy/testpages/recycle_widget.dart';
import 'package:flutter/material.dart';


//파이어베이스
class MainScreenTrd extends StatefulWidget {
  const MainScreenTrd({Key? key}) : super(key: key);

  @override
  State<MainScreenTrd> createState() => _MainScreenTrdState();
}

class _MainScreenTrdState extends State<MainScreenTrd> {
  @override
  void initState() {
    super.initState();
  }

  final Stream<QuerySnapshot> _userStream =
  FirebaseFirestore.instance.collection('question').snapshots();

  final Stream<QuerySnapshot> _userAnswerStream =
  FirebaseFirestore.instance.collection('answer').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sandy`s Demo ',
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/advices/167143956264537534.jpeg?w=960&h=1920&c=c'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _userStream,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              print(snapshot.connectionState);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              print(snapshot.data!.docs.length);
              if (!snapshot.hasData) return Text("data");

              // 파이어베이스 데이터를 가져온 뒤 첫 번째 문서의 'key' 필드 값을 가져옴
              final firebaseData = snapshot.data!.docs;
              final firebaseKey = (firebaseData[0].data()! as Map<String, dynamic>)['q1'];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(

                    height: 150,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    // child: Padding(
                    //   padding: const EdgeInsets.all(0.0),
                      child:
                      Center(
                        child:
                        Text(
                          firebaseKey, // 파이어베이스 데이터를 출력
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    // ),
                  ),

                  //버튼 1
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                      ),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: _userAnswerStream,
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (!snapshot.hasData) {
                            return const Text("No data available");
                          }

                          // 파이어베이스 데이터를 가져온 뒤 원하는 필드 값 사용
                          final firebaseData = snapshot.data!.docs;
                          final firebaseKey = (firebaseData[0].data()! as Map<String, dynamic>)['a1'];

                          return Text(
                            firebaseKey,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        },
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SurveyPage()),
                        );
                      },
                    ),
                  ),
                  //버튼 2
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                      ),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: _userAnswerStream,
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (!snapshot.hasData) {
                            return const Text("No data available");
                          }

                          // 파이어베이스 데이터를 가져온 뒤 원하는 필드 값 사용
                          final firebaseData = snapshot.data!.docs;
                          final firebaseKey = (firebaseData[0].data()! as Map<String, dynamic>)['a2'];

                          return Text(
                            firebaseKey,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        },
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        ),
                      ),
                      child: const Text("이전"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
