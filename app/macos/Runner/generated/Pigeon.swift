// Autogenerated from Pigeon (v18.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func createConnectionError(withChannelName channelName: String) -> FlutterError {
  return FlutterError(code: "channel-error", message: "Unable to establish connection on channel: '\(channelName)'.", details: "")
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol IFlutterToNativeApp {
  func sendMessage(message: String, completion: @escaping (Result<Void, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class IFlutterToNativeAppSetup {
  /// The codec used by IFlutterToNativeApp.
  /// Sets up an instance of `IFlutterToNativeApp` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: IFlutterToNativeApp?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let sendMessageChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.test_app.IFlutterToNativeApp.sendMessage\(channelSuffix)", binaryMessenger: binaryMessenger)
    if let api = api {
      sendMessageChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let messageArg = args[0] as! String
        api.sendMessage(message: messageArg) { result in
          switch result {
          case .success:
            reply(wrapResult(nil))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      sendMessageChannel.setMessageHandler(nil)
    }
  }
}
/// Generated protocol from Pigeon that represents Flutter messages that can be called from Swift.
protocol INativeToFlutterAppProtocol {
  func receiveMessage(message messageArg: String, completion: @escaping (Result<Void, FlutterError>) -> Void)
}
class INativeToFlutterApp: INativeToFlutterAppProtocol {
  private let binaryMessenger: FlutterBinaryMessenger
  private let messageChannelSuffix: String
  init(binaryMessenger: FlutterBinaryMessenger, messageChannelSuffix: String = "") {
    self.binaryMessenger = binaryMessenger
    self.messageChannelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
  }
  func receiveMessage(message messageArg: String, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.test_app.INativeToFlutterApp.receiveMessage\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger)
    channel.sendMessage([messageArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
}
