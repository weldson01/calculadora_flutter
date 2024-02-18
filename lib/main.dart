// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String expression = "0";
  double primeiroNumero = 0.0;
  String operator = "";
  void setExpression(String value) {
    // clean the expression

    // switch a choice
    switch (value) {
      case "AC":
        setState(() => expression = "0");
        break;
      case "C":
        String aux = expression.length > 0
            ? expression.substring(0, expression.length - 1)
            : "0";
        setState(() {
          if (aux.length > 0) {
            expression = aux;
          } else {
            expression = "";
          }
        });
        break;
      case "000":
      case "0":
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
        setState(() {
          if(expression.length == 1 && expression.contains("0")){
            expression = value;
          }else{
            expression += value;
          }
        });
        break;
      case ",":
        setState(() {
          if(expression == "0" && expression == ""){
            expression = "0.";
          }else{

          double aux = double.parse(expression);
          expression = aux.toString();
          expression = expression.substring(0, expression.length - 1);
          }
        });
        break;
      case "+":
        setState(() {
          primeiroNumero = double.parse(expression);
          expression = "0";
          operator = "+";
        });
      case "-":
        setState(() {
          primeiroNumero = double.parse(expression);
          expression = "0";
          operator = "-";
        });
      case "X":
        setState(() {
          primeiroNumero = double.parse(expression);
          expression = "0";
          operator = "X";
        });
      case "/":
        setState(() {
          primeiroNumero = double.parse(expression);
          expression = "0";
          operator = "/";
        });
        case "%":
        setState(() {
          primeiroNumero = double.parse(expression);
          expression = "0";
          operator = "%";
        });
      //  operações
      case "=":
        setState(() {
          switch (operator) {
            case "+":
              double aux = primeiroNumero + double.parse(expression);
              primeiroNumero = 0;
              expression = aux.toString();
              // removing dot in int expressions
              removeDotZero();
              break;
            case "-":
              double aux = primeiroNumero - double.parse(expression);
              primeiroNumero = 0;
              expression = aux.toString();
              removeDotZero();
              break;
            case "X":
              double aux = primeiroNumero * double.parse(expression);
              primeiroNumero = 0;
              expression = aux.toString();
              removeDotZero();
              break;
            case "/":
              double aux = primeiroNumero / double.parse(expression);
              primeiroNumero = 0;
              expression = aux.toString();
              removeDotZero();
              break;
            case "%":
              double aux = primeiroNumero % double.parse(expression);
              primeiroNumero = 0;
              expression = aux.toString();
              removeDotZero();
              break;
          }
        });
    }
  }
  void removeDotZero(){
        if(expression.contains(".")){
          String slice1 = expression.substring(expression.indexOf("."), expression.length);
          expression = slice1 == ".0" ? expression.substring(0 , expression.indexOf(".")) : expression;
        } 
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Calculadora Well")),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          color: Color.fromARGB(255, 38, 80, 102),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("$expression",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => setExpression("C"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "C",
                          style: TextStyle(fontSize: 32, color: Colors.yellow),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("AC"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "AC",
                          style: TextStyle(fontSize: 32, color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("%"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "%",
                          style: TextStyle(fontSize: 32, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("/"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "/",
                          style: TextStyle(fontSize: 32, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () => setExpression("1"),
                      child: SizedBox(
                        height: 50.0,
                        width: 50.0,
                        child: Center(
                          child: Text(
                            "1",
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                        ),
                      )),
                  GestureDetector(
                    onTap: () => setExpression("2"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("3"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "3",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("X"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "X",
                          style: TextStyle(fontSize: 32, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => setExpression("4"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "4",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("5"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "5",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("6"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "6",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("+"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 32, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => setExpression("7"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "7",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("8"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "8",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("9"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "9",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("-"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(fontSize: 32, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => setExpression(","),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          ",",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("0"),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "0",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("000"),
                    child: SizedBox(
                      height: 50.0,
                      width: 55.0,
                      child: Center(
                        child: Text(
                          "000",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setExpression("="),
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          "=",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
