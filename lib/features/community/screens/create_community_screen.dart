import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/common/input_field.dart';

class CreateCommunityScreen extends ConsumerStatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends ConsumerState<CreateCommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Community"),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Community name"),
            TextField(
              decoration: InputDecoration(
                  hintText: 'r/community_name',
                  filled: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(18)),
              maxLength: 21,
              // controller: ,
            )
          ],
        ),
      ),
    );
  }
}
