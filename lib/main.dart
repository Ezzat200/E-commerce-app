import 'package:e_commerce_app/controller/lang/lang_cubit.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/functions/enums/languageEventType.dart';
import 'package:e_commerce_app/core/localization/translation.dart';
import 'package:e_commerce_app/core/services/cubit/services.dart';
import 'package:e_commerce_app/core/utils/approuter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences  = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
// child: Container(),
      providers: [
       BlocProvider(
        create: (context) =>
            LangCubit()..appLanguageFunc(LanguageEventEnums.InitialLanguge),)
      ],
            
        child: BlocBuilder<LangCubit, LangState>(
          builder: (context, state) {
            if(state is AppChangeLang){
        return MaterialApp.router(
      locale: Locale(state.languageCode!),
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                localizationsDelegates: [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeListResolutionCallback: (deviceLocales, supportedLocales) {
                  if (deviceLocales != null) {
                    for (var deviceLocale in deviceLocales) {
                      for (var local in supportedLocales) {
                        if (local.languageCode == deviceLocale.languageCode) {
                          return deviceLocale; // Return the supported locale if it matches
                        }
                      }
                    }
                  }
                  // Return a default locale if no match is found
                  return supportedLocales.first;
                },
                routerConfig: Approuter.router,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(brightness: Brightness.light).copyWith(
                  scaffoldBackgroundColor: AppColor.KBackgroundColor,
                  textTheme: GoogleFonts.montserratTextTheme(
                      ThemeData.light().textTheme),
                ));
          
            }
            return MaterialApp.router(
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                localizationsDelegates: [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeListResolutionCallback: (deviceLocales, supportedLocales) {
                  if (deviceLocales != null) {
                    for (var deviceLocale in deviceLocales) {
                      for (var local in supportedLocales) {
                        if (local.languageCode == deviceLocale.languageCode) {
                          return deviceLocale; // Return the supported locale if it matches
                        }
                      }
                    }
                  }
                  // Return a default locale if no match is found
                  return supportedLocales.first;
                },
                routerConfig: Approuter.router,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(brightness: Brightness.light).copyWith(
                  scaffoldBackgroundColor: AppColor.KBackgroundColor,
                  textTheme: GoogleFonts.montserratTextTheme(
                      ThemeData.light().textTheme),
                ));
          
          },
        ),
      );
    
  }
}
