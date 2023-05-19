import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sandy/firemodel.dart';

class FireService{

  // 싱글톤 패턴
  static final FireService _fireService = FireService._internal();
  factory FireService() => _fireService;
  FireService._internal();

// Create
Future CreateMemo(Map<String, dynamic> json) async{
  // 초기화
  await FirebaseFirestore.instance.collection("memo").add(json);

}

// TextButton(
//   onPressed: () async {
//     FireModel _fireModel = FireModel(
//       motto: _inputController.text, date: Timestamp.now());

//     await FireService().CreateMemo(_fireModel.toJson());  
//   },
//   child: const Icon(Icons.send)),

 }