
import 'package:dart_cordova_keyboard_plugin/keyboard_plugin.dart';
import 'dart:html';

void main() {

  KeyboardPlugin keyboard = new KeyboardPlugin();

  keyboard.keyboardDidShow().listen((KeyboardPluginEvent event) {
    print('keyboard did show');
  });

  keyboard.keyboardDidHide().listen((void _) {
    print('keyboard did hide');
  });

  document.getElementById('triggerShow').addEventListener('click', (Event event) => keyboard.show());
  document.getElementById('triggerHide').addEventListener('click', (Event event) => keyboard.hide());

  document.getElementById('triggerHideAccessoryBar').addEventListener('click', (Event event){
    keyboard.hideFormAccessoryBar(true).then((bool currentValue) => print(currentValue));
  });
}