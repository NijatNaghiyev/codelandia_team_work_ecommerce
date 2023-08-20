import 'package:flutter/material.dart';

double selectedRating = 1;

class BottomSheetRatings extends StatefulWidget {
  const BottomSheetRatings({super.key});

  @override
  State<BottomSheetRatings> createState() => _BottomSheetRatingsState();
}

class _BottomSheetRatingsState extends State<BottomSheetRatings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              SizedBox(width: 10),
              Text('4.0 & Above'),
            ],
          ),
          value: selectedRating == 4,
          onChanged: (value) {
            setState(() {
              selectedRating = 4;
            });
          },
        ),
        CheckboxListTile(
          title: const Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              SizedBox(width: 10),
              Text('3.0 & Above'),
            ],
          ),
          value: selectedRating == 3,
          onChanged: (value) {
            setState(() {
              selectedRating = 3;
            });
          },
        ),
        CheckboxListTile(
          title: const Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              SizedBox(width: 10),
              Text('2.0 & Above'),
            ],
          ),
          value: selectedRating == 2,
          onChanged: (value) {
            setState(() {
              selectedRating = 2;
            });
          },
        ),
        CheckboxListTile(
          title: const Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              SizedBox(width: 10),
              Text('1.0 & Above'),
            ],
          ),
          value: selectedRating == 1,
          onChanged: (value) {
            setState(() {
              selectedRating = 1;
            });
          },
        ),
      ],
    );
  }
}
