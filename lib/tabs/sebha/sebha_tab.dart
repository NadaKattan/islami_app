import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' show pi;

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  List<String> state = ["سبحان الله", "الحمدلله", "الله أكبر"];
  int index = 0;
  double rotatecount = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              // Container(
              //   // color: Colors.amberAccent,
              //   margin: EdgeInsets.only(left: 65),
              //   padding: EdgeInsets.only(bottom: 0),
              //   child: Image.asset(
              //     "assets/images/head_sebha_logo.png",
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * 0.1),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/head_sebha_logo.png"),
                    alignment: Alignment.topCenter,
                  ),
                ),
                // color: Colors.brown,
                child: InkWell(
                  onTap: () {
                    // Transform.rotate(
                    //   angle: -3.14/ 12.0,
                    // );
                    increase();
                  },
                  child: Transform.rotate(
                    angle: -rotatecount / 12,
                    child: Image.asset(
                      "assets/images/body_sebha_logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "عدد التسبيحات",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "$count",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  state[index],
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void increase() {
    count++;
    rotatecount += pi;
    if (count % 33 == 0) {
      index++;
      if (index == 3) index = 0;
    }
    setState(() {});
  }
}
