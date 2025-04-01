import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BmiAPP(),
    );
  }
}

class BmiAPP extends StatefulWidget {
  @override
  State<BmiAPP> createState() => BmiAPPState();
}

class BmiAPPState extends State<BmiAPP> {
  var wController = TextEditingController();
  var inchController = TextEditingController();
  var ftController = TextEditingController();
  var bmi = 0.0;
  var result = "";

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Bmi"),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bmi Calculator", style: TextStyle(fontSize: 35)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: wController,
                  decoration: InputDecoration(labelText: "Enter your weight"),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: inchController,
                  decoration: InputDecoration(labelText: "Enter your inch"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: ftController,
                  decoration: InputDecoration(labelText: "Enter your ft"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  var wt = wController.text;
                  var inch = inchController.text;
                  var ft = ftController.text;
                    
                     
                    if (wt!="" && ft!="" && inch!="") {

                      // Bmi Calculator
                      var iWt = int.parse(wt);
                      var iInch = int.parse(inch);
                      var iFt = int.parse(ft);

                      var inches = (iFt * 12) + iInch;

                      var tCm = inches * 2.54;

                      var tM = tCm / 100;

                      bmi = iWt * (tM * tM);

                      setState(() {
                         result = "Your Bmi,$bmi";
                      });

                     

                     


                    } else {
                     setState(() {
                       result="please fill all empty textfiels ";
                       
                     });
                      
                    }
                  },
                  child: Text("Calculate"),
                ),
              
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}
