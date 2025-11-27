import 'package:app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:app/features/auth/domain/entities/user_entity.dart';
import 'package:app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<UserEntity> login(String email, String password) async {
    return authRemoteDataSource.login(email: email, password: password);
  }

  @override
  Future<UserEntity> register(
    String fullname,
    String email,
    String password,
  ) async {
    return await authRemoteDataSource.register(
      fullname: fullname,
      email: email,
      password: password,
    );
  }
}
