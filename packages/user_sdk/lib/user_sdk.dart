library user_sdk;

import 'package:user_sdk/src/data/config/network_config.dart';
import 'package:user_sdk/src/data/network/auth/auth_network_impl.dart';
import 'package:user_sdk/src/data/repositories/auth_repository_impl.dart';
import 'package:user_sdk/src/domain/networks/auth_network.dart';
import 'package:user_sdk/src/domain/repositories/auth_repository.dart';
import 'package:user_sdk/src/domain/user_get_it.dart';


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
    UserSdkGetIt.initialize();
    UserSdkGetIt.shared.registerLazySingleton<AuthNetwork>(
          () => AuthNetworkImpl(networkConfig),
    );

    // final pref = await SharedPreferences.getInstance();
    UserSdkGetIt.shared.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(),
    );
  }
}
