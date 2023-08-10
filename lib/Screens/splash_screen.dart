import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_animate/flutter_animate.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double? _deviceWidth, _deviceHeight;
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.popAndPushNamed(context, 'locate'),
    );
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(118, 255, 42, 110),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Group 1000002435.png"),
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                left: _deviceWidth! / 2 + 10,
                top: _deviceHeight! / 2 - 50,
                child: Image.asset("assets/Group 1000002434.png")
                    .animate()
                    .scale(duration: Duration(seconds: 2)),
              ),
              Positioned(
                left: _deviceWidth! / 2 - 130,
                top: _deviceHeight! / 2 + 5,
                child: Image.asset("assets/Group 1.png").animate().scale(
                    duration: Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn),
              ),
            ],
          ),
          // child: RichText(
          //   text: const TextSpan(
          //     style: TextStyle(color: Colors.white, fontSize: 80),
          //     children: [
          //       TextSpan(text: "Hello"),
          //       WidgetSpan(
          //         child: Icon(
          //           Icons.living_outlined,
          //           size: 100,
          //         ),
          //       ),
          //       TextSpan(text: "Ram")
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }

  Widget res() {
    return const Icon(Icons.heart_broken);
  }
}
