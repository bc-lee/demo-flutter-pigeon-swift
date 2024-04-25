import 'callback.dart';
import 'impl/impl.dart' as impl;

void initAndRegisterCallback(Callback callback) {
  impl.NativeToFlutterPlugin.init(callback);
}

Future<void> incrementCounter() async {
  await impl.incrementCounter();
}
