import 'package:flutter/material.dart';
import 'package:mini_project2/screens/second_page.dart';

class front_page extends StatefulWidget {
  const front_page({super.key});

  @override
  State<front_page> createState() => _front_pageState();
}

class _front_pageState extends State<front_page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              height: 350,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/image1.jpg"),
                )),
            SizedBox(
              height: 10,
            ),
            Text("Ready to Feast?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blue),),
            SizedBox(
              height: 5,
            ),
            Text("Let's Begin!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blue),),
            SizedBox(
              height: 120,
            ),
            SizedBox(
              width: 230,
              height: 35,
              child: ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const scnd_page()),
                );




              }, child: Text("Get Started"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )
              ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
