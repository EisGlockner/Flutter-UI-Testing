import 'package:flutter/material.dart';import 'package:flutter_web_test/screens/todo/panels/main_panel.dart';import 'package:flutter_web_test/screens/todo/panels/menu_panel.dart';class TodoScreen extends StatelessWidget {  const TodoScreen({super.key});  @override  Widget build(BuildContext context) {    return const Scaffold(      body: Row(        children: [          Expanded(            child: MenuPanel(),          ),          Expanded(            flex: 4,            child: MainPanel(),          ),        ],      ),    );  }}