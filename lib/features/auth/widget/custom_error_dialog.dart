import 'package:flutter/material.dart';

class CustomErrorDialog extends StatelessWidget {
  final String message;

  const CustomErrorDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.error_outline_rounded, color: Colors.red, size: 28),
          SizedBox(width: 12),
          Text("Error Occurred", style: TextStyle(fontSize: 18)),
        ],
      ),
      content: Text(
        message,
        style: TextStyle(fontSize: 14, height: 1.5),
        textAlign: .center,
      ),
    );
  }
}
