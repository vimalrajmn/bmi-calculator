import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Color(0xFF12a644)
  ),
  home: MyApp(),
  debugShowCheckedModeBanner: false,
)
);
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height=100.0;
  double _weight=50.0;
  int _bmi=0;
  String _condition='Select Data';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height*0.40,
            width: double.infinity,
            decoration: new BoxDecoration(color: Color(0xFF12a644)),
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("BMI",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold, fontSize: 60.0),),
                Text("Calculator",style: TextStyle(color: Colors.red, fontSize: 40.0),),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    child:Text("$_bmi", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 50.0),textAlign: TextAlign.right,),
                  ),
                ),
                RichText(text: TextSpan(
                  text: "Condition:  ",
                  style: TextStyle(
                    color: Colors.red, fontSize: 30.0
                  ),
                  children: <TextSpan>[
                TextSpan(
                text: "$_condition",
                    style: TextStyle(
                        color: Colors.red, fontSize: 30.0, fontWeight: FontWeight.bold
                    ),)
                  ]
                ),)
              ],
            ),),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height*0.03,),
                  Text("Choose Data", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 40.0),),
                  SizedBox(height: size.height*0.03,),
                  RichText(text: TextSpan(
                      text: "Height:  ",
                      style: TextStyle(
                          color: Colors.black, fontSize: 30.0
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "$_height cm",
                          style: TextStyle(
                              color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold
                          ),)
                      ]
                  ),),
                  SizedBox(height: size.height*0.03,),
                  Slider(value: _height,
                      min: 0,
                      max: 250,
                      onChanged: (height){
                      setState(() {
                         _height=height;
                      });
                      },
                      divisions: 250,
                      label: "$_height",
                      activeColor: Color(0xFF403f3d),
                      inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height*0.03,),
                  RichText(text: TextSpan(
                      text: "Weight:  ",
                      style: TextStyle(
                          color: Colors.black, fontSize: 30.0
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "$_weight kg",
                          style: TextStyle(
                              color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold
                          ),)
                      ]
                  ),),
                  SizedBox(height: size.height*0.03,),
                  Slider(value: _weight,
                    min: 0,
                    max: 300,
                    onChanged: (weight){
                      setState(() {
                        _weight=weight;
                      });
                    },
                    divisions: 300,
                    label: "$_weight",
                    activeColor: Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height*0.03,),
                  Container(
                    width: size.width*0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            _bmi=(_weight/((_height/100)*(_height/100))).round().toInt();
                            if(_bmi>=18.5 && _bmi<=25) {_condition="Normal";}
                            else if(_bmi>=25 && _bmi<=30){_condition="Overweight";}
                            else if(_bmi>=30){_condition="Obesity";}
                            else{_condition="Underweight";}
                          });
                        },
                        child: Text("Calculate",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 30.0),),

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ),
      );
  }
}

