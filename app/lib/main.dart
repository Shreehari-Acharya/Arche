import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/quiz/data/repositories/quiz_repository.dart';
import 'home_page.dart';
import 'features/auth/presentation/pages/login.dart';
import 'features/auth/presentation/pages/signup.dart';

// NEW MAIN APP NAVIGATION (Instagram-style UI)
import 'features/core/presentation/navigation/arche_shell.dart';

// AUTH LAYERS
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepository),
        RepositoryProvider(create: (context) => QuizRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              registerUseCase: RegisterUseCase(
                repository: context.read<AuthRepositoryImpl>(),
              ),
              loginUseCase: LoginUseCase(
                repository: context.read<AuthRepositoryImpl>(),
              ),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.robotoTextTheme(),
            // OR for Inter:
            // textTheme: GoogleFonts.interTextTheme(),
          ),

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
      ),
    );
  }
}
