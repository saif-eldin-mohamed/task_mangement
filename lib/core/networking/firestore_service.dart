import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   final FirebaseFirestore _firestore;

//   FirestoreService({FirebaseFirestore? firestore})
//       : _firestore = firestore ?? FirebaseFirestore.instance;

//   Future<void> addTask({
//     required String collectionPath,
//     required Map<String, dynamic> data,
//   }) async {
//     await _firestore.collection(collectionPath).add(data);
//   }

//   Stream<QuerySnapshot> getTask({
//     required String collectionPath,
//     required String field,
//   }) {
//     return _firestore
//         .collection(collectionPath)
//         .where(field)
//         .snapshots(includeMetadataChanges: true);
//   }

//   Future<void> deleteTask({
//     required String collectionPath,
//     required String docId,
//   }) async {
//     await _firestore.collection(collectionPath).doc(docId).delete();
//   }
//   Future<void> updateTask({
//     required String collectionPath,
//     required String docId,
//     required Map<String, dynamic> data,
//   }) async {
//     await _firestore.collection(collectionPath).doc(docId).update(data);
//   }
// }
class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<DocumentReference> addTask({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    // إعادة مرجع المستند بعد الإضافة
    return await _firestore.collection(collectionPath).add(data);
  }

  Stream<QuerySnapshot> getTask({
    required String collectionPath,
    required String field,
  }) {
    return _firestore
        .collection(collectionPath)
        .where(field)
        .snapshots(includeMetadataChanges: true);
  }

  Future<void> deleteTask({
    required String collectionPath,
    required String docId,
  }) async {
    await _firestore.collection(collectionPath).doc(docId).delete();
  }

  Future<void> updateTask({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collectionPath).doc(docId).update(data);
  }
}
