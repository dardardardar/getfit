import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getfit/views/bottomnavbar.dart';
import 'package:getfit/views/home_view.dart';
import 'package:getfit/widgets/colors.dart';

class BreakfastView extends StatefulWidget {
  const BreakfastView({Key? key}) : super(key: key);

  @override
  State<BreakfastView> createState() => _BreakfastViewState();
}

class _BreakfastViewState extends State<BreakfastView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Workout'),
        backgroundColor: LibColors.primary_color,
        actions: [IconButton(onPressed: (){
          showSearch(
            context: context,
            delegate: CustomSearchDelegate()
          );
        }, icon: Icon(Icons.add))],
      ),
      floatingActionButton:  FloatingActionButton.extended(
        onPressed: () {  },
        label: Text("Save", style: TextStyle(color: LibColors.color_white,fontWeight: FontWeight.bold),),
        backgroundColor: LibColors.primary_color,
        extendedPadding: EdgeInsets.symmetric(horizontal: 160),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,

      body: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[

              infoCard(),
              Container(
                margin: EdgeInsets.all(12),
                alignment: Alignment.centerLeft,
                child: Text('Recently Workout'),
              ),
              foodCard(),
            ]),
          )),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate{

  List<String> list = [
    "a","b","c","d","e","f",
  ];

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
    for(var item in list){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(itemBuilder: (context, index){
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
      );
    },itemCount: matchQuery.length,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in list){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(itemBuilder: (context, index){
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
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

Widget foodCard() {
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
              child: Text("Jogging", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ),
            SizedBox(width: 60,),
            Container(
              margin: EdgeInsets.all(12),
              child: Text("60  kkal per 1km", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            ),
            Expanded(child: Container(),),
            GestureDetector(
              onTap: (){
                print("dddd");
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
