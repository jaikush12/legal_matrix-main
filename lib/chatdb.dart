import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class Person {
  final String name;
  final String imageURL;
  final String userID;
  const Person(this.name, this.imageURL, this.userID);
}

class RoomView {
  final String roomID;
  final String name;
  final String lastMessage;
  const RoomView(this.roomID, this.name, this.lastMessage);
}

class FirestoreMessage {
  final String id;
  final String message;
  final String sender;
  final Timestamp timestamp;

  const FirestoreMessage(this.id, this.message, this.sender, this.timestamp);

  factory FirestoreMessage.fromMap(Map<String, dynamic> dict) {
    var id = dict["id"] as String;
    var message = dict["message"] as String;
    var sender = dict["sender"] as String;
    var timestamp = dict["timestamp"] as Timestamp;
    return FirestoreMessage(id, message, sender, timestamp);
  }
}

class DatabaseService {
  var usersCollection = FirebaseFirestore.instance.collection("users");
  var roomsCollection = FirebaseFirestore.instance.collection("rooms");

  Future<void> createChatUser(String uid, String name,) async {
    await usersCollection.doc(uid).set({
      "rooms": <String>[],
      "name": name,
    });
  }

  Future<void> joinRoom(String roomID) async {
    var currentUserDoc = usersCollection.doc(FirebaseAuth.instance.currentUser!.uid);
    var currentRooms = (await currentUserDoc.get()).get("rooms") as List<dynamic>;
    await currentUserDoc.update({
      "rooms": currentRooms + [roomID]
    });
    var _ = roomsCollection.doc(roomID);
    print(_);
    var currentMembers = (await _.get()).get("members") as List<dynamic>;
    
    _.update({
      "members": currentMembers + [FirebaseAuth.instance.currentUser!.uid]
    });
  }

  Future<String> createRoom() async {
    var roomId = Uuid().v4();
    await roomsCollection.doc(roomId).set({
      "members": <String>[],
      "messages": <Map<String, dynamic>>[]
    });
    joinRoom(roomId);
    return roomId;
  }

  Future<void> sendMessage(String roomID, String message) async {
    var currentMessages = (await roomsCollection.doc(roomID).get()).get("messages");
    await roomsCollection.doc(roomID).update({
      "messages": <dynamic>[{"id": (const Uuid()).v4(), "message": message, "sender": FirebaseAuth.instance.currentUser!.uid, "timestamp": Timestamp.now()},] + currentMessages
    });
  }

  Future<Stream<DocumentSnapshot>> getRoomStream(String roomID) async {
    return roomsCollection.doc(roomID).snapshots();
  }


  Future<List<RoomView>> getRoomsListByUser(String uid) async {
    var rooms = (await usersCollection.doc(uid).get()).get("rooms") as List<dynamic>;
    print(rooms);
    var roomsToBeReturned = <RoomView>[];
    for (var room in rooms) {
      var members = (await FirebaseFirestore.instance.collection("rooms").doc(room).get()).get("members") as List;
      print("room is");
      print(room);
      print("members are: ");
      print(members);
      if (members.length > 1) {
        try {
      roomsToBeReturned.add(RoomView(room, await getRoomName(room), await getLastMessage(room)));
        } catch(e) {
          print(e);
        }
      }
    }
    print(roomsToBeReturned);
    print("rooms to be returned above");
    return roomsToBeReturned;
    
  }


  Future<String> getRoomName(String roomID) async {
    try{
    var members = (await roomsCollection.doc(roomID).get()).get("members") as List;
    members.remove(FirebaseAuth.instance.currentUser!.uid);
    var otherUser = members[0];
    return (await FirebaseFirestore.instance.collection("users").doc(otherUser).get()).get("name");
    } catch(e) {
      print("error in getroomname");
      print(e);
    }
    return "";
  }

  Future<String> getLastMessage(String roomID) async {
    try {
    var messages = (await roomsCollection.doc(roomID).get()).get("messages") as List;
    if (messages.isEmpty) {
      return "";
    } else {
      return FirestoreMessage.fromMap(messages[0]).message;
    }
    
    } catch (e) {
      print("error in get last message");
    }
    return "";
  }

  Future<void> leaveRoom(String roomID) async {
    var currentUserDoc = usersCollection.doc(FirebaseAuth.instance.currentUser!.uid);
    await roomsCollection.doc(roomID).delete();
    var currentRooms = (await currentUserDoc.get()).get("rooms") as List<dynamic>;
    currentRooms.remove(roomID);
    return await currentUserDoc.update({
      "rooms": currentRooms
    });
  }

  Future<List<QueryDocumentSnapshot>> getRequests() async {
    var requests = await FirebaseFirestore.instance.collection("requests").where("receiver", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    return requests.docs;
  }

}