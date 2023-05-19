// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // 위 코드는 문서에 없는 코드.. 바인딩 에러 뜸.
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }
//
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//
//     Widget titleSection = Container(
//
//       padding: const EdgeInsets.all(32),
//       child: Row(
//         children: [
//
//           Expanded(
//             /*1*/
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /*2*/
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: const Text(
//                     'Oeschinen Lake Campground',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   'Kandersteg, Switzerland',
//                   style: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           /*3*/
//           Icon(
//             Icons.star,
//             color: Colors.red[500],
//           ),
//           const Text('41'),
//           const FavoriteWidget(),
//         ],
//       ),
//     );
//
//
//     Color color = Theme.of(context).primaryColor;
//
//     Widget buttonSection = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//
//         // Padding(padding: EdgeInsets.symmetric(vertical:10)),
//         _buildButtonColumn(color, Icons.call, 'CALL'),
//         _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//         _buildButtonColumn(color, Icons.share, 'SHARE'),
//       ],
//     );
//
//     Widget textSection = const Padding(
//       padding: EdgeInsets.all(32),
//       child:
//       const Text('test click1',
//         softWrap: true,
//       ),
//
//     );
//     return MaterialApp(
//       title: 'Flutter layout Demo',
//       // 필수적으로 필요한 옵션 = home = 제일 먼저 나오는 페이지
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Sandy`s Demo ', style: TextStyle(color: Colors.amber),),
//         ),
//         body:
//         Container(
//           padding: EdgeInsets.symmetric(horizontal:20,vertical: 10 ),
//           color: Colors.green,
//           child: ListView(
//             children: [
//               titleSection,
//               buttonSection,
//               Image.asset(
//                 'images/lake.jpg',
//                 width: 600,
//                 height:240,
//                 fit:BoxFit.cover,
//               ),
//
//               textSection,
//
//               const TestWidget(),
//             ],
//           ),
//         ),
//
//       ),
//       // ),
//
//     );
//   }
//
//   Column _buildButtonColumn(Color color, IconData icon, String label) {
//
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//
//           margin: const EdgeInsets.only(top: 8),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
// class FavoriteWidget extends StatefulWidget {
//   const FavoriteWidget({super.key});
//
//   @override
//   State<FavoriteWidget> createState() => _FavoriteWidgetState();
// }
//
// class _FavoriteWidgetState extends State<FavoriteWidget> {
//   bool _isFavorited = true;
//   int _favoriteCount = 41;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(0),
//           child: IconButton(
//             padding: const EdgeInsets.all(0),
//             alignment: Alignment.centerRight,
//             icon: (_isFavorited
//                 ? const Icon(Icons.star)
//                 : const Icon(Icons.star_border)),
//             color: Colors.red[500],
//             onPressed: _toggleFavorite,
//           ),
//         ),
//         SizedBox(
//           width: 18,
//           child: SizedBox(
//             child: Text('$_favoriteCount'),
//           ),
//         ),
//       ],
//     );
//   }
//   void _toggleFavorite() {
//     setState(() {
//       if (_isFavorited) {
//         _favoriteCount -= 1;
//         _isFavorited = false;
//       } else {
//         _favoriteCount += 1;
//         _isFavorited = true;
//       }
//     });
//   }
//
//
//
// }
//
//
//
// class TestWidget extends StatefulWidget {
//   const TestWidget({Key? key}) : super(key: key);
//
//   @override
//   State<TestWidget> createState() => _TestWidgetState();
// }
//
// class _TestWidgetState extends State<TestWidget> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   final Stream<QuerySnapshot> _usersStream =
//   FirebaseFirestore.instance.collection('product').snapshots();
//
//
//   // final ref = FirebaseStorage.instance.ref().child('user_image').child(result.user.uid+ 'jpg');
//   // await ref.putFile(image).onComplete;
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }
//         print(snapshot.data!.docs.length);
//         return
//           Column(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data =
//               document.data()! as Map<String, dynamic>;
//               return ListTile(
//                 title: Text(data['key']),
//                 subtitle: Text(data['firstPicUrl']),
//                 // subtitle: Text(data['exam']),
//               );
//             }).toList(),
//           );
//       },
//     );
//   }
// }
