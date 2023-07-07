// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:time_machine/time_machine.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget{
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  double p = 0;
  double r = 0;
  double i = 0;
  double i1 = 0;
  double A = 0;
  int t = 0;
  Period dur = LocalDateTime.dateTime(DateTime.now()).periodSince(LocalDateTime.dateTime(DateTime.now()));
  TextEditingController start_date = TextEditingController();
  TextEditingController end_date = TextEditingController();
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();
  Duration days = Duration(days: 0);
  TextEditingController principal = TextEditingController();
  TextEditingController rate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Compound Interest'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              TextField(
                keyboardType: TextInputType.number,
                controller: principal,
                decoration: InputDecoration(
                  labelText: 'Principal',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
                ),
              ),
              SizedBox(height: 30,),
              DateTimePicker(
                type: DateTimePickerType.date,
                icon: Icon(Icons.calendar_month_rounded),
                dateLabelText: 'Start Date',
                controller: start_date,
                firstDate: DateTime(1900),
                lastDate: DateTime(2500),
              ),
              SizedBox(height: 30,),
              DateTimePicker(
                type: DateTimePickerType.date,
                icon: Icon(Icons.calendar_month_rounded),
                dateLabelText: 'End Date',
                controller: end_date,
                firstDate: DateTime(1900),
                lastDate: DateTime(2500),
              ),
              SizedBox(height: 30,),
              TextField(
                keyboardType: TextInputType.number,
                controller: rate,
                decoration: InputDecoration(
                  labelText: 'Rate of Interest',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton.icon(onPressed: (){
                setState(() {
                  i = 0.00;
                  i1 = 0.00;
                  A = 0.00;

                  start = DateTime.parse(start_date.text);
                  end = DateTime.parse(end_date.text);
                  days = end.difference(start);
                  dur = LocalDateTime.dateTime(end).periodSince(LocalDateTime.dateTime(start));

                  p = double.parse(principal.text);
                  r = double.parse(rate.text);
                  t = days.inDays;
                  while (t > 365) {
                    i = p * r * 365 / 3000;
                    i1 = i1 + i;
                    p = p + i;
                    t = t - 365;
                  }
                  i = p * r * t / 3000;
                  i1 = i1 + i;
                  A = p + i;
                  print(A);
                  print(i1);

                });
              }, icon: Icon(Icons.calculate_rounded), label: Text('Calculate Interest')),
              SizedBox(height: 20,),
              Text('Time: ' +dur.years.toString()+' Years, ' + dur.months.toString() + ' Months, ' + dur.days.toString() + ' Days '),
              Text('\nInterest: ' + i1.toStringAsFixed(3)),
              Text('\nAmount: ' + A.toStringAsFixed(3)),
            ],
          ),
        ),
      ),
    );
  }
}