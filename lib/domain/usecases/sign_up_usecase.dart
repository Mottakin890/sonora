import 'package:dartz/dartz.dart';
import 'package:sonora/common/utils/configs/usecases_controller.dart';
import 'package:sonora/common/utils/di/service_locator.dart';
import 'package:sonora/domain/repositories/auth_repository.dart';

class SignUpUsecase implements UsecasesController {
  @override
  Future<Either> call({params}) async {
    return serviceLocator<AuthRepository>().signUp(params!);
  }
}
