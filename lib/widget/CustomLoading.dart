import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50, // Adjust the size as needed
        height: 50,
        child: CircularProgressIndicator(
          strokeWidth: 4, // Adjust the stroke width
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey[900]!), // Change the color
        ),
      ),
    );
  }
}
