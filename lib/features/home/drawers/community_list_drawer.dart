import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/common/error_text.dart';
import 'package:reddit_clone/core/common/loader.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';
import 'package:reddit_clone/features/community/controller/community_controller.dart';
import 'package:reddit_clone/features/community/repository/community_repository.dart';
import 'package:routemaster/routemaster.dart';

class CommunityListDrawer extends ConsumerStatefulWidget {
  const CommunityListDrawer({super.key});

  @override
  ConsumerState<CommunityListDrawer> createState() =>
      _CommunityListDrawerState();
}

class _CommunityListDrawerState extends ConsumerState<CommunityListDrawer> {
  void navigateToCreateCommunity(BuildContext context) {
    Routemaster.of(context).push('/create-community');
  }

  void getUserCommunities() {
    // Implement your logic to get user communities here
    ref.watch(communityControllerProvider.notifier).getUserCommunities();
  }

  @override
  Widget build(BuildContext context) {
    // You can use ref to read providers if needed
    // final userCommunities = ref.watch(userCommunitiesProvider);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              onTap: () => navigateToCreateCommunity(context),
              leading: const Icon(Icons.add),
              title: const Text("Create a community"),
            ),
            ref.watch(userCommunityProvider).when(
                  data: (communities) => Expanded(
                    child: ListView.builder(
                      itemCount: communities.length,
                      itemBuilder: (BuildContext context, int index) {
                        var community = communities[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(community.avatar),
                          ),
                          title: Text('r/${community.name}'),
                          onTap: () => null,
                        );
                      },
                    ),
                  ),
                  error: (error, StackTrace) =>
                      ErrorText(error: error.toString()),
                  loading: () => const Loader(),
                )
          ],
        ),
      ),
    );
  }
}
