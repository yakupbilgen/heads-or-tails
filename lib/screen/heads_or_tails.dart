import 'dart:math';

import 'package:flutter/material.dart';

class HeadsOrTails extends StatefulWidget {
  const HeadsOrTails({Key? key}) : super(key: key);

  @override
  _HeadsOrTailsState createState() => _HeadsOrTailsState();
}

class _HeadsOrTailsState extends State<HeadsOrTails> {
  String imageUrl = "assets/images/1tl.png";
  String buttonText = "Heads?\nTails?";
  int totalTails = 0;
  int totalHeads = 0;

  buildRandNumber() {
    Random rnd = Random();
    int rndNumber = rnd.nextInt(2);
    debugPrint(rndNumber.toString());
    setState(() {
      if (rndNumber == 0) {
        buttonText = "Heads \nTry Again";
        imageUrl = "assets/images/1tl_front.png";
        totalHeads++;
      } else {
        buttonText = "Tails \nTry Again";
        imageUrl = "assets/images/1tl_back.png";
        totalTails++;
      }
    });
  }

  clearTotal() {
    setState(() {
      totalTails = 0;
      totalHeads = 0;
      buttonText = "Heads?\nTails?";
      imageUrl = "assets/images/1tl.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: _deviceSize.width * 0.65,
              height: _deviceSize.height * 0.65,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Image.asset(imageUrl),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Heads: $totalHeads \nTotal Tails: $totalTails ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ElevatedButton(
              onPressed: buildRandNumber,
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ElevatedButton(
              onPressed: clearTotal,
              child: const Text(
                "Clean",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
