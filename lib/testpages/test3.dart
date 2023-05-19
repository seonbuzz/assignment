import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class FireStoreTest extends StatefulWidget {
  const FireStoreTest({Key? key}) : super(key: key);

  @override
  State<FireStoreTest> createState() => _FireStoreTestState();
}

class _FireStoreTestState extends State<FireStoreTest> {
  @override
  void initState() {
    super.initState();
  }

  final CollectionReference product =
  FirebaseFirestore.instance.collection('product');

  final Stream<QuerySnapshot> productStream =
  FirebaseFirestore.instance.collection('product').snapshots();

  // add
  Future<void> addProduct() async {
    product
        .add({
      'testKey1': 'testValue1',
      'testKey2': 'testValue2',
      'title': '제목2',
      'id': '2',
    })
        .then((value) => print('addProduct 성공!'))
        .catchError((e) => print('addProduct error : $e'));
  }

  // delete
  Future<void> deleteProductItem(String documentId) async {
    product
        .doc(documentId)
        .delete()
        .then((value) => print('deleteProductItem : 성공'))
        .catchError((e) => print('deleteProductItem error: $e'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: StreamBuilder<QuerySnapshot>(
            stream: productStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('error'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData)
                return const Center(child: Text('no data'));
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
                  return Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ListTile(
                          title: Text(data['key']),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          child: const Text('삭제'),
                          onPressed: () => deleteProductItem(document.id),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              );
            },
          ),
        ),
        TextButton(
          child: const Text('추가 버튼'),
          onPressed: () => addProduct(),
        ),
      ],
    );
  }
}