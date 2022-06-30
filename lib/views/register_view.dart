import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/text_widgets.dart';
import '../widgets/colors.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/welcome.png"), fit: BoxFit.cover),
          ),
          child: Center(
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Consider what you eat here" ,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: LibColors.color_white
                  ),
                  ),
                  MaterialButton(onPressed: (){
                      show();
                  },
                      minWidth: 360,
                      color: LibColors.primary_color,
                      child: const Text(
                        "Log In" ,style: TextStyle(
                          fontSize: 20,
                          color: LibColors.color_white
                      ),
                      )
                  ),
                  MaterialButton(onPressed: (){

                  },
                      child: const Text(
                        "Register" ,style: TextStyle(
                          fontSize: 20,
                          color: LibColors.color_white
                      ),
                      )
                  ),

                ],
              )
          ),
        )
    );
  }
  void show(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: textTitle("Login"),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[

                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(

                        labelText: 'Password',
                        icon: Icon(Icons.lock ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
             MaterialButton(
               color: LibColors.primary_color,
                child: const Text(

                  "Login" ,style: TextStyle(
                    fontSize: 16,
                    color: LibColors.color_white
                ),
                ),
                 onPressed: (){}
             )
            ],
          );
        });
  }
  Future signin() async{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim());
    }
}
