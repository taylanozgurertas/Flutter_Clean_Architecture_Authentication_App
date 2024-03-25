import 'package:fpdart/fpdart.dart';
import 'package:itiraf/core/error/failures.dart';
import 'package:itiraf/core/usecase/usecase.dart';
import 'package:itiraf/core/common/entities/user.dart';
import 'package:itiraf/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
