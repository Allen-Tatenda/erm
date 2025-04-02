import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  final String message;
  const ProgressDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Dialog(
        backgroundColor: Colors.black,
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const SizedBox(
                  width: 6.0,
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.secondary),
                ),
                const SizedBox(
                  width: 26.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
