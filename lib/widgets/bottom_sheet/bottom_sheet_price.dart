import 'package:codelandia_team_work_ecommerce/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetPrice extends StatefulWidget {
  const BottomSheetPrice({super.key});

  @override
  State<BottomSheetPrice> createState() => _BottomSheetPriceState();
}

bool errorMin = false;
bool errorMax = false;

class _BottomSheetPriceState extends State<BottomSheetPrice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Range'.tr,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: minPriceController,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Colors.teal,
            ),
            onChanged: (value) {
              if (int.parse(minPriceController.text) >=
                  int.parse(maxPriceController.text)) {
                setState(() {
                  errorMin = true;
                });
              } else {
                setState(() {
                  errorMin = false;
                });
              }
            },
            decoration: InputDecoration(
              filled: errorMin,
              fillColor: Colors.redAccent,
              border: const OutlineInputBorder(),
              labelText: 'Min. price',
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              prefixText: '\$ ',
              hintText: '0',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: maxPriceController,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Colors.teal,
            ),
            onChanged: (value) {
              if (int.parse(minPriceController.text) >=
                  int.parse(maxPriceController.text)) {
                setState(() {
                  errorMax = true;
                });
              } else {
                setState(() {
                  errorMax = false;
                });
              }
            },
            decoration: InputDecoration(
              filled: errorMax,
              fillColor: Colors.redAccent,
              border: const OutlineInputBorder(),
              labelText: 'Max. price',
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              prefixText: '\$ ',
              hintText: '999999',
            ),
          ),
        ),
      ],
    );
  }
}
