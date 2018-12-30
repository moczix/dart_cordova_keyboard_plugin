import 'dart:async';
import 'dart:html';
import 'dart:js';

import 'keyboard_cordova.dart';
import 'keyboard_plugin_event.dart';

class KeyboardPlugin {
  StreamController<KeyboardPluginEvent> _keyboardDidShow = new StreamController.broadcast();
  StreamController<void> _keyboardDidHide = new StreamController.broadcast();
  StreamController<void> _keyboardWillHide = new StreamController.broadcast();
  StreamController<void> _keyboardWillShow = new StreamController.broadcast();

  /// current state of keuboard status
  bool get isVisible => KeyboardCordova.isVisible;

  KeyboardPlugin() {
    window.addEventListener('keyboardDidShow', (Event event) {
      _keyboardDidShow.add(KeyboardPluginEvent(new JsObject.fromBrowserObject(event)['keyboardHeight']));
    });

    window.addEventListener('keyboardDidHide', (Event event) => _keyboardDidHide.add(null));
    window.addEventListener('keyboardWillHide', (Event event) => _keyboardWillHide.add(null));
    window.addEventListener('keyboardWillShow', (Event event) => _keyboardWillShow.add(null));
  }

  /// listener for keyboardDidShow event
  Stream<KeyboardPluginEvent> keyboardDidShow() => _keyboardDidShow.stream;

  /// listener for keyboardDidHide event
  Stream<void> keyboardDidHide() => _keyboardDidHide.stream;

  /// listener for keyboardWillShow event
  Stream<void> keyboardWillShow() => _keyboardWillHide.stream;

  /// listener for keyboardWillHide event
  Stream<void> keyboardWillHide() => _keyboardWillHide.stream;

  /// show keyboard
  void show() => KeyboardCordova.show();

  /// hide keyboard
  void hide() => KeyboardCordova.hide();

  /// hide or show accessory bar on keyboard
  Future<bool> hideFormAccessoryBar(bool hide) {
    Completer<bool> completer = new Completer();
    KeyboardCordova.hideFormAccessoryBar(hide, allowInterop((bool currentValue) => completer.complete(currentValue)));
    return completer.future;
  }
}
