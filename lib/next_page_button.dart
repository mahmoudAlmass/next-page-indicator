import 'package:flutter/material.dart';


class NextPageButton extends StatefulWidget {
  final VoidCallback onPressed;
  IconData icon;

  NextPageButton({
    required this.onPressed,
    required this.icon,
  });

  @override
  _NextPageButtonState createState() => _NextPageButtonState();
}

class _NextPageButtonState extends State<NextPageButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(18.0),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: Colors.blue,
      onPressed: widget.onPressed,
      child:  Icon(
        widget.icon,
        color: Colors.white,
        size: 32.0,
      ),
    );
  }
}
