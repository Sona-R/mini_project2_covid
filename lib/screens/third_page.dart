import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project2/screens/fourth_page.dart';


import 'datass/firebase_datas.dart';

class logn_page extends StatefulWidget {
  const logn_page({super.key});

  @override
  State<logn_page> createState() => _logn_pageState();
}

class _logn_pageState extends State<logn_page> {
  final _formkey=GlobalKey<FormState>();
  final SnackBar _snackBar=SnackBar(content: Text("successfully login"),
    duration: Duration(seconds: 4),

  );

  TextEditingController usernamectrl = TextEditingController();
  TextEditingController pswdctrl = TextEditingController();


  //sigin ...................................


  void _formSignin() async{
    try{
      final UserCredential  credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  last()),
      );


    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
            centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30,top: 10,
                  bottom: 50),
                  child: SizedBox(
                    height: 300,
                      width: 300,
                      child: Image.asset("assets/images/login.jpg")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: usernamectrl,
                    onChanged: (value) {
                      email = value;
                    },

                    validator:  (value) {
                      if (value == null || value.isEmpty) {   // Validation Logic
                        return 'required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                        hintText: "Enter Your username",
                        hintStyle: TextStyle(fontSize: 10),
                        labelText: "username:",
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
                    controller: pswdctrl,
                    onChanged: (value) {
                      password = value;
                    },

                    validator:  (value) {
                      if (value == null || value.isEmpty) {   // Validation Logic
                        return 'required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                        hintText: "Enter Your password",
                        hintStyle: TextStyle(fontSize: 10),
                        labelText: "password:",
                        suffixIcon: Icon(Icons.lock),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )

                    ),
                  ),
                ),
                SizedBox(height: 15,),
                TextButton(onPressed: (){}, child: Text("Forgot password?")),
                SizedBox(
                  height: 20,
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
                      _formSignin();


                      if(_formkey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(_snackBar);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const last()),
                        );
                      }

                    }, child: Text("Login"),

                      style: ElevatedButton.styleFrom(textStyle: TextStyle(color: Colors.blue)),
                    )),
                SizedBox(
                  height: 15,
                ),

              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
