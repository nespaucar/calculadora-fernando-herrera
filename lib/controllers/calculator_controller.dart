import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var firstNumber = '10'.obs;
  var secondNumber = '20'.obs;
  var mathResult = '30'.obs;
  var operation = '+'.obs;

  void resetAll() {
    this.firstNumber.value = '0';
    this.secondNumber.value = '0';
    this.operation.value = '+';
    this.mathResult.value = '0';
  }

  void addNumber(String number) {
    if(this.mathResult.value == '0') { this.mathResult.value = number; return; }
    if(this.mathResult.value == '-0') { this.mathResult.value = '-' + number; return; }
    this.mathResult.value += number;
  }

  void changeNegativePositive() {
    if(this.mathResult.value.startsWith('-')) { this.mathResult.value = this.mathResult.value.replaceFirst('-', ''); return; }
    this.mathResult.value = '-' + this.mathResult.value;
  }

  void addDecimalPint() {
    if(this.mathResult.value.contains('.')) { return; }
    if(this.mathResult.value.startsWith('0')) { this.mathResult.value = '0.'; return; }
    if(this.mathResult.value == '-0') { this.mathResult.value = '-0.'; return; }
    this.mathResult.value += '.';
  }

  void deleteLastEntry() {
    if(this.mathResult.value.replaceAll('-', '').length > 1) {
      this.mathResult.value = this.mathResult.value.substring(0, this.mathResult.value.length - 1);
    } else {
      this.mathResult.value = '0';
    }
  }

  void calculateResult() {

    this.secondNumber.value = this.mathResult.value;

    double num1 = double.parse(this.firstNumber.value);
    double num2 = double.parse(this.secondNumber.value);    

    switch (this.operation.value) {
      case '+':
        this.mathResult.value = '${num1 + num2}';
        break;
      case '-':
        this.mathResult.value = '${num1 - num2}';
        break;
      case '/':
        this.mathResult.value = '${num1 / num2}';
        break;
      case '*':
        this.mathResult.value = '${num1 * num2}';
        break;
      default:
        return;
    }

    if(this.mathResult.value.endsWith('.0')) {
      this.mathResult.value = this.mathResult.value.substring(0, (this.mathResult.value.length - 2));
    }
  }

  void addOperation(String operation) {
    this.firstNumber.value = this.mathResult.value;
    this.mathResult.value = '0';
    this.secondNumber.value = '0';
    this.operation.value = operation;
  }
}