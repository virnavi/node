import 'package:core_sdk/wrappers.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'user_get_it.config.dart';

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureUserDependencies(GetIt getIt) => init(getIt);

class UserSdkGetIt extends BaseGetIt {
  static UserSdkGetIt? _instance;

  static bool get initialized => _instance != null;

  static UserSdkGetIt get shared {
    if (_instance != null) return _instance!;
    throw Exception("User Sdk Get It not initialized");
  }

  static UserSdkGetIt initialize() {
    if (!initialized) {
      _instance = UserSdkGetIt._();
    }
    return _instance!;
  }

  UserSdkGetIt._();

  @override
  void configureDependencies(GetIt getIt) {
    configureUserDependencies(getIt);
  }
}
