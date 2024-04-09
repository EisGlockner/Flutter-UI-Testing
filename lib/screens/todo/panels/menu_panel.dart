import 'package:flutter/material.dart';import 'package:flutter_web_test/defaults.dart' as defaults;import '../../../streams/todo_menu_stream.dart';import '../../../ui/glass_morphism.dart';class MenuPanel extends StatelessWidget {  const MenuPanel({super.key});  @override  Widget build(BuildContext context) {    final todoStream = TodoMenuStream();    return SizedBox(      height: MediaQuery.of(context).size.height,      child: GlassMorphism(        child: Column(          children: [            _buildMenuHeadline(),            const Divider(color: Colors.black38),            _buildMenuEntries(context, todoStream),            _buildNewEntryButton(context, todoStream),          ],        ),      ),    );  }  Widget _buildMenuHeadline() {    return const SizedBox(      height: defaults.largePadding,      child: Center(        child: Text(          'Übersicht oder so ¯\\_(ツ)_/¯',        ),      ),    );  }  Widget _buildMenuEntries(BuildContext context, TodoMenuStream todoStream) {    return StreamBuilder<List<String>>(        stream: todoStream.todoGroups,        builder: (context, snapshot) {          final todoItems = snapshot.data ?? [];          return Expanded(            child: ListView.builder(              itemCount: todoItems.length,              itemBuilder: (context, index) {                return ListTile(                  title: Text(todoItems[index]),                  onTap: () {},                );              },            ),          );        });  }  Widget _buildNewEntryButton(BuildContext context, TodoMenuStream todoStream) {    return StreamBuilder<bool>(      stream: todoStream.showTextField,      builder: (context, snapshot) {        final showTextField = snapshot.data ?? false;        if (showTextField) {          return _buildNewEntryTextField(todoStream);        } else {          return IconButton(            onPressed: () {              todoStream.toggleTextField(true);            },            icon: const Icon(Icons.add),          );        }      },    );  }  Widget _buildNewEntryTextField(TodoMenuStream todoStream) {    final entryTextController = TextEditingController();    return Row(      children: [        Expanded(          child: Padding(            padding: const EdgeInsets.symmetric(horizontal: defaults.smallPadding),            child: TextFormField(              controller: entryTextController,              autofocus: true,              decoration: const InputDecoration(                hintText: 'Neuer Eintrag',              ),            ),          ),        ),        IconButton(          onPressed: () {            todoStream.addTodoGroup(entryTextController.text);            entryTextController.text = '';            todoStream.toggleTextField(false);          },          icon: const Icon(Icons.save),        ),      ],    );  }}