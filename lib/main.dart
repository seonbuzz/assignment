import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sandy/testpages/main_screen_two.dart';
import 'package:sandy/testpages/main_screen_one.dart';
import 'package:sandy/testpages/test3.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout Demo',
      // 필수적으로 필요한 옵션 = home = 제일 먼저 나오는 페이지
      home: Scaffold(
        resizeToAvoidBottomInset: false,  // 키보드가 올라와도 배경 이미지가 밀려올라가지 않음
        appBar: AppBar(

          title: const Text('Sandy`s Demo ', style: TextStyle(color: Colors.amber),),
        ),
          body:
              Container(
                padding: EdgeInsets.symmetric(horizontal:20,vertical: 10 ),
                color: Color.fromARGB(255, 255, 255, 255),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const ImgWidget(),
                  const MainScreen(),
                  // const FireStoreTest(),
                ],
               ),
                ),
          ),
    );
  }
}