import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var BMI;
  var category;

  void _calculateBMI(double weight,double height){
      height = height / 100; // converting height into meter
      BMI = (weight / (height * height)).toStringAsFixed(2) ;
      BMI = double.parse(BMI);


      switch(BMI){
        case <18.5:
          category='Underweight';
          break;
        case (>=18.5 && <25):
          category='Normal';
          break;
        case (>=25 && <30):
          category='Overweight';
          break;
        case (>=30 && <35):
          category='Moderately Obese';
          break;
        case (>=35 && <40):
          category='Severely Obese';
          break;
        default:
          category='Morbidly Obese';
      }

      setState(() {
        BMI;
        category;
        weightController.text;
        heightController.text;
      });
  }

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          backgroundColor: Colors.green,
        ),
        body:Container(
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg2.jpg.crdownload"),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Text('${category!= null ? category:''}',
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle:FontStyle.italic,
                        color: Colors.blueAccent
                      ),
                  )
                ),
                TextFormField(
                  controller: weightController,
                  decoration: InputDecoration(
                      hintText:'Enter Weight',
                      suffixText: 'Kg',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                    )
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: heightController,
                  decoration: InputDecoration(
                      hintText: 'Enter Height ',
                      suffixText: 'Cm',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: Colors.green,
                              width: 2
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      )
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      _calculateBMI(double.parse(weightController.text),double.parse(heightController.text));
                    } ,
                    child: Text('Calculate')
                )
              ],
        ),
          ),
        ) ,
      ),
    );
  }
}