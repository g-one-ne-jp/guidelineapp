// Flutter imports:
import 'package:flutter/foundation.dart';

void customDebugPrint(String message) {
  if (kDebugMode) {
    print(message);
  }
}
