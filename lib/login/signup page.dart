import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:legal_matrix/lawyer/lawyer.dart';
import 'package:legal_matrix/pref_util.dart';
import 'package:legal_matrix/prisoner/prisoner.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_page.dart';

enum Role {
  lawyer,
  prisoner
}

class SIGNUPPAGE extends StatefulWidget {
  final Role role;
  const SIGNUPPAGE(this.role, {Key? key}) : super(key: key);

  @override
  State<SIGNUPPAGE> createState() => _SIGNUPPAGEState();
}

class _SIGNUPPAGEState extends State<SIGNUPPAGE> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailaddress = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();

  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController Confpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.height * 0.03;
    // double imageSize = MediaQuery.of(context).size.width * 0.4;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                child: Container(
                  width: width,
                  height: height * 0.7,
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    width: width,
                    height: height * 0.7,
                    'assets/images/lawyer-keywords.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: width * 0.4,
                height: height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: Text(
                        "Legal Matrix",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize * 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 5,
                      indent: width * 0.01,
                      endIndent: width * 0.8,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: Text(
                        "Empowering Justice:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: Text(
                        "Your Bridge to Legal Aid, Resources, and Rehabilitation",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSize * 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.01),
              child: Text(
                "Register your account",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: fontSize * 0.7,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize * 0.7,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: firstname,
                          decoration: InputDecoration(
                            hintText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(),
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            //Validator
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your name';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Last Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize * 0.7,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: lastname,
                          decoration: InputDecoration(
                            hintText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter last name';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "E-mail Address",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize * 0.7,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailaddress,
                          decoration: InputDecoration(
                            hintText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(),
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            //Validator
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone Number",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize * 0.7,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: phonenumber,
                          decoration: InputDecoration(
                            hintText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(),
                            ),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length > 10) {
                              return 'Please enter phone number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize * 0.7,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: password,
                          decoration: InputDecoration(
                            hintText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length <6) {
                              return 'Please enter user password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize * 0.7,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: Confpassword,
                          decoration: InputDecoration(
                            hintText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty || value != password.value.text) {
                              return 'Please enter user password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width * 0.4,
                child: ElevatedButton(
                  style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all(
                        Size(width * 05, height * 0.08)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var collectionName = (widget.role == Role.lawyer) ? "Lawyer" : "Prisoner";

                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailaddress.value.text, password: password.value.text).then((value) =>
                      { FirebaseFirestore.instance.collection(collectionName).doc(FirebaseAuth.instance.currentUser!.uid).set({
                      "Name" : firstname.text.toString() + " " + lastname.text.toString(),
                      "Email" : emailaddress.text.toString(),
                      "PhoneNumber" : phonenumber.text.toString()
                      })}).then((value) {
                        if (widget.role == Role.lawyer) {
                          PrefUtil.setValue("role", "lawyer");
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Lawyer()), (Route) => false);
                        } else {
                          PrefUtil.setValue("role", "prisoner");
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Prisoner()), (Route) => false);
                        }
                      }
                      );
                      const SnackBar(
                        content: Text(
                          'going to login page',
                        ),
                      );
                    } else {
                      const SnackBar(content: Text('Invalid'));
                    }
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LOGINPAGE(widget.role)));
                },
                child: const Text("Already have an account? Log in"))
          ],
        ),
      ),
    );
  }
}
