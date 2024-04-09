import 'package:flutter/material.dart';import 'package:flutter_web_test/defaults.dart' as defaults;import '../../../ui/glass_morphism.dart';class MainPanel extends StatelessWidget {  const MainPanel({super.key});  @override  Widget build(BuildContext context) {    return SizedBox(      height: MediaQuery.of(context).size.height,      child: GlassMorphism(        gradientColors: const [Colors.blue, defaults.ciColor, Colors.deepPurple],        child: const Column(          children: [            SizedBox(              height: defaults.largePadding,              child: Text('Irgendwas mit Titel (ง •_•)ง'),            ),            Divider(color: Colors.black38),            Expanded(child: Text('Main Panel')),            Text('Hier könnte Ihre fertige Webapp sein'),          ],        ),      ),    );  }}