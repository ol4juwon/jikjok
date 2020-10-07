import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jikjok/main.dart';
import 'package:jikjok/policy.dart';
import 'package:jikjok/variables.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  registerUser(){
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((signeduser){
      usercollection.doc(signeduser.user.uid).set({
        'username': usernameController.text,
        'password': passwordController.text,
        'email': emailController.text,
        'uid': signeduser.user.uid,
        'profilePic' : "https://img.favpng.com/25/13/19/samsung-galaxy-a8-a8-user-login-telephone-avatar-png-favpng-dqKEPfX7hPbc6SMVUCteANKwj.jpg"

      }

      );


    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.red[200],
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Mr Money",
                style: myStyle(25, Colors.black, FontWeight.w700)),
            SizedBox(height: 10,),
            Text("Register", style: myStyle(20, Colors.black, FontWeight.w700)),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    labelStyle: myStyle(20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )

                ),
              ),


            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person),
                    labelStyle: myStyle(20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )

                ),
              ),


            ),

            SizedBox(height: 10,),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: myStyle(20),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )

                  )
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(

                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: myStyle(20),
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )

                  )
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: () => registerUser(),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Register",
                    style: myStyle(20, Colors.black, FontWeight.w700),),

                ),

              ),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("I Agree to...", style: myStyle(20),),
                SizedBox(width: 10,),
                InkWell(
                  onTap: () =>
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => policy())),
                  child: Text("Terms & Conditions",
                    style: myStyle(20, Colors.purple, FontWeight.w700),),
                )
              ],
            )

          ],
        ),

      ),

    );
  }
}

