import 'package:e_commerce_app/controller/lang/lang_cubit.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/functions/enums/languageEventType.dart';
import 'package:e_commerce_app/core/localization/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalization.of(context)!.translate('home_page')),
          MaterialButton(onPressed:(){
            BlocProvider.of<LangCubit>(context).appLanguageFunc(LanguageEventEnums.ArabicLanguage);
          } ,color: AppColor.primaryColor,child: Text('اللغة العربية'),),
          MaterialButton(onPressed:(){
            BlocProvider.of<LangCubit>(context).appLanguageFunc(LanguageEventEnums.EnglishLanguage);

          } ,color: AppColor.primaryColor,child: Text('English'),)

        ]
      )
    );
  }
}