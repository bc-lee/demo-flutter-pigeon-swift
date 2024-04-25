import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class IFlutterToNativeApp {
  @async
  void sendMessage(String message);
}

@FlutterApi()
abstract class INativeToFlutterApp {
  void receiveMessage(String message);
}
