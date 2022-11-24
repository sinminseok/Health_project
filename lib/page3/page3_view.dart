import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Page3_View extends StatefulWidget {
  const Page3_View({Key? key}) : super(key: key);

  @override
  _Page3_ViewState createState() => _Page3_ViewState();
}

class _Page3_ViewState extends State<Page3_View> {
  bool selected_breakfast = true;
  bool selected_lunch = false;
  bool selected_dinner = false;
  final catigory_list = ["카테고리1", "카테고리2", "케테고리3", "카테고리4"];
  var color_list = [Colors.red, Colors.yellow, Colors.blue, Colors.white];

  @override
  Widget build(BuildContext context) {
    var dataMap = <String, double>{
      catigory_list[0]: 5,
      catigory_list[1]: 5,
      catigory_list[2]: 5,
      catigory_list[3]: 5,
    };

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade700,
        elevation: 0,
        title: Text(
          "운동보조프로그램",
          style: TextStyle(
            color: Colors.white,
            //색상
            fontFamily: 'Anton',
            fontSize: 25,
            //글자 크기
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            //굵기
            decoration: TextDecoration.none, //뭔진 모르는데 있어야함.
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 40,
                ),
                Text(
                  "하루 식사량",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                    //색상
                    //색상
                    fontFamily: 'Anton',
                    fontSize: 25,
                    //글자 크기
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    //굵기
                    decoration: TextDecoration.none,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: size.width * 0.9,
            height: size.height * 0.1,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * 0.18,
                  height: size.height * 0.05,
                ),
                Container(
                  width: size.width * 0.18,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      color: selected_breakfast != true
                          ? Colors.grey.shade500
                          : Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(6)),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selected_breakfast = true;
                        selected_lunch = false;
                        selected_dinner = false;
                      });
                    },
                    child: Center(
                      child: Text(
                        "아침식사",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.18,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      color: selected_lunch != true
                          ? Colors.grey.shade500
                          : Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(6)),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selected_breakfast = false;
                        selected_lunch = true;
                        selected_dinner = false;
                      });
                    },
                    child: Center(
                      child: Text(
                        "점심식사",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.18,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      color: selected_dinner != true
                          ? Colors.grey.shade500
                          : Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(6)),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selected_breakfast = false;
                        selected_lunch = false;
                        selected_dinner = true;
                      });
                    },
                    child: Center(
                      child: Text(
                        "저녁식사",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: size.width * 0.9,
            height: size.height * 0.4,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PieChart(
                    //카테고리별 생상지정
                    colorList: [
                      Colors.red,
                      Colors.yellow,
                      Colors.blue,
                      Colors.white
                    ],
                    dataMap: dataMap,
                    animationDuration: Duration(milliseconds: 200),
                    chartLegendSpacing: 90,
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    ringStrokeWidth: 10,
                    legendOptions: LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.right,
                      legendTextStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: false,
                      showChartValues: true,
                      showChartValuesInPercentage: false,
                      showChartValuesOutside: false,
                      decimalPlaces: 1,
                    ),
                  ),
                ),
                //기존 차트에 딸려있는 목록을 지울수 없어 스택으로 감싸고 직접 카테고리 목록 구현
                Container(
                    margin: EdgeInsets.only(
                        left: size.width * 0.4, top: size.height * 0.05),
                    width: size.width * 0.6,
                    height: size.height * 0.3,
                    color: Colors.grey.shade200,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 0.3),
                          ),
                          width: size.width * 0.45,
                          height: size.height * 0.05,
                          margin: EdgeInsets.only(top: 10,bottom: 5),
                          child: Center(
                              child: Text(
                                "아침식사:900",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 0.3),
                          ),
                          width: size.width * 0.45,
                          height: size.height * 0.05,
                          margin: EdgeInsets.only(top: 10,bottom: 5),
                          child: Center(
                              child: Text(
                                "점심식사:900",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 0.3),
                          ),
                          width: size.width * 0.45,
                          height: size.height * 0.05,
                          margin: EdgeInsets.only(top: 10,bottom: 5),
                          child: Center(
                              child: Text(
                                "저녁식사:900",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 0.3),
                          ),
                          width: size.width * 0.45,
                          height: size.height * 0.05,
                          margin: EdgeInsets.only(top: 10,bottom: 5),
                          child: Center(
                              child: Text(
                                "아침식사:900",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )),
                        ),
                        LinearPercentIndicator(
                          center: Text(
                            "",

                          ),
                          barRadius: const Radius.circular(10),
                          width: size.width*0.45,
                          lineHeight: 15,

                          //퍼센테이지 값
                          percent: 0.5,
                          backgroundColor: Colors.grey.shade50,
                          progressColor: Colors.green,
                        ),

                        
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
