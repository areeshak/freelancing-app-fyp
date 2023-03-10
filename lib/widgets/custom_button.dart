import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final double sizeFactor;
  final Color buttonColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.sizeFactor = 0.85,
    this.buttonColor = Colors.teal,
    this.textColor = Colors.black,
  }) : super(key: key);


  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * widget.sizeFactor,40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
       primary: widget.buttonColor,
      ),
      onPressed: widget.onTap,
      child: Text(widget.text, style: TextStyle(fontSize: 18, color: widget.textColor),),
    );
  }
}