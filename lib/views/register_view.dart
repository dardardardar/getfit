import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:getfit/controller/user_controller.dart';
import 'package:getfit/views/profile.dart';
import 'package:getfit/widgets/colors.dart';
import 'package:intl/intl.dart';
import '../models/user_model.dart';
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
  int _goalCategory = 0;
  int roles = 0;
  int _gender = 0;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final displayNameController = TextEditingController();


  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    heightController.dispose();
    weightController.dispose();
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
              _pageSix(),
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
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),

                            ),
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
                          setState(() {
                            _goalCategory = 0;
                          });
                          p.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            minWidth: 360,
                            height: 80,
                            color: LibColors.color_white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),

                            ),
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
                          setState(() {
                            _goalCategory = 1;
                          });
                          p.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            minWidth: 360,
                            height: 80,
                            color: LibColors.color_white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),

                            ),
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
                          setState(() {
                            _goalCategory = 2;
                          });
                          p.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            minWidth: 360,
                            height: 80,
                            color: LibColors.color_white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),

                            ),
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
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
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
                      controller: weightController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Weight (kg)',
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(color: LibColors.danger_red),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintStyle: TextStyle(color: LibColors.primary_color)
                      ),
                      validator: (value){
                        if(value == null){
                          return 'Please fill your weight';
                        }
                        if(num.tryParse(value) == null){
                          return 'Please input valid weight';
                        }if(num.parse(value) <= 0){
                          return 'Please input valid weight';
                        }
                        else{
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 12,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: heightController,
                      decoration: InputDecoration(
                          hintText: 'Height (cm)',
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(color: LibColors.danger_red),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintStyle: TextStyle(color: LibColors.primary_color)
                      ),
                      validator: (value){
                        if(value == null){
                          return 'Please fill your weight';
                        }
                        if(num.tryParse(value) == null){
                          return 'Please input valid weight';
                        }
                        if(num.parse(value) <= 0){
                          return 'Please input valid weight';
                        }
                        else{
                          return null;
                        }
                      },
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
                            final isValidated = formKey.currentState!.validate();
                            if(isValidated){
                              p.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn
                              );
                            }
                          },
                              minWidth: 360,
                              color: LibColors.color_white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),

                              ),
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
      )
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
                              lastDate: DateTime.now()
                          );
                         if(newdatetime == null) return;
                         setState(() {
                           date = newdatetime;
                           dob = DateFormat.yMMMMd().format(date);
                         });
                    },
                        minWidth: 360,
                        height: 80,
                        color: LibColors.color_white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),

                        ),
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
                          if(dob != ""){
                            p.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn
                            );
                          }
                        },
                            minWidth: 360,
                            color: LibColors.color_white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),

                            ),
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
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SingleChildScrollView(
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
                        controller: displayNameController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            hintText: 'Username',
                            fillColor: Colors.white,
                            filled: true,
                            errorStyle: TextStyle(color: LibColors.danger_red),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),

                            hintStyle: TextStyle(color: LibColors.primary_color)
                        ),
                        validator: (value){
                          if(value == null){
                            return 'Please fill your username';
                          }
                          if(value.length < 3){
                            return "Username at least must 3 characters long";
                          }
                          return null;
                        },
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
                            errorStyle: TextStyle(color: LibColors.danger_red),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            hintStyle: TextStyle(color: LibColors.primary_color)
                        ),
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
                    ),

                    Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        width: 320,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)
                        ),

                        child:  Align(
                          alignment: Alignment.center,
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            style:  TextStyle(color: LibColors.primary_color, fontSize: 16),
                            hint: Text("Gender"),
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: LibColors.danger_red),
                            ),
                            value: _selectedGender,
                            validator: (value){
                              if(value == null){
                                return "Please choose your gender";
                              }
                              return null;
                            },
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
                              if(item == "Male"){
                                _gender = 0;
                              }
                              else{
                                _gender = 1;
                              }
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
                            errorStyle: TextStyle(color: LibColors.danger_red),
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            hintText: 'Password',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),

                            hintStyle: TextStyle(color: LibColors.primary_color)
                        ),
                        validator: (value){
                          if(value == null){
                            return 'Please fill your new password';
                          }
                          if(value.length < 8){
                            return "Password at least must 8 characters long";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 32),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(color: LibColors.danger_red),
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            hintText: 'Confirm Password',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            hintStyle: TextStyle(color: LibColors.primary_color)
                        ),
                        validator: (value){
                          if(value != passwordController.text.trim()){
                            return "Password confirmation does not match ";
                          }
                          return null;
                        },
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
                              final isValidated = formKey.currentState!.validate();
                              if(isValidated){
                                final user = UserModel(
                                  uid: "",
                                  email: emailController.text.trim(),
                                  displayName: displayNameController.text.trim(),
                                  goalCategories: _goalCategory,
                                  gender: _gender,
                                  dob: date,
                                  height: int.parse(heightController.text.trim()),
                                  weight: int.parse(weightController.text.trim()),
                                  roles: roles,
                                  avatarUrl: ""
                                );
                                UserController().signUp(emailController.text.trim(), passwordController.text.trim(), user);
                                Navigator.pop(context);
                              }

                            },
                                minWidth: 360,
                                color: LibColors.color_white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),

                                ),
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
        )
      )
    );

  }
  Widget _pageSix(){
    return Container(
      padding: EdgeInsets.all(12),
      color: LibColors.primary_color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              heightFactor: 12,
              child:textTitleAlt("Who are you?")
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
                          setState(() {
                            roles = 1;
                          });
                          p.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            minWidth: 360,
                            height: 80,
                            color: LibColors.color_white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),

                            ),
                            child: Text(
                              "CONSULTANT" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.primary_color,
                            ),
                              textAlign: TextAlign.center,
                            )
                        ),
                        SizedBox(height: 16,),
                        MaterialButton(onPressed: (){
                          setState(() {
                            roles = 0;
                          });
                          p.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                            minWidth: 360,
                            height: 80,
                            color: LibColors.color_white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),

                            ),
                            child: Text(
                              "USER" ,style: const TextStyle(
                              fontSize: 16,
                              color: LibColors.primary_color,

                            ),
                              textAlign: TextAlign.center,
                            )
                        ),
                        SizedBox(height: 16,),

                        SizedBox(height: 200,),
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
}
