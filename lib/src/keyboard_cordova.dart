@JS()
library keyboard;

import 'package:js/js.dart';

@JS('Keyboard')
class KeyboardCordova {
  external static show();
  external static hide();
  external static bool get isVisible;
  external static hideFormAccessoryBar(bool hide, Function success);
}