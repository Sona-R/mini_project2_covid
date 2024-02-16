import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project2/screens/fourth_page.dart';
import 'package:mini_project2/screens/third_page.dart';

import 'datass/firebase_datas.dart';

class scnd_page extends StatefulWidget {
  const scnd_page({super.key});

  @override
  State<scnd_page> createState() => _scnd_pageState();
}

class _scnd_pageState extends State<scnd_page> {
  final formkey = GlobalKey<FormState>();
  TextEditingController namectrl = TextEditingController();
  TextEditingController phnoctrl = TextEditingController();
  TextEditingController emailctrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  void _addFirestore()async{
    try{
      await _firestore.collection('patient').add({
        'name':namectrl.text,
        'phone':phnoctrl.text,
        'email':emailctrl.text,
        'password': passwordctrl.text

      }
      );
    }catch(e){
      print("error adding to firestore: $e");
    }
  }

  //submit function

  void Submitform()async{
    _addFirestore();
    VerifyForm();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const logn_page()),
    );

  }

  // verification email and password

  void VerifyForm() async{

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => logn_page()),
      );



    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        //  print('The account already exists for that email.');
        showDialog(
            context: context,
            builder: (BuildContext context)=>
                AlertDialog(
                  title: Text("warning"),
                  content: Text("The account already exists for that email"),
                  actions: [
                    TextButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child: Text("ok"))
                  ],
                )
        );

      }
    } catch (e) {
      print(e);
    }

  }

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 300,
                    width: 500,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5,left: 10,bottom: 10),
                      child: Image.asset("assets/images/join1.jpg"),
                    )),
                SizedBox(
                  height: 8,
                ),
                Text("Join Us!",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: namectrl,
                    validator:  (value) {
                      if (value == null || value.isEmpty) {   // Validation Logic
                        return 'required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                      hintText: "Enter Your Full Name",
                      hintStyle: TextStyle(fontSize: 10),
                      labelText: "Your Name:",
                      suffixIcon: Icon(Icons.person),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: phnoctrl,
                    validator:  (value) {
                      if (value == null || value.isEmpty) {   // Validation Logic
                        return 'required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                        hintText: "Enter Your Mobile Number",
                        hintStyle: TextStyle(fontSize: 10),
                        labelText: "Your Mobile No:",
                        suffixIcon: Icon(Icons.person),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailctrl,
                    validator:  (value) {
                      if (value == null || value.isEmpty) {   // Validation Logic
                        return 'required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                        hintText: "Enter Your Email",
                        hintStyle: TextStyle(fontSize: 10),
                        labelText: "Your Email:",
                        suffixIcon: Icon(Icons.send),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordctrl,
                    validator:  (value) {
                      if (value == null || value.isEmpty) {   // Validation Logic
                        return 'required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                        hintText: "Enter Your Password",
                        hintStyle: TextStyle(fontSize: 10),
                        labelText: "Password:",
                        suffixIcon: Icon(Icons.lock),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )

                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      width: 160,
                      height: 2,
                      color: Colors.blueGrey
                    ),
                    SizedBox(
                      width: 5,

                    ),
                    Text("or"),
                    SizedBox(width: 5,),
                    Container(
                        width: 169,
                        height: 2,
                        color: Colors.blueGrey
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                IconButton(onPressed: ()async{
                  await firebaseServices().sigInWithGoogle();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => last()),
                  );


                }, icon: SizedBox(
                    height: 40,
                    width: 40,

                    child: Image.asset("assets/images/google.png")
                )
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 300,
                    height: 30,

                    child: ElevatedButton(onPressed: (){
                      if(formkey.currentState!.validate()){

                        Submitform();

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const logn_page()),

                      }






                    }, child: Text("Create an account"),

                    style: ElevatedButton.styleFrom(textStyle: TextStyle(color: Colors.blue)),
                    )),
                SizedBox(
                  height: 15,
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
