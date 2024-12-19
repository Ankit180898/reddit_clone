// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ModToolsScreen extends StatelessWidget {
  final String name;
  const ModToolsScreen({
    super.key,
    required this.name,
  });

  void navigateToEditCommunity(BuildContext context) {
    Routemaster.of(context).push('/edit-community/$name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mod Tools'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.add_moderator),
            onTap: () {},
            title: const Text("Add moderators"),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            onTap: () {
              navigateToEditCommunity(context);
            },
            title: const Text("Edit community"),
          ),
        ],
      ),
    );
  }
}
