import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pettera/screens/homepage.dart';
import 'package:pettera/screens/searchpage.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Container(),
          const SizedBox(height: 90,),
          Text("Welcome",style: GoogleFonts.pacifico(
            // Use a custom Google Font for the title
            textStyle: TextStyle(
              color: Colors.white,
              fontSize:40,
            ),
          ),),
         const  SizedBox(height: 250,),
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
            child: Container(
              width: 200,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(color:const Color(0xff1C1B20),borderRadius: BorderRadius.circular(25) ),
              child: const Text("Task 1",style: TextStyle(fontSize: 20,color: Colors.white),)),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
            },
            child: Container(
              width: 200,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(color:const Color(0xff1C1B20),borderRadius: BorderRadius.circular(25) ),
              child:const  Text("Task 2",style: TextStyle(fontSize: 20,color: Colors.white),)),
          )
        ],
      ),
    );
  }
}