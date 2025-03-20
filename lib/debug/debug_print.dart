// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void customDebugPrint(
  String message, {
  bool isError = false,
}) {
  if (kDebugMode) {
    logger.d(message);
  }
}
