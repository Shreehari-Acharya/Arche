import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';
import 'features/auth/presentation/pages/login.dart';
import 'features/auth/presentation/pages/signup.dart';

// NEW MAIN APP NAVIGATION (Instagram-style UI)
import 'features/auth/navigation/arche_shell.dart';

// AUTH LAYERS
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repostories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_use_cases.dart';
import 'features/auth/domain/usecases/register_use_cases.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

void main() {
  final authRepository = AuthRepositoryImpl(
    authRemoteDataSource: AuthRemoteDataSource(),
  );

  runApp(ArcheApp(authRepository: authRepository));
}

class ArcheApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;

  const ArcheApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            registerUseCase: RegisterUseCase(repository: authRepository),
            loginUseCase: LoginUseCase(repository: authRepository),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // ----------------------------------------------------
        // FIRST PAGE SHOWN WHEN APP OPENS
        // ----------------------------------------------------
        home: const HomePage(),

        // ----------------------------------------------------
        // NAVIGATION ROUTES
        // ----------------------------------------------------
        routes: {
          '/login': (_) => const LoginPage(),
          '/register': (_) => const SignUpScreen(),

          // After login / signup → go to main app shell
          '/arche': (_) => const ArcheShell(),
        },
      ),
    );
  }
}
