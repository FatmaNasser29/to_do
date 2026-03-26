import 'package:flutter/material.dart';

void showMessageDialog(
  BuildContext context, {
  required String message,
  String? posButtonText,
  String? negButtonText,
  void Function()? posButtonOnPressed,
  void Function()? negButtonOnPressed,
}) {
  List<Widget>? actions = [];
  if (posButtonText != null) {
    actions.add(
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          posButtonOnPressed?.call();
        },
        child: Text(posButtonText),
      ),
    );
  }
  if (negButtonText != null) {
    actions.add(
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          negButtonOnPressed?.call();
        },
        child: Text(negButtonText),
      ),
    );
  }
  showDialog(
    context: context,
    builder: (BuildContext) {
      return AlertDialog(content: Text(message), actions: actions);
    },
  );
}

void loadingMessageText(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext) {
      return AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text(message),
          ],
        ),
      );
    },
  );
}
