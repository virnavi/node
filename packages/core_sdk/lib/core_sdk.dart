library core_sdk;

class CoreSdk {
  static CoreSdk? _instance;

  static bool get initialized => _instance != null;

  static CoreSdk get shared {
    if (_instance != null) return _instance!;
    throw Exception("Core Sdk not initialized");
  }

  static Future<CoreSdk> initialize() async {
    if (!initialized) {
      final sdk = CoreSdk._();
      await sdk.init();
      _instance = sdk;
    }
    return _instance!;
  }

  CoreSdk._();

  Future<void> init() async {}
}
