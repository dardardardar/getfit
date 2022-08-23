import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/controller/home_controller.dart';
import 'package:getfit/models/food_model.dart';
import 'package:getfit/models/workout_model.dart';
import 'package:getfit/views/bottomnavbar.dart';
import 'package:getfit/views/home_view.dart';
import 'package:getfit/widgets/colors.dart';
import 'package:getfit/widgets/snackbar_widgets.dart';

import '../models/user_workout_model.dart';

class ExerciseView extends StatefulWidget {
  const ExerciseView({Key? key}) : super(key: key);

  @override
  State<ExerciseView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {
  var data = HomeController().getExerciseList();
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<WorkoutModel>>(
      future: data,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Scaffold(
            appBar: AppBar(
              title: Text('Add Workout'),
              backgroundColor: LibColors.primary_color,
              actions: [IconButton(onPressed: (){
                showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(snapshot.data!)
                );
              }, icon: Icon(Icons.add))],
            ),
            floatingActionButton:  FloatingActionButton.extended(
              onPressed: () { SnackBarWidgets.success("Saved"); },
              label: Text("Save", style: TextStyle(color: LibColors.color_white,fontWeight: FontWeight.bold),),
              backgroundColor: LibColors.primary_color,
              extendedPadding: EdgeInsets.symmetric(horizontal: 160),
            ),
            floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,

            body:listBuilder(),
          );
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }


  Widget listBuilder(){
    return StreamBuilder<List<UserWorkoutModel>>(
      stream: HomeController().getExercises(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          var data = snapshot.data!;
          return
            Container(
                margin: EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    infoCard(),
                    Container(
                      margin: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Recently Workout'),
                    ),
                    ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context,index){
                        return workoutCard(data[index]);
                      },
                      physics : NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    ),
                    SizedBox(height: 80,)
                  ]),
                ));
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
  Widget workoutCard(UserWorkoutModel model) {
    var str = model.name.split("-");
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: LibColors.color_white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(12),
                  child: Text(str[0], style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),
                SizedBox(width: 60,),
                Container(
                  margin: EdgeInsets.all(12),
                  child: Text(str[1], style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                ),
                Expanded(child: Container(),),
                GestureDetector(
                  onTap: (){
                    HomeController().deleteExercises(model);
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.clear),
                  ),
                ),
              ],
            ),

          ],
        )
    );
  }

}

class CustomSearchDelegate extends SearchDelegate{


  List<WorkoutModel> list2 = [];
  CustomSearchDelegate(this.list2);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = "";
      }, icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in list2){
      if(item.name.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item.name);
      }
    }
    return ListView.builder(itemBuilder: (context, index){
      var result = matchQuery[index];
      return ListTile(
          title: GestureDetector(
            onTap: (){
              print(result);
            },
            child: Text(result),
          )
      );
    },itemCount: matchQuery.length,);
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in list2){
      if(item.name.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item.name);
      }
    }
    return ListView.builder(
      key: UniqueKey(),
      itemBuilder: (context, index){

        var result = matchQuery[index];
        return StatefulBuilder(
          builder: (BuildContext context,StateSetter setState) {

            return ListTile(
                title: GestureDetector(
                  onTap: (){
                    var data =  UserWorkoutModel(
                        name: list2[index].name,
                        calories: list2[index].calories,
                        uid: FirebaseAuth.instance.currentUser!.uid,
                        createdOn: DateTime.now(),
                       );
                    HomeController().addExercises(data);
                    close(context, result);
                  },
                  child: Text(result),
                )
            );
          },
        );
      },itemCount: matchQuery.length,);
  }

}

Widget infoCard() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    margin: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: LibColors.second_color,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 5), // changes position of shadow
        ),
      ],
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: [
              Text(
                'EATEN',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '500 / gr',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'KCAL LEFT',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '1500 / gr',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'BURNED',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '300 / gr',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


