import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:legal_matrix/chatdb.dart';

class Legal_Directory extends StatelessWidget {
  const Legal_Directory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xebebeb),
        title: Row(
                        children: [
                          Icon(Icons.library_books_sharp,
                              color: Color(0xFF393939), size: 30),
                          Text("Top rated Lawyers",
                              style: TextStyle(
                                  color: Color(0xFF393939),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20)),
                        ],
                      ),),
      backgroundColor: Color(0xFFEBEBEB),
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("Lawyer").snapshots(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData){
                
                   return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: h * 0.1,
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.only(left: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.symmetric(
                                      vertical:
                                      BorderSide(color: Colors.grey.withOpacity(0.3))),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text("Name",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15)),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              Container(
                                height: h * 0.65,
                                child: Container(
                                    margin: EdgeInsets.only(left: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child:Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.symmetric(
                                            vertical: BorderSide(
                                                color: Colors.grey.withOpacity(0.3))),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (context, index) {
                                        
                                               
                                                     return Padding(
                                                      padding: EdgeInsets.only(bottom: 8),
                                                       child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        
                                                        
                                                        
                                                        children: [
                                                          Checkbox1(),
                                                          
                                                          
                                                          CircleAvatar(
                                                              foregroundImage: AssetImage(
                                                                  "assets/associated_photo.png"),
                                                              maxRadius: 18),

                                                          SizedBox(width: 5,),
                                                          
                                                          
                                                          SizedBox(
                                                            width: MediaQuery.sizeOf(context).width/5,
                                                            child: Text("${snapshot.data?.docs[index]["Name"]}",
                                                                style: TextStyle(
                                                                    fontSize: 13,
                                                                    fontWeight: FontWeight.w500)),
                                                          ),
                                                        
                                                                                               
                                                        SizedBox(
                                                          width: MediaQuery.sizeOf(context).width/4,
                                                          child: Text("${snapshot.data?.docs[index]["Email"]}",style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight: FontWeight.w500)),
                                                        ),
                                                        
                                                        
                                                        
                                                        
                                                        SizedBox(
                                                          width: MediaQuery.sizeOf(context).width/7,
                                                          child: Text("${snapshot.data?.docs[index]["PhoneNumber"]}",style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight: FontWeight.w500)),
                                                        ),

                                                        IconButton(onPressed: () {
                                                          late String roomID;
                                                          DatabaseService().createRoom().then((roomId) {FirebaseFirestore.instance.collection("requests").add({
                                                            "sender": FirebaseAuth.instance.currentUser!.uid,
                                                            "receiver": snapshot.data!.docs[index].id,
                                                            "room": roomId,
                                                            "name": FirebaseAuth.instance.currentUser!.displayName
                                                          });
                                                          roomID = roomId;
                                                        }).then((value) => DatabaseService().joinRoom(roomID));
                                                        }, icon: Icon(Icons.message)),
                                                                                                         ],
                                                                                                       ),
                                                     );
                                          },
                                                
                                              
                                            ),
                                            SizedBox(height: 10,),
                                              Divider(
                                                height: 1,
                                                color: Colors.grey.withOpacity(0.3),
                                              ),
                                        ],
                                      ))
                                        
                                      ),
                                    )
                  ]),
                              ),
                      ),
                          );
              }
              else{
                return Center(child: CircularProgressIndicator(),);
              }
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          })
    );
  }
}

class Checkbox1 extends StatefulWidget {
  const Checkbox1({super.key});

  @override
  State<Checkbox1> createState() => _Checkbox1State();
}

class _Checkbox1State extends State<Checkbox1> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      } else {
        return Colors.white;
      }
    }

    return Checkbox(
      checkColor: Colors.blue,
      side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(width: 1.0, color: Colors.grey.shade700),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
