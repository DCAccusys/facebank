import 'package:facebank/src/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Step2 extends StatelessWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: CustomButton(
              text: 'Siguiente',
            ),
          )
        ],
      ),
    );
  }
}
