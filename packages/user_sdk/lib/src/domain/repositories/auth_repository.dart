import 'package:user_sdk/src/domain/models/exports.dart';

abstract class AuthRepository {
  AppAuthModel getAppAuthModel();
  Future<bool> setAppAuthModel(AppAuthModel data);
  Future<void> clear();
}
