import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2_View extends StatelessWidget {
   Page2_View({Key? key}) : super(key: key);


  //추후 서버에서 객체로 받아온후 listbuilder에 넣어주면됨
  var data_list = ["키","몸무게","근육량","체지방량","BMI수치","목표체중","권장 섭취량"];

  @override
  Widget build(BuildContext context) {
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
                  "개인 신체 수치",
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
          // Container(
          //   width: size.width*0.7,
          //   height: size.height*0.5,
          //     decoration: BoxDecoration(
          //          color: Colors.white,
          //         borderRadius: BorderRadius.circular(10)
          //     )
          //
          // ),
          Container(
            width: size.width * 0.7,
            height: size.height * 0.5,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
                itemCount: data_list.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Icon(Icons.circle,size: 10,color: Colors.black,),
                    ),
                    title: Text("${data_list[index]} : "),
                  );
                })
          )
        ],
      ),
    );
  }
}
