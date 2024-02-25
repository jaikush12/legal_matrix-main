import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Legal_Directory extends StatelessWidget {
  const Legal_Directory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFEBEBEB),
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("Lawyer").snapshots(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Icon(Icons.library_books_sharp,
                              color: Color(0xFF393939), size: 30),
                          Text("Top rated Lawyer:",
                              style: TextStyle(
                                  color: Color(0xFF393939),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: h * 0.1,
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.only(left: 7),
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
                                    margin: EdgeInsets.only(left: 7),
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
                                      child: ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              SizedBox(height: 10,),
                                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(children: [
                                                    Row(children: [
                                                      Checkbox1(),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      CircleAvatar(
                                                          foregroundImage: AssetImage(
                                                              "assets/associated_photo.png"),
                                                          maxRadius: 18),
                                                      SizedBox(
                                                        width: 18,
                                                      ),
                                                      Text("${snapshot.data?.docs[index]["Name"]}",
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight: FontWeight.w500))
                                                    ],),
                                                  ],),
                                                  Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                                    Text("${snapshot.data?.docs[index]["Email"]}",style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w500)),
                                                    Text("${snapshot.data?.docs[index]["PhoneNumber"]}",style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w500))
                                                  ],)
                                                ],
                                              ),
                                              SizedBox(height: 10,),
                                              Divider(
                                                height: 1,
                                                color: Colors.grey.withOpacity(0.3),
                                              ),
                                            ],
                                          );
                                        },
                                        itemCount: snapshot.data!.docs.length,
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      color: Color(0xFFEBEBEB),
                    ),
                  ],
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
