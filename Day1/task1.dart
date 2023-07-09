#!/usr/bin/env dart

void main() {
  var num1 = 5, num2 = 13, num3 = 15;
  List lst = ["string", 3, true, 2.5];

  print(sumTwo(num1, num2));
  print(maxOfThree(num1, num2, num3));
  printList(lst);
  print(tax());
}


// #1
int sumTwo(int num1, int num2) {
  return num1 + num2;
}


// #2
int maxOfThree(int num1, int num2, int num3) {
  int max = num1;

  if (num1 < num2) {
    max = num2;
  }

  if (max < num3) {
    max = num3;
  }

  return max;
}


// #3
void printList(List lst) {
  for (dynamic item in lst) {
    print(item);
  }
}


// #4
num tax([num income = 1500]) {
  return income * 0.1;
}

