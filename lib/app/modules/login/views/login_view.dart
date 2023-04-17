// Berhasil memasukkan login 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_detection_app/app/modules/home/views/home_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
              margin: EdgeInsets.only(top: 275,left: 40,right: 40),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 0.1,
                      blurRadius: 5
                    ),
                  ]
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/SplashLogo.png',
                        width: 90,
                        height: 50,
                      ),

                      Text(
                        "Object Detection",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal:20),
                    ),
                    // decoration: InputDecoration(
                    //   hintText: "Password",
                    //   border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 20),
                    // ),
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => HomeView(),)
                      );
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.green,
                      minimumSize: Size(300, 40)
                    ),
                  )
                ]),

            ),
          )
        ]
      )
    );
  }
}
