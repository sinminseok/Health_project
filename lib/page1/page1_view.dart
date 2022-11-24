import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minseok_project/page2/page2_view.dart';
import 'package:minseok_project/page3/page3_view.dart';

class Page1_View extends StatelessWidget {
  Page1_View({Key? key}) : super(key: key);

  //추후 서버에서 객체로 받아온후 listbuilder에 넣어주면됨
  var data_list = ["키", "몸무게", "근육량", "체지방량", "BMI수치", "목표체중", "권장 섭취량"];

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

        children: [
          Container(
            margin: EdgeInsets.only(top: size.height*0.15),
            width: size.width*1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                    Container(
                      width: size.width * 0.2,
                      height: size.height * 0.1,

                      decoration:
                      BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                      child: Icon(Icons.person_outline,color: Colors.white,size: size.width*0.14,),

                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Page2_View()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: size.width*0.6,
                        height: size.height*0.1,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.menu,size: size.width*0.13,),
                            Text("개인 신체 수치  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Page3_View()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: size.width*0.6,
                        height: size.height*0.1,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.menu,size: size.width*0.13,),
                            Text("개인 식사 하루량  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        //네비게이터 삽입
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: size.width*0.6,
                        height: size.height*0.1,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.menu,size: size.width*0.13,),
                            Text("부위별 운동 리스트",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),)
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
