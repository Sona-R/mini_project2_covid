import 'package:flutter/material.dart';
import 'package:mini_project2/screens/third_page.dart';

class scnd_page extends StatefulWidget {
  const scnd_page({super.key});

  @override
  State<scnd_page> createState() => _scnd_pageState();
}

class _scnd_pageState extends State<scnd_page> {
  final formkey = GlobalKey<FormState>();
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
                      if(formkey.currentState!.validate()){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const logn_page()),
                        );
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
