import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:getfit/views/profile.dart';
import 'package:getfit/widgets/colors.dart';
import 'package:intl/intl.dart';
import '../widgets/text_widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  DateTime date = DateTime.now();
  String dob = "";

  PageController p = PageController();
  List<String> _genders = ['Male','Female'];
  String? _selectedGender;

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
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Stack(

        children: [

          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: p,
            children: [
              _pageOne(),
              _pageTwo(),
              _pageThree(),
              _pageFour(),
              _pageFive()
            ],
          ),

        ],

      )
    );
  }

  Widget _pageOne(){
    return Container(
      padding: EdgeInsets.all(12),
      color: LibColors.primary_color,
      child: Column(
        children: [
          Align(
            heightFactor: 15,
              child:textTitleAlt("We'd like to ask you some questions to help us get to know you")
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.center,

                    child: Column(
                      children: [
                        MaterialButton(onPressed: (){
                          p.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            minWidth: 360,
                            color: LibColors.color_white,
                            child: Text(
                              "Continue" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.primary_color,
                            ),
                              textAlign: TextAlign.center,
                            )
                        ),
                        MaterialButton(onPressed: (){
                          Navigator.pop(context);
                        },
                            child: Text(
                              "Back" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.color_white,
                            ),
                              textAlign: TextAlign.center,
                            )
                        )
                      ],
                    )
                )
              ],
            ),
          )
        ],

      ),
    );
  }
  Widget _pageTwo(){
    return Container(
      padding: EdgeInsets.all(12),
      color: LibColors.primary_color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              heightFactor: 2,
              child:textTitleAlt("Please choose your goal")
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Column(

                      children: [
                        SizedBox(height: 16,),
                        MaterialButton(onPressed: (){
                          p.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            minWidth: 360,
                            height: 80,
                            color: LibColors.color_white,
                            child: Text(
                              "DIET" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.primary_color,
                            ),
                              textAlign: TextAlign.center,
                            )
                        ),
                        SizedBox(height: 16,),
                        MaterialButton(onPressed: (){
                          p.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            minWidth: 360,
                            height: 80,
                            color: LibColors.color_white,
                            child: Text(
                              "MAINTAIN WEIGHT" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.primary_color,
                            ),
                              textAlign: TextAlign.center,
                            )
                        ),
                        SizedBox(height: 16,),
                        MaterialButton(onPressed: (){
                          p.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            minWidth: 360,
                            height: 80,
                            color: LibColors.color_white,
                            child: Text(
                              "LOSE WEIGHT" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.primary_color,
                            ),
                              textAlign: TextAlign.center,
                            )
                        ),
                        SizedBox(height: 90,),
                      ],
                    )
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        MaterialButton(onPressed: (){
                          p.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            child: Text(
                              "Back" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.color_white,
                            ),
                              textAlign: TextAlign.center,
                            )
                        )
                      ],
                    )
                )
              ],
            ),
          )
        ],

      ),
    );
  }
  Widget _pageThree(){
    return Container(
      padding: EdgeInsets.all(12),
      color: LibColors.primary_color,
      child: Column(
        children: [
          Align(
              heightFactor: 10,
              child:textTitleAlt("Please input your weight and height")
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 96),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Weight (kg)',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),

                          hintStyle: TextStyle(color: LibColors.primary_color)
                      ),
                    ),
                ),
                SizedBox(height: 12,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'Height (cm)',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),

                        hintStyle: TextStyle(color: LibColors.primary_color)
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.center,

                    child: Column(
                      children: [
                        MaterialButton(onPressed: (){
                          p.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            minWidth: 360,
                            color: LibColors.color_white,
                            child: Text(
                              "Continue" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.primary_color,
                            ),
                              textAlign: TextAlign.center,
                            )
                        ),
                        MaterialButton(onPressed: (){
                          p.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            child: Text(
                              "Back" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.color_white,
                            ),
                              textAlign: TextAlign.center,
                            )
                        )
                      ],
                    )
                )
              ],
            ),
          )
        ],

      ),
    );
  }
  Widget _pageFour(){
    return Container(
      padding: EdgeInsets.all(12),
      color: LibColors.primary_color,
      child: Column(
        children: [
          Align(
              heightFactor: 10,
              child:textTitleAlt("Please input your date of birth")
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 96),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),

                    child: MaterialButton(onPressed: () async{
                         DateTime? newdatetime = await showDatePicker(
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100)
                          );
                         if(newdatetime == null) return;
                         setState(() {
                           date = newdatetime;
                           dob = DateFormat("yyyy-MM-dd").format(date);
                         });
                    },
                        minWidth: 360,
                        height: 80,
                        color: LibColors.color_white,
                        child: Text(
                          dob == ""? "Select date" : dob ,style: const TextStyle(
                          fontSize: 16,
                          color: LibColors.primary_color,
                        ),
                          textAlign: TextAlign.center,
                        )
                    )
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.center,

                    child: Column(
                      children: [
                        MaterialButton(onPressed: (){
                          p.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            minWidth: 360,
                            color: LibColors.color_white,
                            child: Text(
                              "Continue" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.primary_color,
                            ),
                              textAlign: TextAlign.center,
                            )
                        ),
                        MaterialButton(
                            onPressed: (){
                          p.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            child: Text(
                              "Back" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.color_white,
                            ),
                              textAlign: TextAlign.center,
                            )
                        )
                      ],
                    )
                )
              ],
            ),
          )
        ],

      ),
    );
  }
  Widget _pageFive(){
    return Container(
      padding: EdgeInsets.all(12),
      color: LibColors.primary_color,
      child: Column(
        children: [
          SizedBox( height: 120,),
          Align(

              child:textTitleAlt("Please fill this form below to complete the registration")
          ),
          SizedBox( height: 120,),
          Container(
            margin: EdgeInsets.fromLTRB(0,0,0,96),
            child: Column(
              children: [

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        hintText: 'Username',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),

                        hintStyle: TextStyle(color: LibColors.primary_color)
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: emailController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        hintText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        hintStyle: TextStyle(color: LibColors.primary_color)
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0)
                  ),

                  child:  Align(
                    alignment: Alignment.center,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      style:  TextStyle(color: LibColors.primary_color, fontSize: 16),
                      hint: Text("Gender"),
                      value: _selectedGender,
                      items: _genders.map((item) =>
                          DropdownMenuItem<String>(
                              value: item,
                            child: Align(alignment: Alignment.center,
                               // for example
                              child: Text(item,),
                            ),
                          )
                      ).toList(),
                      onChanged: (item) => setState(() {
                        _selectedGender = item;
                      }),
                    ),
                  )
                ),
                SizedBox(height: 12,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: passwordController,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: InputDecoration(

                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        hintText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),

                        hintStyle: TextStyle(color: LibColors.primary_color)
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: passwordController,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        hintText: 'Confirm Password',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),

                        hintStyle: TextStyle(color: LibColors.primary_color)
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.center,

                    child: Column(
                      children: [
                        MaterialButton(onPressed: (){
                          signUp();
                          if(FirebaseAuth.instance.currentUser != null){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()));
                          }
                        },
                            minWidth: 360,
                            color: LibColors.color_white,
                            child: Text(
                              "Register" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.primary_color,
                            ),
                              textAlign: TextAlign.center,
                            )
                        ),
                        MaterialButton(onPressed: (){
                          p.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            child: Text(
                              "Back" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.color_white,
                            ),
                              textAlign: TextAlign.center,
                            )
                        )
                      ],
                    )
                )
              ],
            ),
          )
        ],

      ),
    );

  }
  Future signUp() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim());
    }
    on FirebaseAuthException catch (e){
      print(e);
    }
    
  }
}
