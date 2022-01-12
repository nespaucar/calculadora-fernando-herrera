import 'package:calculator_app/controllers/calculator_controller.dart';
import 'package:calculator_app/widgets/line_separator.dart';
import 'package:calculator_app/widgets/main_result.dart';
import 'package:calculator_app/widgets/sub_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MathResults extends StatelessWidget {

  final calculatorCtrl = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        child: Column(
          children: [
            // Solo esto se tiene que redibujar
            SubResult(text: '${calculatorCtrl.firstNumber}'),
            SubResult(text: '${calculatorCtrl.operation}'),
            SubResult(text: '${calculatorCtrl.secondNumber}'),
            LineSeparator(),
            MainResultText(text: '${calculatorCtrl.mathResult}')
          ]
        )
      )
    );
  }
}