import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sandy/testpages/main_screen_two.dart';



class ImgWidget extends StatefulWidget {
  const ImgWidget({Key? key}) : super(key: key);

  @override
  State<ImgWidget> createState() => _ImgWidgetState();
}

class _ImgWidgetState extends State<ImgWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: (
      Image.asset("name")
      ),
    );
  }
}
// 테스트 위젯 (파이어 베이스 데이터 불러오기)
class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  void initState() {
    super.initState();
  }

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('product').snapshots();

  // final ref = FirebaseStorage.instance.ref().child('user_image').child(result.user.uid+ 'jpg');
  // await ref.putFile(image).onComplete;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
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
        return Column(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['key']),
              // subtitle: Text(data['imgPath']),
              // subtitle: Text(data['exam']),
            );
          }).toList(),
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      children: [
        FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
          padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
      ),
        child:
        const Text("시작하기"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreenTwo()),
          );
        },
      ),
    ]
      ),
    );
  }
}



