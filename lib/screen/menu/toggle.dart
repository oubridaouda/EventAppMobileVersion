import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

const double width = 300.0;
const double height = 50.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black;
String toggleEventType = "online";

class _ToggleButtonState extends State<ToggleButton> {
  late double xAlign;
  late Color loginColor;
  late Color signInColor;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: width * 0.5,
              height: height,
              decoration: const BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                toggleEventType = "Online";
                xAlign = loginAlign;
                loginColor = selectedColor;
                signInColor = normalColor;
                print(toggleEventType);
              });
            },
            child: Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.locationDot,
                      color: loginColor,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Online Events',
                      style: TextStyle(
                        color: loginColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                toggleEventType = "Venue";
                xAlign = signInAlign;
                signInColor = selectedColor;
                loginColor = normalColor;
                print(toggleEventType);
              });
            },
            child: Align(
              alignment: Alignment(1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FaIcon(
                    FontAwesomeIcons.video,
                    color: signInColor,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Venue Events',
                    style: TextStyle(
                      color: signInColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
