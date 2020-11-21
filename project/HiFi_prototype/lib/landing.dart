import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_particles/particles.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [Color(0xFF6C63FF), Color(0x55EAC8F6)],
                  [Color(0xFF6C63FF), Color(0x55EAC8F6)],
                  [Color(0xFF6C63FF), Color(0x55EAC8F6)],
                  [Color(0x55EAC8F6), Color(0xFF6C63FF)],
                  [Color(0xFF6C63FF), Color(0x55EAC8F6)],
                ],
                durations: [35000, 19440, 10800, 6000, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30, 0.33],
                // durations: [6000],
                // heightPercentages: [0.20],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height / 2.5),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  'assets/images/bookstair.svg',
                  height: 200,
                ),
              ),
              Text(
                "Tyoutr",
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.italic),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signuptutor');
                    },
                    child: Text("Signup as Tutor"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signuptutee');
                  },
                  child: Text("Signup as Tutee"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: OutlineButton(
                  borderSide: BorderSide(width: 2),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
