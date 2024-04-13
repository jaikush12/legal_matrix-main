import 'package:flutter/material.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEBEBEB),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 20, right: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
          padding: EdgeInsets.only(left: 15, top: 7, bottom: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Appointment Management",
                style: TextStyle(
                    color: Color(0xFF282727),
                    fontWeight: FontWeight.w800,
                    fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                        height: h * 0.1,
                        width: w * 0.4,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xFF3366FF).withOpacity(0.5),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.file_copy,
                                size: 15, color: Color(0xFF3366FF)),
                            Text(
                              "Appointment History",
                              style: TextStyle(
                                  color: Color(0xFF3366FF),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: h * 0.71,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Visitor Details",
                          style: TextStyle(
                            color: Color(0xFF2E3A59),
                            fontWeight: FontWeight.w800,
                            fontSize: h* 0.035, 
                          ),
                        ),
                        Row(
                            children: [
                              Container(
                                width: w*0.4,
                                child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,),),
                                    SizedBox(width: w*0.5,
                                      child: TextField(
                                        decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                                                  ),
                                                                      filled: true,
                                                                      fillColor: Color.fromARGB(255, 223, 240, 248),
                                                                      hintText: "ABC", // Placeholder text
                                                                      hintStyle: TextStyle(color: Colors.black), // Light blue hint text
                                                                    ),
                                                                      ),
                                    ),  
                                  ],
                                ),
                              ),
                              SizedBox(width: w*0.1,),
                              Container(
                                width: w*0.4,
                                child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Preferred Date of Appointment",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,),),
                                    SizedBox(
                                      width: w*0.5,
                                      child: TextField(
                                        decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                                                  ),
                                                                      filled: true,
                                                                      fillColor: Color.fromARGB(255, 223, 240, 248),
                                                                      hintText: "DD / MM / YY", // Placeholder text
                                                                      hintStyle: TextStyle(color: Colors.black), // Light blue hint text
                                                                    ),
                                                                      ),
                                    ),  
                                  ],
                                ),
                              ),
                              ]),
                        Container(
                                child:Text(
                          "Contact Information",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                              ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 223, 240, 248),
                            hintText: "+91 xxxxx xxxxx", // Placeholder text
                            hintStyle: TextStyle(color: Colors.black), // Light blue hint text
                              ),
                                ), 
                        Row(
                            children: [
                              Container(
                                width: w*0.4,
                                child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Mail ID",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,),),
                                    SizedBox(width: w*0.5,
                                      child: TextField(
                                        decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                                                  ),
                                                                      filled: true,
                                                                      fillColor: Color.fromARGB(255, 223, 240, 248),
                                                                      hintText: "abc@gmail.com", // Placeholder text
                                                                      hintStyle: TextStyle(color: Colors.black), // Light blue hint text
                                                                    ),
                                                                      ),
                                    ),  
                                  ],
                                ),
                              ),
                              SizedBox(width: w*0.1,),
                              Container(
                                width: w*0.4,
                                child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Preferred Mode of Communication",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,),),
                                    SizedBox(
                                      width: w*0.5,
                                      child: TextField(
                                        decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                                                  ),
                                                                      filled: true,
                                                                      fillColor: Color.fromARGB(255, 223, 240, 248),
                                                                      hintText: "In-Person / Phone Call / Video Call", // Placeholder text
                                                                      hintStyle: TextStyle(color: Colors.black), // Light blue hint text
                                                                    ),
                                                                      ),
                                    ),  
                                  ],
                                ),
                              ),
                            ]),      

                            Container(
                                child:Text(
                          "Connection to Visitor",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                              ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 223, 240, 248),
                            hintText: "Family Member / Legal Representative", // Placeholder text
                            hintStyle: TextStyle(color: Colors.black), // Light blue hint text
                              ),
                                ),       
                        Container(
                          child:Text(
                          "Purpose of Appointment",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                              ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 223, 240, 248),
                            hintText: "Enter Text", // Placeholder text
                            hintStyle: TextStyle(color: Colors.black), // Light blue hint text
                              ),
                                ),      
                        Container(
                        height: h * 0.05,
                        width: w * 0.9,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 14, 113, 19).withOpacity(0.5),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Apply",
                              style: TextStyle(
                                  color:Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}