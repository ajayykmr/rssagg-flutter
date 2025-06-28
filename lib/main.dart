import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rssagg_flutter/app_bloc_observer.dart';
import 'package:rssagg_flutter/features/auth/data/data_provider/auth_data_provider.dart';
import 'package:rssagg_flutter/features/auth/data/data_provider/current_user_data_provider.dart';
import 'package:rssagg_flutter/features/auth/view/pages/sign_in_screen.dart';
import 'package:rssagg_flutter/features/posts/view/pages/posts_screen.dart';
import 'package:rssagg_flutter/theme/theme.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/data/repository/auth_repository.dart';
import 'features/auth/data/repository/current_user_repository.dart';
import 'splash_screen.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.scaffoldBackground,
        statusBarColor: AppColor.scaffoldBackground,
        systemNavigationBarDividerColor: AppColor.scaffoldBackground,
      ),
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(AuthDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => CurrentUserRepository(CurrentUserDataProvider()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            final authBloc = AuthBloc(
              authRepository: context.read<AuthRepository>(),
              currentUserRepository: context.read<CurrentUserRepository>(),
            );
            authBloc.add(AuthStarted());
            return authBloc;
          }),
        ],
        child: MaterialApp(
          title: 'RssAggregator',
          theme: AppTheme.darkTheme,
          home: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const PostsScreen(),
                  ),
                );
              }
              if (state is AuthUserLoggedOut) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              }
            },
            child: const SplashScreen(),
          ),
        ),
      ),
    );
  }
}
