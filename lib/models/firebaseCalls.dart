import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

var family = FirebaseFirestore.instance.collection('family');
var personalExpense = FirebaseFirestore.instance.collection('personal expense');
String friendName = "";
String userName = "";
String totalExpense = "";
DateTime now = DateTime.now();
int currentMonth = now.month;

class FirebaseCalls {
  createNewUser(String userID) async {
    print("We in current user");
    await personalExpense.doc(userID).set({
      "jan": 0.0,
      "feb": 0.0,
      "mar": 0.0,
      "apr": 0.0,
      "may": 0.0,
      "jun": 0.0,
      "jul": 0.0,
      "aug": 0.0,
      "sep": 0.0,
      "oct": 0.0,
      "nov": 0.0,
      "dec": 0.0,
      "total": 0.0,
      'username': "",
    });
  }

  getCurrentUserKey() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      print('Current user key (UID): ${currentUser.uid}');
      return currentUser.uid;
    } else {
      print('No user is signed in.');
    }
  }

  Future<bool> checkUsername(String userID) async {
    DocumentSnapshot docRef = await personalExpense.doc(userID).get();
    if (!docRef.exists) {
      createNewUser(userID);
      return false;
    } else {
      final DocumentSnapshot<Map<String, dynamic>> result =
          await personalExpense.doc(userID).get();
      print("Data: " + result.data().toString());
      final Map<String, dynamic> data = result.data()!;
      double tt = data['total'];
      tt = tt / currentMonth;
      totalExpense = tt.toString();
      if (result['username'] != null || result['username' == ""])
        return true;
      else
        return false;
    }
  }

  Future<double> getExpenses(String userID) async {
    final DocumentSnapshot<Map<String, dynamic>> result =
        await personalExpense.doc(userID).get();
    final Map<String, dynamic> data = result.data()!;
    final double total = await data['total'];
    print(total.runtimeType);
    return data['total'];
  }

  addOrUpdateUsername(String username, String userID) async {
    await personalExpense.doc(userID).update({
      "jan": 0.0,
      "feb": 0.0,
      "mar": 0.0,
      "apr": 0.0,
      "may": 0.0,
      "jun": 0.0,
      "jul": 0.0,
      "aug": 0.0,
      "sep": 0.0,
      "oct": 0.0,
      "nov": 0.0,
      "dec": 0.0,
      "total": 0.0,
      'username': username,
    });
  }

  connectFriend(String friendID, String userID) async {
    await family.doc(userID).set({
      'userkey': friendID,
    });
  }

  Future<Map<String, double>> getDashBoardData(
      String friendID, String userID) async {
    DocumentSnapshot<Map<String, dynamic>> friendData =
        await personalExpense.doc(friendID).get();
    DocumentSnapshot<Map<String, dynamic>> userData =
        await personalExpense.doc(userID).get();
    Map<String, double> dashboardData = {};
    friendName = friendData['username'];
    userName = userData['username'];
    dashboardData["friendJan"] = friendData['jan'];
    dashboardData["friendFeb"] = friendData['feb'];
    dashboardData["friendMar"] = friendData['mar'];
    dashboardData["friendApr"] = friendData['apr'];
    dashboardData["friendMay"] = friendData['may'];
    dashboardData["friendJun"] = friendData['jun'];
    dashboardData["friendJul"] = friendData['jul'];
    dashboardData["friendAug"] = friendData['aug'];
    dashboardData["friendSep"] = friendData['sep'];
    dashboardData["friendOct"] = friendData['oct'];
    dashboardData["friendNov"] = friendData['nov'];
    dashboardData["friendDec"] = friendData['dec'];
    dashboardData["friendTotal"] = friendData['total'];
    dashboardData["userJan"] = userData['jan'];
    dashboardData["userFeb"] = userData['feb'];
    dashboardData["userMar"] = userData['mar'];
    dashboardData["userApr"] = userData['apr'];
    dashboardData["userMay"] = userData['may'];
    dashboardData["userJun"] = userData['jun'];
    dashboardData["userJul"] = userData['jul'];
    dashboardData["userAug"] = userData['aug'];
    dashboardData["userSep"] = userData['sep'];
    dashboardData["userOct"] = userData['oct'];
    dashboardData["userNov"] = userData['nov'];
    dashboardData["userDec"] = userData['dec'];
    dashboardData["userTotal"] = userData['total'];
    return dashboardData;
  }

  getFriendID(String userID) async {
    try{

      final DocumentSnapshot<Map<String, dynamic>> result =
      await family.doc(userID).get();
      print("hhahhahah ${result["userkey"]}");
      return result["userkey"];
    }
    catch(e){
        print(e);
    }
  }

  addPersonalExpense(
      double jan,
      double feb,
      double mar,
      double apr,
      double may,
      double jun,
      double jul,
      double aug,
      double sep,
      double oct,
      double nov,
      double dec,
      double total,
      String? username,
      String userID) async {
    await FirebaseFirestore.instance
        .collection("personal expense")
        .doc(userID)
        .update({
      "jan": jan,
      "feb": feb,
      "mar": mar,
      "apr": apr,
      "may": may,
      "jun": jun,
      "jul": jul,
      "aug": aug,
      "sep": sep,
      "oct": oct,
      "nov": nov,
      "dec": dec,
      "total": total,
      "username": username
    });
  }
}
