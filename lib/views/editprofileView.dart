import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getfit/widgets/colors.dart';
import 'package:intl/intl.dart';
import '../controller/user_controller.dart';
import '../models/user_model.dart';
import 'bottomnavbar.dart';

class editprofileView extends StatefulWidget {
  const editprofileView({Key? key}) : super(key: key);

  @override
  State<editprofileView> createState() => _editprofileViewState();
}


class _editprofileViewState extends State<editprofileView> {
  final userdata = UserController().readUserDatabyId();

  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final displayNameController = TextEditingController();

  DateTime date = DateTime.now();
  String dob = "";
  bool _isGenderChanged = false;
  List<String> _genders = ['Male','Female'];
  String? _selectedGender;

  int _gender = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: LibColors.primary_color,
      ),

      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
      body:FutureBuilder<UserModel?>(
        future: userdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _data = snapshot.data!;
            return  Container(
                margin: EdgeInsets.all(12),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                    child: Column(

                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          width: 350,
                          height: 50,
                          child: TextField(
                            controller: displayNameController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: _data.displayName.toString(),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.create),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          width: 350,
                          height: 50,
                          child: TextField(
                            controller: heightController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: _data.height.toString() + " CM",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.create),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          width: 350,
                          height: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: weightController,
                            decoration: InputDecoration(
                              hintText: _data.weight.toString() + " KG",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.create),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          width: 350,
                          height: 50,

                          child: OutlinedButton(onPressed: () async{
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

                            style: OutlinedButton.styleFrom(

                              side: BorderSide(color: Colors.black45),
                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(4),
                              ),


                            ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 24,
                              child: Icon(Icons.create,color: Colors.black45),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 90),
                                child: Text(dob == "" ? DateFormat.yMMMMd().format(_data.dob) : dob,style: TextStyle(color: Colors.black45, fontSize: 16),),
                              )
                            ],
                          )


                          ),
                          // child: Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(4),
                          //     border: Border.all(
                          //       color: Colors.grey
                          //     )
                          //   ),
                          //   child: Text(DateFormat.yMMMMd().format(_data.dob), style: TextStyle(
                          //     color: Colors.grey
                          //   ),),
                          // )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          width: 350,
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.black45)
                          ),
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            style:  TextStyle(color: LibColors.primary_color, fontSize: 16),
                            hint: Center(child: Text(_data.gender == 0 ? "Male" : "Female"),),
                            iconSize: 0,
                            decoration: InputDecoration(
                              border: InputBorder.none,

                              icon: Visibility (visible:true, child: Icon(Icons.create,color: Colors.black45,)),
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
                              _isGenderChanged = true;
                              if(item == "Male"){
                                _gender = 0;
                              }
                              else{
                                _gender = 1;
                              }
                            }),

                          ),
                          // child: TextField(
                          //   textAlign: TextAlign.center,
                          //   decoration: InputDecoration(
                          //     hintText: _data.gender == 0 ? "Male" : "Female",
                          //     border: OutlineInputBorder(),
                          //     prefixIcon: Icon(Icons.create),
                          //   ),
                          // ),
                        ),
                       Container(
                         constraints: BoxConstraints(
                           minHeight: 380
                         ),
                       ),

                       SizedBox(
                         width: double.infinity,
                         child:  ElevatedButton(
                           onPressed: (){
                             final _name = displayNameController.text.trim().isEmpty ? _data.displayName :  displayNameController.text.trim();
                             final _weight = weightController.text.trim().isEmpty ? _data.weight :  int.parse(weightController.text.trim());
                             final _height = heightController.text.trim().isEmpty ? _data.height :  int.parse(heightController.text.trim());
                             print(_gender);
                             final _model = UserModel(
                                 email: _data.email,
                                 displayName: _name,
                                 goalCategories: _data.goalCategories,
                                 gender: _isGenderChanged ? _gender : _data.gender,
                                 dob: date,
                                 height: _height,
                                 weight: _weight,
                                 roles: _data.roles,
                                 avatarUrl: _data.avatarUrl);
                             UserController().updateUserData(_model);
                           } ,
                           child: Text("Save"),
                           style: ElevatedButton.styleFrom(
                             shape: StadiumBorder(),
                             primary: LibColors.primary_color,
                             padding: EdgeInsets.all(16),
                           ),
                         )
                         ,)

                      ],
                      
                    )));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

    );
  }


}

Widget editprofileCard() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Container(
                    width: 170,
                    child: Text(
                      'Bambang Atkinson',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: const [
                  Image(
                      image: AssetImage("assets/images/editicon.png"),
                      fit: BoxFit.cover),
                ],
              ),
            ),
          ],
        ),
        // color: LibColors.second_color,
      ));
}
