import 'package:flutter/material.dart';

class StatusPopup extends StatelessWidget {
  final String message;
  final Image image;

  const StatusPopup({
    Key? key,
    required this.message,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Display the image at the top
            image,
            const SizedBox(height: 16.0),
            // Display the message below the image
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            // Button to close the popup
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      ),
    );
  }
}
