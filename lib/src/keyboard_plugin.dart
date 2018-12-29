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

  bool get isVisible => KeyboardCordova.isVisible;

  KeyboardPlugin() {
    window.addEventListener('keyboardDidShow', (dynamic event) {
      _keyboardDidShow.add(KeyboardPluginEvent(event.keyboardHeight));
    });

    window.addEventListener('keyboardDidHide', (Event event) => _keyboardDidHide.add(null));
    window.addEventListener('keyboardWillHide', (Event event) => _keyboardWillHide.add(null));
    window.addEventListener('keyboardWillShow', (Event event) => _keyboardWillShow.add(null));
  }

  Stream<KeyboardPluginEvent> keyboardDidShow() => _keyboardDidShow.stream;
  Stream<void> keyboardDidHide() => _keyboardDidHide.stream;
  Stream<void> keyboardWillShow() => _keyboardWillHide.stream;
  Stream<void> keyboardWillHide() => _keyboardWillHide.stream;

  void show() => KeyboardCordova.show();
  void hide() => KeyboardCordova.hide();

  Future<bool> hideFormAccessoryBar(bool hide) {
    Completer<bool> completer = new Completer();
    KeyboardCordova.hideFormAccessoryBar(hide, allowInterop((bool currentValue){
      completer.complete(currentValue);
    }));
    return completer.future;
  }

}