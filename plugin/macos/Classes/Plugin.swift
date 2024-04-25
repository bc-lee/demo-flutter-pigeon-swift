import Cocoa
import FlutterMacOS

public class Plugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        fatalError("Not implemented")
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        fatalError("Not implemented")
    }
}

// Adding the extension for FlutterError doesn't make the code compile
extension FlutterError: Error {}
