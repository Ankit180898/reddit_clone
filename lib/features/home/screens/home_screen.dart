import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';
import 'package:reddit_clone/features/home/drawers/community_list_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      drawer: const CommunityListDrawer(),
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(user!.profilePic),
              onBackgroundImageError: (exception, stackTrace) =>
                  const AssetImage("assets/images/logo.png"), // Fallback image
            ),
          )
        ],
      ),
      body: Center(
        child: Text(user.name),
      ),
    );
  }
}
