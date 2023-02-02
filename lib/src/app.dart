import 'package:flutter/material.dart';

import 'controller/controller.dart';
import 'settings/settings_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ControllerState controller = ControllerState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ValueListenableBuilder<EnumState>(
        valueListenable: controller,
        builder: (BuildContext context, value, Widget? child) {
          return controller.chamaPagina(state: value);
        },
      ),
    );
  }
}
