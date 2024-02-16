import 'package:flutter/material.dart';
import 'package:mini_project2/screens/fourth_page.dart';

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
                IconButton(onPressed: (){}, icon: SizedBox(
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
