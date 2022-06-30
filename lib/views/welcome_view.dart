import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/colors.dart';


class WelcomeView extends StatefulWidget {
  const WelcomeView({ Key? key }) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
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
    return  Scaffold(
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
                   showDialogWithFields(context);
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
              MaterialButton(onPressed: (){},               
                child: const Text(
                      "Register" ,style: TextStyle(
                      fontSize: 20,
                      color: LibColors.color_white
                  ),
                )
              )
            ],
          )
        ),
      )
    );
  }
  
  void showDialogWithFields(context) {
  showDialog(
    context: context,
    builder: (_) {

      return AlertDialog(
        
        title: Text('Login', textAlign: TextAlign.center,),
        content: SingleChildScrollView(
          child: Column(
           
          children: [
            TextFormField(
              controller: emailController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              obscureText: true,
              textAlign: TextAlign.center,
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ],
        ),  
        ),
        actions: [
          
          TextButton(
            
            onPressed: () {
            signin();
             print(FirebaseAuth.instance.currentUser?.displayName);
            },
            style: TextButton.styleFrom(
              fixedSize: Size.fromWidth(300),
              
              backgroundColor: LibColors.primary_color
              ),
            child: Text('LOG IN',style: TextStyle(color: LibColors.color_white),),
          ),
        ],
      );
    },
  );
  
}
  Future signin() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(), password: passwordController.text.trim());
  }
}


