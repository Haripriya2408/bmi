
import 'package:flutter/material.dart';

void main()=> runApp(
  MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepOrange

    ),
    home: const MyApp(),
    debugShowCheckedModeBanner: false,
  )
);
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double h=160.0;
  double w=60.0;
  int bmi=0;
  String condition="Select Data";
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(height: size.height*0.40,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.deepOrange
          ),
          padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 10.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("BMI",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                  )),
              const Text("Calculator",
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              )),
              SizedBox(
                width: double.infinity,
                child: Text("$bmi",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 44.0,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              RichText(text:  TextSpan(
                text: "Condition :",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,

                ),
                children: <TextSpan>[
                  TextSpan(
                    text: " $condition",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,

                    ),
                  )
                ]

              ))
            ],
          ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height*0.03,),
                Text("Choose Data",style: TextStyle(color: Colors.deepOrange, fontSize: 30.0, fontWeight: FontWeight.bold,),
                ),
                SizedBox(height: size.height*0.03,),
                RichText(text: TextSpan(
                  text: "Height :",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xFF403f3d),

                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "$h cm",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Color(0xFF403f3d),
                        fontWeight: FontWeight.bold,

                      ),
                    )
                  ],),),
                SizedBox(height: size.height*0.03,),
                Slider(value: h,
                    min: 0,
                    max: 250, onChanged: (height) {
                 setState(() {
                   h=height;
                 });
                  },
                  divisions: 250,
                  label:"$h",
                  activeColor: Color(0xFF403f3d),
                  inactiveColor: Colors.grey,
                    ),
                SizedBox(height: size.height*0.03,),
                RichText(text: TextSpan(
    text: "Weight :",
    style: TextStyle(
    fontSize: 25.0,
    color: Color(0xFF403f3d),

    ),
    children: <TextSpan>[
    TextSpan(
    text: "$w kg",
    style: TextStyle(
    fontSize: 25.0,
    color: Color(0xFF403f3d),
    fontWeight: FontWeight.bold,

    ),
    )
    ],),),
                Slider(value: w,
                  min: 0,
                  max: 200, onChanged: (weight) {
                    setState(() {
                      w=weight;
                    });
                  },
                  divisions: 200,
                  label:"$w",
                  activeColor: Color(0xFF403f3d),
                  inactiveColor: Colors.grey,
                ),
                SizedBox(height: size.height*0.03,),
                SizedBox(
                    width: size.width*0.8,
                    child: ClipRRect(
                     borderRadius: BorderRadius.circular(30),
                      child: Align(
                        alignment: Alignment.center,
                     child: Container(
                       height: 150,
                     width: 250,
                     child: FloatingActionButton(

                        onPressed:(){
                          setState(() {
                            bmi=(w/((h/100)*(h/100))).round().toInt();
                           if(bmi>=18.5 && bmi<=25){
                             condition="Normal";
                           }
                           else if(bmi>=25 && bmi<=30){
                             condition="Over Weight";
                           }
                           else if(bmi>30 ){
                             condition="Obesity";
                           }
                           else{
                             condition="Under Weight";
                           }
                          });
                        },
                      child: Text("Calculate",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w300),),
                      backgroundColor: Colors.deepOrange,
                      ),
                     ),

          ),


                    ),
                  )



        ],
      ),
    )

    ]))
    );
  }
}


