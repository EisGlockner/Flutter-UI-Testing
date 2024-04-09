import 'package:flutter/material.dart';import 'package:flutter_web_test/ui/glass_morphism.dart';import 'package:flutter_web_test/defaults.dart' as defaults;import 'package:go_router/go_router.dart';class RedirectPanel extends StatelessWidget {  const RedirectPanel({super.key});  @override  Widget build(BuildContext context) {    return GlassMorphism(      gradientColors: defaults.dashboardGradientColor,      child: SizedBox(        height: 250,        child: Center(          child: TextButton(            style: TextButton.styleFrom(              padding: const EdgeInsets.all(defaults.mediumPadding),            ),            onPressed: () {              context.go('/todo');            },            child: const Text(              'Klick me ∠( ᐛ 」∠)_',              style: TextStyle(fontSize: defaults.defaultFontSize),            ),          ),        ),      ),    );  }}