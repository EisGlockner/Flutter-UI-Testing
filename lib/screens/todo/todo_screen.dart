import 'package:flutter/material.dart';import 'package:flutter_web_test/ui/glass_morphism.dart';import 'package:flutter_web_test/defaults.dart' as defaults;import '../../streams/todo_menu_stream.dart';class TodoScreen extends StatelessWidget {  const TodoScreen({super.key});  @override  Widget build(BuildContext context) {    final todoStream = TodoMenuStream();    return Scaffold(      body: Row(        children: [          Expanded(            child: _buildMenuPanel(context, todoStream),          ),          Expanded(            flex: 4,            child: _buildMainPanel(context),          ),        ],      ),    );  }  Widget _buildMenuPanel(BuildContext context, TodoMenuStream todoStream) {    return SizedBox(      height: MediaQuery.of(context).size.height,      child: GlassMorphism(        child: Column(          children: [            _buildMenuHeadline(),            const Divider(color: Colors.black38),            _buildMenuEntries(context, todoStream),            _buildNewEntryButton(context, todoStream),          ],        ),      ),    );  }  Widget _buildMenuHeadline() {    return const SizedBox(      height: defaults.largePadding,      child: Center(        child: Text(          'Übersicht oder so ¯\\_(ツ)_/¯',        ),      ),    );  }  Widget _buildMenuEntries(BuildContext context, TodoMenuStream todoStream) {    return StreamBuilder<List<String>>(        stream: todoStream.todoGroups,        builder: (context, snapshot) {          final todoItems = snapshot.data ?? [];          return Expanded(            child: ListView.builder(              itemCount: todoItems.length,              itemBuilder: (context, index) {                return ListTile(                  title: Text(todoItems[index]),                  onTap: () {},                );              },            ),          );        });  }  Widget _buildNewEntryButton(BuildContext context, TodoMenuStream todoStream) {    final entryTextController = TextEditingController();    return StreamBuilder<bool>(      stream: todoStream.showTextField,      builder: (context, snapshot) {        final showTextField = snapshot.data ?? false;        if (showTextField) {          return Row(            children: [              Expanded(                child: Padding(                  padding: const EdgeInsets.symmetric(horizontal: defaults.smallPadding),                  child: TextFormField(                    controller: entryTextController,                    autofocus: true,                    decoration: const InputDecoration(                      hintText: 'Neuer Eintrag',                    ),                  ),                ),              ),              IconButton(                onPressed: () {                  todoStream.addTodoGroup(entryTextController.text);                  entryTextController.text = '';                  todoStream.toggleTextField(false);                },                icon: const Icon(Icons.save),              ),            ],          );        } else {          return IconButton(            onPressed: () {              todoStream.toggleTextField(true);            },            icon: const Icon(Icons.add),          );        }      },    );  }  Widget _buildMainPanel(BuildContext context) {    return SizedBox(      height: MediaQuery.of(context).size.height,      child: GlassMorphism(        gradientColors: const [Colors.blue, defaults.ciColor, Colors.deepPurple],        child: const Column(          children: [            SizedBox(              height: defaults.largePadding,              child: Text('Irgendwas mit Titel (ง •_•)ง'),            ),            Divider(color: Colors.black38),            Expanded(child: Text('Main Panel')),            Text('Hier könnte Ihre fertige Webapp sein'),          ],        ),      ),    );  }}