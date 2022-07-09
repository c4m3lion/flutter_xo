import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EndGamePage extends StatelessWidget {
  String state = "draw";
  Color clr = Colors.green.withOpacity(0.5);
  EndGamePage({
    Key? key,
    required this.state,
    required this.clr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: InkWell(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        },
        child: Container(
          color: clr,
          child: Center(child: Text(state)),
        ),
      ),
    );
  }
}
