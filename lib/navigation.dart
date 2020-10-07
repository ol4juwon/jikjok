
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jikjok/Home.dart';
import 'package:jikjok/signup.dart';
import 'package:jikjok/variables.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user ){
      if(user != null){

        setState(() {
          isSigned = true;
        });

      }else{
        setState(() {
          isSigned = false;
        });

      }


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSigned == false ? Login() : HomePage()

    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: Container(
        alignment: Alignment.center,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome To Tarift",style: myStyle(25,Colors.black,FontWeight.w700)),
            SizedBox(height: 10,),
            Text("Login", style: myStyle(20,Colors.black,FontWeight.w700)),
            SizedBox(height: 10,),
            InkWell(

            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20,right: 20),
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
      ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  fillColor:  Colors.white,
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
            InkWell(
              onTap: (){
                try {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text);
                }catch( e ){
                 SnackBar snackbar = SnackBar(content: Text(
                   "Try again, Email or password are wrong"
                 ));
                 Scaffold.of(context).showSnackBar(snackbar);
                }
              },
              child: Container(
              width: MediaQuery.of(context).size.width/2,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Text("Login",style: myStyle(20,Colors.black,FontWeight.w700),),

              ),

            ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have an Account?", style: myStyle(20),),
                SizedBox(width: 10,),
                InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp())),
                    child: Text("Register",
                  style: myStyle(20,Colors.purple,FontWeight.w700),),
                )
              ],
            )

          ],
        ),

      ),


    );
  }
}




