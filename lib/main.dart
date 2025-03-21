import 'package:expensetracker/Pages/home_page.dart';
import 'package:expensetracker/Theme/theme.dart';
import 'package:expensetracker/i18n/strings.g.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final localeString = prefs.getString('locale') ?? AppLocale.en.languageCode;
  LocaleSettings.setLocaleRaw(localeString);
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: TranslationProvider(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      themeMode: ThemeMode.system,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      locale: TranslationProvider.of(context).flutterLocale,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: AppLocaleUtils.supportedLocales,
      home: const Homepage(),
    );
  }
}
