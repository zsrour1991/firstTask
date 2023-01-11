import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/home_page.dart';
import 'package:collection/collection.dart';
import 'package:beamer/beamer.dart';
import 'package:task_list_app/pages/tasks/presentation/_view/task_details.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(startLocale: Locale('en', 'US'),
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'MA')],
      path: 'assets/lang', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: ProviderScope(child: MyApp())));
}
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [BooksLocation()],
    ),
    notFoundRedirectNamed: '/task',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher:
      BeamerBackButtonDispatcher(delegate: routerDelegate),
    );
  }
}







// LOCATIONS
class BooksLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['/task/:taskId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('home'),
        title: 'Home',
        child: HomePage(),
      ),
      if (state.uri.pathSegments.contains('task'))
        const BeamPage(
          key: ValueKey('task'),
          title: 'Task',
          child: TaskDetails(),
        ),


    ];

    return pages;
  }
}



