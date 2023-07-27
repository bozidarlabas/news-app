import 'package:auto_route/auto_route.dart';

import '../../presentation/views/breaking_news_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BreakingNewsView.page, initial: true),
      ];
}

final appRouter = AppRouter();
