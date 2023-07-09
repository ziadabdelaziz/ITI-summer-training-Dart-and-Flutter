#!/usr/bin/env dart

void main() {
  // print statement
  print("yup");

  // dyanamic type variable
  dynamic x = 5;
  print(x);
  x = "hello";
  print(x);

  // List
  List name = ["ziad", "ali"];
  name[1] = 3;
  print(name);

  // Switch case
  String myName = 'Alaa';

  switch (myName) {
    case 'Ziad':
      print("hello zoz");
      break;
    case 'Ali':
      print("hello lolo");
      break;
    default:
      print("haa");
  }

  
}
