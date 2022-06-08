import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String _output = "0";
  int num1 = 0;
  int num2 = 0;
  String operand = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(output,
                style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),),
              ),
            )),
            GridView.count(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              crossAxisCount: 4,
              children: <Widget>[
                CalcButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  text: '7',
                  onTap: (){
                    pressNumber(7);
                  },),
                CalcButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  text: '8',
                  onTap: (){
                    pressNumber(8);
                  },),
                CalcButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  text: '9',
                  onTap: (){
                    pressNumber(9);
                  },),
                CalcButton(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  foregroundColor: Theme.of(context).primaryColorLight,
                  text: '/',
                  onTap: (){
                    pressOperator('/');
                  },),
                CalcButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  text: '4',
                  onTap: (){
                    pressNumber(5);
                  },),
                CalcButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  text: '5',
                  onTap: (){
                    pressNumber(5);
                  },),
                CalcButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  text: '6',
                  onTap: (){
                    pressNumber(6);
                  },),
                CalcButton(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  foregroundColor: Theme.of(context).primaryColorLight,
                  text: 'X',
                  onTap: (){
                    pressOperator('X');
                  },),
                CalcButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  text: '1',
                  onTap: (){
                    pressNumber(1);
                  },),
                CalcButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  text: '2',
                  onTap: (){
                    pressNumber(2);
                  },),
                CalcButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  text: '3',
                  onTap: (){
                    pressNumber(3);
                  },),
                CalcButton(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  foregroundColor: Theme.of(context).primaryColorLight,
                  text: '-',
                  onTap: (){
                    pressOperator('-');
                  },),
                CalcButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  text: 'C',
                  onTap: (){
                    setState(() {
                      output='0';
                    });
                  },),
                CalcButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  text: '0',
                  onTap: (){
                    pressNumber(0);
                  },),
                CalcButton(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  text: '=',
                  onTap: (){
                    pressOperator('=');
                  },),
                CalcButton(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  foregroundColor: Theme.of(context).primaryColorLight,
                  text: '+',
                  onTap: (){
                    pressOperator('+');
                  },),
              ],
            )
        ]),
    );
  }

  void pressNumber(int number) {
    setState(() {
      if (output == '0') {
        output = '$number';
      } else {
        output = '$output$number';
      }
    });
  }

  pressOperator(String buttonText) {
    if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = int.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == "=") {
      num2 = int.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    setState(() {
      output = double.parse(_output).toString();
    });
  }
  }




class CalcButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  IconData? icon;
  final void Function() onTap;

  CalcButton({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        child: Center(
          child: Text(text,
          style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(color: foregroundColor),)
        )),
      );
  }
}