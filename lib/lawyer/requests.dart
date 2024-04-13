import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:legal_matrix/chatdb.dart';

class RequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: DatabaseService().getRequests(), builder: (context, snpsht) {
      if (snpsht.hasData && snpsht.connectionState == ConnectionState.done) {
        return ListView.builder( itemCount: snpsht.data!.length,
          itemBuilder: (context, index) {
          return ListTile(
            title: Text(snpsht.data![index].get("name")),
            leading: IconButton(onPressed: () {
                FirebaseFirestore.instance.collection("requests").doc(snpsht.data![index].id).delete();
              }, icon: Icon(Icons.delete)),
              trailing: IconButton(onPressed: () {
                FirebaseFirestore.instance.collection("requests").doc(snpsht.data![index].id).delete();
                DatabaseService().joinRoom(snpsht.data![index].get("room"));
                FirebaseFirestore.instance.collection("requests").doc(snpsht.data![index].id).delete();
              }, icon: Icon(Icons.check), color: Colors.green,)
            ,
          );
        });
      } else {
        return Center(child: CircularProgressIndicator.adaptive());
      }
    });
  }
}