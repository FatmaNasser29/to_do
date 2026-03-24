import 'package:flutter/material.dart';
import 'package:to_do/pallet_colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
      child: Card(
        child: Container(
          height: 115,
          width: 315,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(width: 10, height: 90, color: PalletColors.mainColor),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Play basket ball"),
                  Row(
                    children: [
                      Icon(Icons.access_time_sharp),
                      SizedBox(width: 22),
                      Text("10:30 AM"),
                    ],
                  ),
                ],
              ),
              Container(
                color: PalletColors.mainColor,
                height: 22,
                width: 22,
                child: Icon(Icons.check, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
