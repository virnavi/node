library core_sdk;

import 'package:core_sdk/data/config/auth_network_config.dart';
import 'package:core_sdk/data/network/auth/auth_network_impl.dart';
import 'package:core_sdk/data/repositories/auth_repository_impl.dart';
import 'package:core_sdk/domain/auth_get_it.dart';
import 'package:core_sdk/domain/networks/auth_network.dart';
import 'package:core_sdk/domain/repositories/auth_repository.dart';

class CoreSdk {
  static CoreSdk? _instance;

  static bool get initialized => _instance != null;

  static CoreSdk get shared {
    if (_instance != null) return _instance!;
    throw Exception("Core Sdk not initialized");
  }

  static Future<CoreSdk> initialize({
    required NetworkConfig networkConfig,
  }) async {
    if (!initialized) {
      final sdk = CoreSdk._(
        networkConfig: networkConfig,
      );
      await sdk.init();
      _instance = sdk;
    }
    return _instance!;
  }

  final NetworkConfig networkConfig;

  CoreSdk._({required this.networkConfig});

  Future<void> init() async {
    AuthSdkGetIt.initialize();
    AuthSdkGetIt.shared.registerLazySingleton<AuthNetwork>(
      () => AuthNetworkImpl(networkConfig),
    );

    // final pref = await SharedPreferences.getInstance();
    AuthSdkGetIt.shared.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(),
    );
  }
}
