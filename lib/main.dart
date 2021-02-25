import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightSliderValue = 150;
  double _weightSliderValue = 80;
  var message ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("BMI Calculator"),backgroundColor:Colors.red,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("BMI Calculator",style:TextStyle(fontSize: 32, color:Colors.red)),
            SizedBox(height:8),
            Image.asset('assets/heart-health.jpg'),
            SizedBox(height:8),
            Text("We care about your health"),
            SizedBox(height:8),
            Text("Height: ${_heightSliderValue.round()}cm"),
               Slider(
            value: _heightSliderValue,
            min: 100,
            max: 220,

            label: _heightSliderValue.round().toString(),
            onChanged: (double value) {
            setState(() {
              _heightSliderValue = value;
            });
            },
            ),
            SizedBox(height:8),
            Text("Weight: ${_weightSliderValue.round()}kg"),
            Slider(
            value: _weightSliderValue,
            min: 60,
            max: 160,

            label: _weightSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
               _weightSliderValue = value;
              });
              }
            ),
            SizedBox(height:8),
            Text(message),
            FlatButton.icon(onPressed: (){
              var bmi= _weightSliderValue / pow((_heightSliderValue / 100),2);
              var status ="";
              print(bmi.round());

              if (bmi <18){
                status= "underweight";
              }
              else if (bmi <25){
                status= "Normal";
              }
              else if(bmi<30){
                status= "Overweight";
              }
              else{
                status= "Obese";
              }
            setState(() {
              message = "Your BMI is ${bmi.round()} and you are $status";
            });

              
            }, icon: Icon(Icons.favorite), label: Text("Calculate BMI"),color:Colors.red,textColor: Colors.white,)
          ],
        ),
      ),
    );
  }
}
