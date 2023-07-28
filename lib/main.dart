import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/domain/repositories/database_repository.dart';
import 'package:oktoast/oktoast.dart';
import 'src/locator.dart';
import 'src/config/router/app_router.dart';
import 'src/domain/repositories/api_repository.dart';
import 'src/presentation/cubits/local_articles/cubit/local_articles_cubit.dart';
import 'src/presentation/cubits/remote_articles/remote_articles_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalArticlesCubit(
            locator<DatabaseRepository>(),
          )..getSavedArticles(),
        ),
        BlocProvider(
            create: (context) => RemoteArticlesCubit(
                  locator<ApiRepository>(),
                )..getBreakingArticles())
      ],
      child: OKToast(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
