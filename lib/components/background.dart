import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset("assets/bottom1.png", width: size.width),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset("assets/bottom2.png", width: size.width),
              ),
              child
            ],
          ),
        ),
      ],
    );
  }
}
