import 'package:app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:app/features/auth/domain/entities/user_entity.dart';
import 'package:app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<UserEntity> login(String email, String password) async {
    final user = await authRemoteDataSource.login(email: email, password: password);
    
    // Save auth data locally
    await authLocalDataSource.saveAuthData(
      token: user.token,
      userId: user.id,
      email: user.email,
    );
    
    return user;
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

  Future<bool> isLoggedIn() async {
    return await authLocalDataSource.isLoggedIn();
  }

  Future<void> logout() async {
    await authLocalDataSource.clearAuthData();
  }
}
