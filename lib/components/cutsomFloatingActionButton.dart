import 'package:flutter/material.dart';
import 'package:community_dev/constants/style.dart';

class cutsomFloatingActionButton extends StatelessWidget {
  const cutsomFloatingActionButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: colors.primary,
      child: Icon(
        Icons.add,
        size: 30,
      ),
    );
  }
}
