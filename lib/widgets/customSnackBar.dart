import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_language_app/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_language_app/enums/snackbar_type.dart';


void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      borderRadius: 16,
      messageTextAlign: TextAlign.left,
      titleTextAlign: TextAlign.left,
      margin: EdgeInsets.all(32),
      // padding: EdgeInsets.all(16),
      backgroundColor: Color(0xffFF4646),
      isDismissible: true,
      messageColor: Colors.white,

    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      borderRadius: 16,
      messageTextAlign: TextAlign.left,
      titleTextAlign: TextAlign.left,
      margin: EdgeInsets.all(32),
      // padding: EdgeInsets.all(16),
      backgroundColor: Colors.green,
      isDismissible: true,

      messageColor: Colors.white,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.message,
    config: SnackbarConfig(
      borderRadius: 16,
      margin: EdgeInsets.all(32),
      messageTextAlign: TextAlign.left,
      titleTextAlign: TextAlign.left,
      // padding: EdgeInsets.all(16),
      backgroundColor: Colors.grey.shade800,
      isDismissible: true,
      messageColor: Colors.white,
    ),
  );
}
