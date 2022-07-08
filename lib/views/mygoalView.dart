import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getfit/widgets/colors.dart';
import '../widgets/text_widgets.dart';
import 'bottomnavbar.dart';

class MygoalView extends StatefulWidget {
  const MygoalView({Key? key}) : super(key: key);

  @override
  State<MygoalView> createState() => _MygoalViewState();
}

class _MygoalViewState extends State<MygoalView> {
  PageController p = PageController();
  int _goalCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('My Goal'),
        backgroundColor: LibColors.primary_color,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        // color: LibColors.primary_color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                heightFactor: 2,
                child: Text(
                  "Select Your Goal",
                  style: TextStyle(color: Colors.black),
                )),
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _goalCategory = 0;
                                });
                                p.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              minWidth: 360,
                              height: 80,
                              color: LibColors.primary_color,
                              child: Text(
                                "DIET",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                textAlign: TextAlign.center,
                              )),
                          SizedBox(
                            height: 16,
                          ),
                          MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _goalCategory = 1;
                                });
                                p.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              minWidth: 360,
                              height: 80,
                              color: LibColors.primary_color,
                              child: Text(
                                "MAINTAIN WEIGHT",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                textAlign: TextAlign.center,
                              )),
                          SizedBox(
                            height: 16,
                          ),
                          MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _goalCategory = 2;
                                });
                                p.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              minWidth: 360,
                              height: 80,
                              color: LibColors.primary_color,
                              child: Text(
                                "LOSE WEIGHT",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                textAlign: TextAlign.center,
                              )),
                          SizedBox(
                            height: 90,
                          ),
                        ],
                      ))
                ],
              ),
            ),
            // Container(
            //   margin: EdgeInsets.all(8),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Align(
            //           alignment: Alignment.center,
            //           child: Column(
            //             children: [
            //               MaterialButton(
            //                   onPressed: () {
            //                     p.previousPage(
            //                         duration: Duration(milliseconds: 500),
            //                         curve: Curves.easeIn);
            //                   },
            //                   child: Text(
            //                     "Back",
            //                     style: const TextStyle(
            //                       fontSize: 16,
            //                       color: LibColors.color_white,
            //                     ),
            //                     textAlign: TextAlign.center,
            //                   ))
            //             ],
            //           ))
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
