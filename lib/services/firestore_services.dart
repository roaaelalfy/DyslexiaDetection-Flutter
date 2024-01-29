import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final playersCollection = FirebaseFirestore.instance.collection('players');
  final adminsCollection = FirebaseFirestore.instance.collection('admins');

  Future<String> getUserId() async {
    final User? user = _auth.currentUser;
    return user?.uid ?? '';
  }

  String generatePlayerId(String adminId) {
    String timestamp = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    return '$adminId-$timestamp';
  }

  Future<void> addPlayer(Map<String, dynamic> fields, String playerId,
      String adminId) async {
    CollectionReference<Map<String, dynamic>> addedPlayersCollection =
    adminsCollection.doc(adminId).collection('addedPlayers');

      // Check if addedPlayers collection exists
    bool addedPlayersCollectionExists = await addedPlayersCollection.snapshots().isEmpty;

    // If it doesn't exist, create it
    if (!addedPlayersCollectionExists) {
      await addedPlayersCollection.add({});
    }
    try {
      await adminsCollection.doc(adminId).collection('addedPlayers')
          .doc(playerId)
          .set(fields);
    } catch (e) {
      print(e);
    }
  }

  Future<void> addScreenDataForPlayer(Map<String, dynamic> fields) async {
    final userId = await getUserId();
    await playersCollection.doc(userId).update(fields);
  }

  Future<void> addScreenDataForAddedPlayer(String playerId,
      Map<String, dynamic> fields) async {
    final adminId = await getUserId();
    await adminsCollection.doc(adminId).collection('addedPlayers')
        .doc(playerId)
        .update(fields);
  }

  // get all added players of a certain admin
  Future<List<Map<String, dynamic>>> getAllAddedPlayers(String adminId) async {
    try {
      // Fetch players based on adminId
      QuerySnapshot playersSnapshot = await
      adminsCollection
          .doc(adminId)
          .collection('addedPlayers')
          .get();

      // Extract relevant player details
      List<Map<String, dynamic>> playersList = playersSnapshot.docs
          .map((playerSnapshot) {
        return {
          'playerId': playerSnapshot['playerId'],
          'name': playerSnapshot['name'],
          'gender': playerSnapshot['gender'],
          'nativeLang': playerSnapshot['nativeLang'],
          'otherLang': playerSnapshot['otherLang'],
          'age': playerSnapshot['age'],
          'result': playerSnapshot['result'],
        };
      }).toList();
      return playersList;
    } catch (e) {
      print('Error getting players by admin ID: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getAllScreensDataOfAddedPlayer(
      String playerId) async {
    final adminId = await getUserId();
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await adminsCollection
          .doc(adminId)
          .collection('addedPlayers')
          .doc(playerId)
          .get();

      // Specify the order of fields dynamically based on currentScreen
      // [clicks1 , hits1, misses1,score1 , accuracy1,missrate1...clicks32,hits32,misses32,score32,accuracy32,missrate32]
      List<String> fieldOrder = List.generate(
        32, (index) =>
          ['clicks', 'hits', 'miss', 'score', 'accuracy', 'missrate']
              .expand((field) => [field + (index + 1).toString()]).toList(),
      ).expand((fields) => fields).toList();

      // Extract data from the snapshot in the specified order
      Map<String, dynamic> screenData = {};
      for (var field in fieldOrder) {
        screenData[field] = snapshot.data()![field];
      }

      // Add additional fields to the retrieved data
      screenData['gender'] = snapshot.data()!['gender'];
      screenData['nativeLang'] = snapshot.data()!['nativeLang'];
      screenData['otherLang'] = snapshot.data()!['otherLang'];
      screenData['age'] = snapshot.data()!['age'];
      screenData['result'] = snapshot.data()!['result'];

      // Print the retrieved data
      print("Retrieved Screen Data:");
      print(screenData);

      return screenData;
    } catch (error) {
      print("Error retrieving user data: $error");
      return null;
    }
  }

  Future<Map<String, dynamic>?> getAllScreensDataOfPlayer(String userId) async {
    try {
      DocumentReference<Map<String, dynamic>> userRef =
      FirebaseFirestore.instance.collection('players').doc(userId);

      DocumentSnapshot<Map<String, dynamic>> snapshot = await userRef.get();

      // Specify the order of fields dynamically based on currentScreen
      // [clicks1 , hits1, misses1,score1 , accuracy1,missrate1...clicks32,hits32,misses32,score32,accuracy32,missrate32]
      List<String> fieldOrder = List.generate(
        32, (index) =>
          ['clicks', 'hits', 'miss', 'score', 'accuracy', 'missrate']
              .expand((field) => [field + (index + 1).toString()]).toList(),
      ).expand((fields) => fields).toList();

      // Extract data from the snapshot in the specified order
      Map<String, dynamic> screenData = {};
      for (var field in fieldOrder) {
        screenData[field] = snapshot.data()![field];
      }

      // Add additional fields to the retrieved data
      screenData['gender'] = snapshot.data()!['gender'];
      screenData['nativeLang'] = snapshot.data()!['nativeLang'];
      screenData['otherLang'] = snapshot.data()!['otherLang'];
      screenData['age'] = snapshot.data()!['age'];
      screenData['result'] = snapshot.data()!['result'];

      // Print the retrieved data
      print("Retrieved Screen Data:");
      print(screenData);

      return screenData;
    } catch (error) {
      print("Error retrieving user data: $error");
      return null;
    }
  }

  Future<String?> getRolebyUserId(String userId) async {
    try {
      DocumentReference<Map<String, dynamic>> adminRef =
      adminsCollection.doc(userId);
      DocumentSnapshot<Map<String, dynamic>> adminDoc = await adminRef.get();

      if (adminDoc.exists) {
        return adminDoc['role'];
      } else {
        DocumentReference<Map<String, dynamic>> userRef =
        playersCollection.doc(userId);
        DocumentSnapshot<Map<String, dynamic>> userDoc = await userRef.get();
        if (userDoc.exists) {
          return userDoc['role'];
        } else {
          return null;
        }
      }
    } catch (error) {
      print("Error retrieving role: $error");
      return null;
    }
  }
}