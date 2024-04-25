import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class IFlutterToNativePlugin {
  @async
  void incrementCounter();
}

@FlutterApi()
abstract class INativeToFlutterPlugin {
  void getMessage(String message);
}
