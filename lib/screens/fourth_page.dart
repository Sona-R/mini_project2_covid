import 'package:flutter/material.dart';
import 'package:mini_project2/screens/third_page.dart';
class last extends StatefulWidget {
  const last({super.key});

  @override
  State<last> createState() => _lastState();
}

class _lastState extends State<last> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => logn_page()),
            );
          }, child: Text("Sign out"))
        ],
      ),
body: SingleChildScrollView(
  child: Container(
    child: Column(
      children: [
  Container(

  
    decoration: BoxDecoration(
  
      image: DecorationImage(image: AssetImage("assets/images/person.jpg"),
      fit: BoxFit.fill,
      )
  
    ),
   
    height:300,
    width: 380,
    child: Stack(
      children: [
        Positioned(
  
  
            child: Text("Avoid the scare of corona virus",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          left: 40,
          bottom: 0,
        ),
      ],
  
    ),
  
  ),
        SizedBox(
          height: 15,
        ),
        Text("Symptoms",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            SizedBox(
              height: 150,
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Card(child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                          child: Image.asset("assets/images/cold.jpg"),
                      ),
                      Text("Cold"),
                    ],
                  ),




                  ),

                ),
            ),
            SizedBox(
              height: 150,
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Card(child: Column(
                    children: [
                      Container(
                          height: 120,
                          width: 100,
                          child: Image.asset("assets/images/cough.jpg")
                      ),
                      Text("cough")

                    ],
                  )
                  ),
                )
            )

          ],
        ),
     SizedBox(
       height: 10,
     ),
        Text("Emergency Guide"),
    SizedBox(
      height: 10,
    ),
        Container(
          height: 200,
          width: 300,
          child: Card(
            child: Column(
              children: [
                SizedBox(height: 25),
                Text("Avoid the scare of ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
               Text("corona virus",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              SizedBox(
                height: 45,
                  width: 45,
                  child: Image.asset("assets/images/coronavirus.png")),
               SizedBox(height: 20,),
               
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.blue
                 ),
                   onPressed: (){}, child: Text("Call",style: TextStyle(fontSize: 20,color: Colors.black),))
              ],
              
            ),

          ),
        )
        
        
      ],
    ),
  ),
),
    );
  }
}
