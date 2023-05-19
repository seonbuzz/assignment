import 'package:cloud_firestore/cloud_firestore.dart';

// 플러터에서 파이어베이스로 자료를 저장하고 불러올 때는 클래스로 하나의 자료형을 만들어서 데이터를 처리함.
// 이걸 편하게 해주는 플러그인 = Json to Dart 어느정도 실제 자료형에 맞게 수정은 필요함.


class FireModel {

  String? motto;
  Timestamp? date;
  DocumentReference? reference;


  // 생성자
  FireModel({
    this.motto,
    this.date,
    this.reference,
  });

// json => Object로 firestore에서 불러올 때
FireModel.fromJson(dynamic json, this.reference) {
  motto = json['motto'];
  date = json['date'];
}
FireModel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> snapshot)
  :this.fromJson(snapshot.data(), snapshot.reference);

FireModel.fromQuerySnapShot(
  QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
  : this.fromJson(snapshot.data(), snapshot.reference);

Map<String, dynamic> toJson(){

  final map = <String, dynamic>{};
  map['motto'] = motto;
  map['date'] = date;

  return map;
}


}

