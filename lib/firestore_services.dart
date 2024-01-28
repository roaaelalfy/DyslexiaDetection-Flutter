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
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    return '$adminId-$timestamp';
  }

  Future<void> addPlayer(Map<String, dynamic> fields , String playerId , String adminId) async {
    //final userId = await getUserId();
    // use test admin account id for now
    final adminId = "fglxRerc2FOva0Q0AGiWNGRLY0G2";
    final playerId = generatePlayerId(adminId);
    try{
      await adminsCollection.doc(adminId).collection('addedPlayers')
          .doc(playerId)
          .set({'playerId': playerId});
      await adminsCollection.doc(adminId).collection('addedPlayers')
          .doc(playerId)
          .set(fields);
    }catch(e){
      print(e);
    }

  }

  Future<void> addScreenDataForPlayer(Map<String, dynamic> fields) async {
    //final userId = await getUserId();
    // use test user account id for now
    final userId = "SqnGDMQzmZMlJ06aURNl5rnnUQL2";
    await playersCollection.doc(userId).update(fields);
  }

  Future<void> addScreenDataForAddedPlayer(String playerId,Map<String, dynamic> fields) async {
    //final userId = await getUserId();
    // use test admin account id for now
    final adminId = "fglxRerc2FOva0Q0AGiWNGRLY0G2";
    await adminsCollection.doc(adminId).collection('addedPlayers')
        .doc(playerId)
        .update(fields);
    // add playerId and result as fields
  }

  // get all added players by a specific admin
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
          //'playerId': playerSnapshot['playerId'],
          'gender': playerSnapshot['gender'],
          'nativeLang': playerSnapshot['nativeLang'],
          'otherLang': playerSnapshot['otherLang'],
          'age': playerSnapshot['age'],
        };
      }).toList();
      print("myplayerList: $playersList ");
      return playersList;
    } catch (e) {
      print('Error getting players by admin ID: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getAllScreensDataOfAddedPlayer(String playerId) async {
    //final userId = await getUserId();
    final adminId = "fglxRerc2FOva0Q0AGiWNGRLY0G2";
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await adminsCollection
          .doc(adminId)
          .collection('addedPlayers')
          .doc(playerId)
          .get();

      // Specify the order of fields dynamically based on currentScreen
      // [clicks1 , hits1, misses1,score1 , accuracy1,missrate1...clicks32,hits32,misses32,score32,accuracy32,missrate32]
      List<String> fieldOrder = List.generate(
        32,(index) => ['clicks','hits','miss','score','accuracy','missrate']
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

      // Print the retrieved data
      print("Retrieved Screen Data:");
      print(screenData);

      return screenData;
    } catch (error) {
      print("Error retrieving user data: $error");
      return null;
    }
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
        32,(index) => ['clicks','hits','miss','score','accuracy','missrate']
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

      // Print the retrieved data
      print("Retrieved Screen Data:");
      print(screenData);

      return screenData;
    } catch (error) {
      print("Error retrieving user data: $error");
      return null;
    }
  }

