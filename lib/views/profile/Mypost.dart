import 'package:community_dev/views/Timeline/TimelineScreen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mypost extends StatelessWidget {
  const Mypost({super.key});

  @override
  Widget build(BuildContext context) {
    return TimelineScreen(
      isMyPost: true,
    );
  }
}
