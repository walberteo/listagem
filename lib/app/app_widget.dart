import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem/app/ui/components/app_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Lista de Usuário',
      theme: makeAppTheme(),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
