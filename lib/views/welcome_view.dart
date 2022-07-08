import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/views/register_view.dart';
import 'package:getfit/widgets/snackbar_widgets.dart';
import '../main.dart';
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
  void initState() {
    super.initState();
  }
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
              MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterView()));
              },               
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
  void _loading(context){
    showDialog(context: context,
        builder: (_) => Center(child: CircularProgressIndicator(),)
    );
  }
  void showDialogWithFields(context) {
  showDialog(
    context: context,
    builder: (_) {

      return AlertDialog(
        
        title: Text('Login', textAlign: TextAlign.center,),
        content: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child:Column(
              children: [
                TextFormField(
                controller: emailController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value){
                    if(value == null){
                      return 'Please fill your email';
                    }
                    if(!EmailValidator.validate(value)){
                      return "Email must be valid";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  controller: passwordController,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (value){
                    if(value == null){
                      return 'Please fill your new password';
                    }

                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          
          TextButton(

            onPressed: () {
              Navigator.pop(context);
              _loading(context);

              signin();
              Navigator.pop(context);
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
   try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: emailController.text.trim(), password: passwordController.text.trim());
    }
    on FirebaseAuthException catch (e){
     print(e);
     SnackBarWidgets.fire(e.message);
    }

   }
}


