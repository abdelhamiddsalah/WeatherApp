import 'package:flutter/material.dart';



class Noweather extends StatelessWidget {
  const Noweather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Text(
                    "there is no weather 😣 start",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text("searching now 🔍",
                      style: TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold))
                ],
              ),
        ],
      ),
    );
  }


}