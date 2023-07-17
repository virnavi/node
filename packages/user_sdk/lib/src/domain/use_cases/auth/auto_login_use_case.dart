
import 'package:core_sdk/exports.dart';
import 'package:dartz/dartz.dart';
import 'package:user_sdk/src/domain/user_get_it.dart';

import '../../networks/auth_network.dart';
import '../../repositories/auth_repository.dart';
import 'logout_use_case.dart';

class AutoLoginUseCase {
  AuthNetwork get network => UserSdkGetIt.shared.get();
  AuthRepository get repository => UserSdkGetIt.shared.get();

  AutoLoginUseCase();

  Future<Either<FailureModel, bool>> call() async {
    final result = await network.isSessionValid();
    return await result.fold((failure) async => Left(failure), (status) async {
      if (!status) {
        await LogoutUseCase().call();
      }
      return Right(status);
    });
  }
}
