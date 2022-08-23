import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/controller/home_controller.dart';
import 'package:getfit/models/food_model.dart';
import 'package:getfit/views/bottomnavbar.dart';
import 'package:getfit/views/home_view.dart';
import 'package:getfit/widgets/colors.dart';
import 'package:getfit/widgets/snackbar_widgets.dart';

import '../models/user_food_model.dart';
import '../models/user_info_model.dart';
import '../models/user_workout_model.dart';

class BreakfastView extends StatefulWidget {
  final String tag;

  const BreakfastView({Key? key, required this.tag}) : super(key: key);

  @override
  State<BreakfastView> createState() => _BreakfastViewState();
}

List<UserFoodModel> temp = [];
String tt = 'sdds';
bool isStateChanged = false;

class _BreakfastViewState extends State<BreakfastView> {
  var data = HomeController().getFoodList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FoodModel>>(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var delegate = CustomSearchDelegate(snapshot.data!, widget.tag);
          return Scaffold(
            appBar: AppBar(
              title: Text('Add Food'),
              backgroundColor: LibColors.primary_color,
              actions: [
                IconButton(
                    onPressed: () async {
                      await showSearch(context: context, delegate: delegate);
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            floatingActionButton: saveBtn(isStateChanged),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: listBuilder(),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget listBuilder() {
    return StreamBuilder<List<UserFoodModel>>(
      stream: HomeController().getFoods(tag: widget.tag),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return Container(
              margin: EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  infoCard(),
                  Container(
                    margin: EdgeInsets.all(12),
                    alignment: Alignment.centerLeft,
                    child: Text('Recently Foods'),
                  ),
                  ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return foodCard(data[index]);
                    },
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  ),
                  SizedBox(
                    height: 80,
                  )
                ]),
              ));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget foodCard(UserFoodModel model) {
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
                  child: Text(
                    model.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: Text(
                    model.calories.toString() + " kkal",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                GestureDetector(
                  onTap: () {
                    HomeController().deleteFoods(model).then((value) {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.clear),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    "Karbohidrat",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    model.carbohydrates.toString() + " g",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    "Protein",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    model.protein.toString() + " g",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    "Lemak",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    model.fat.toString() + " g",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget saveBtn(bool isStateChanged) {
    return FloatingActionButton.extended(
      onPressed: () {
        SnackBarWidgets.success("Saved");
      },
      label: Text(
        "Save",
        style: TextStyle(
            color: LibColors.color_white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: LibColors.primary_color,
      extendedPadding: EdgeInsets.symmetric(horizontal: 160),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<FoodModel> list2 = [];
  String tag = '';

  CustomSearchDelegate(this.list2, this.tag);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in list2) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.name);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
            title: GestureDetector(
          onTap: () {
            print(result);
          },
          child: Text(result),
        ));
      },
      itemCount: matchQuery.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in list2) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.name);
      }
    }
    return ListView.builder(
      key: UniqueKey(),
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return ListTile(
                title: GestureDetector(
              onTap: () {
                var data = UserFoodModel(
                    name: list2[index].name,
                    calories: list2[index].calories,
                    fat: list2[index].fat,
                    protein: list2[index].protein,
                    carbohydrates: list2[index].carbohydrates,
                    uid: FirebaseAuth.instance.currentUser!.uid,
                    createdOn: DateTime.now(),
                    tag: tag);
                HomeController().addFoods(data);
                print(temp.length);
                close(context, result);
              },
              child: Text(result),
            ));
          },
        );
      },
      itemCount: matchQuery.length,
    );
  }
}

Widget infoCard() {
  return FutureBuilder<UserInfoModel>(
    future: HomeController().getUserInfo(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        var data2 = snapshot.data!;
        return StreamBuilder<List<UserFoodModel>>(
          stream: HomeController().getFoods(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              var eaten = 0;
              for (var item in data) {
                eaten += item.calories;
              }
              var kcal = data2.targetCalories - eaten;
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
                              eaten.toString() + ' / gr',
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
                              kcal.toString() +
                                  ' / gr',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<List<UserWorkoutModel>>(
                        stream: HomeController().getExercises(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var burned = 0;
                            for (var item in snapshot.data!) {
                              burned += item.calories;
                            }

                            return Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'BURNED',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    burned.toString() + ' / gr',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ],
                  ));
            }
            return Container();
          },
        );
      }
      return Container();
    },
  );
}
