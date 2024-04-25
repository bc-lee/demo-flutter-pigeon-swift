import 'package:plugin/callback.dart';
import 'package:plugin/generated/pigeon.dart';

class NativeToFlutterPlugin extends INativeToFlutterPlugin {
  // instance
  static final NativeToFlutterPlugin _instance = NativeToFlutterPlugin._();

  Callback? callback;

  // constructor
  NativeToFlutterPlugin._();

  static void init(Callback callback) {
    INativeToFlutterPlugin.setUp(_instance);
    _instance.callback = callback;
  }

  @override
  void getMessage(String message) {
    _instance.callback!(message);
  }
}

Future<void> incrementCounter() async {
  await IFlutterToNativePlugin().incrementCounter();
}
