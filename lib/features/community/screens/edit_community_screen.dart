import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/common/error_text.dart';
import 'package:reddit_clone/core/common/loader.dart';
import 'package:reddit_clone/core/constants/constants.dart';
import 'package:reddit_clone/core/utils.dart';
import 'package:reddit_clone/features/community/controller/community_controller.dart';
import 'package:reddit_clone/models/community_model.dart';
import 'package:reddit_clone/theme/palette.dart';

class EditCommunityScreen extends ConsumerStatefulWidget {
  final String name;
  const EditCommunityScreen({required this.name, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditCommunityScreenState();
}

class _EditCommunityScreenState extends ConsumerState<EditCommunityScreen> {
  File? img;
  File? profileImg;

  void selectBannerImg() async {
    final res = await pickImage();
    if (res != null) {
      setState(() {
        img = File(res.files.first.path!);
      });
    }
  }

  void selectProfileImage() async {
    final res = await pickImage();
    if (res != null) {
      setState(() {
        profileImg = File(res.files.first.path!);
      });
    }
  }

  void save(Community community) {
    ref.read(communityControllerProvider.notifier).editCommunity(
          profileImg: profileImg,
          bannerImg: img,
          community: community,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(communityControllerProvider);
    return ref.watch(getCommunityByNameProvider(widget.name)).when(
          data: (community) => Scaffold(
            backgroundColor: Palette.darkModeAppTheme.scaffoldBackgroundColor,
            appBar: AppBar(
              centerTitle: false,
              actions: [
                TextButton(
                    onPressed: () => save(community), child: Text("Save"))
              ],
              title: Text("Edit community"),
            ),
            body: isLoading
                ? Loader()
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: selectBannerImg,
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(10),
                                  color: Palette.darkModeAppTheme.textTheme
                                      .bodySmall!.color!,
                                  dashPattern: const [10, 4],
                                  strokeCap: StrokeCap.round,
                                  child: Container(
                                    width: double.infinity,
                                    height: 150,
                                    child: img != null
                                        ? Image.file(img!)
                                        : community.banner.isEmpty ||
                                                community.banner ==
                                                    Constants.bannerDefault
                                            ? Center(
                                                child: IconButton(
                                                    iconSize: 40,
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .camera_alt_outlined)),
                                              )
                                            : Image.network(community.banner),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                child: GestureDetector(
                                  onTap: () => selectProfileImage(),
                                  child: profileImg != null
                                      ? CircleAvatar(
                                          radius: 32,
                                          backgroundImage:
                                              FileImage(profileImg!),
                                          onBackgroundImageError: (exception,
                                                  stackTrace) =>
                                              const AssetImage(
                                                  "assets/images/logo.png"), // Fallback image
                                        )
                                      : CircleAvatar(
                                          radius: 32,
                                          backgroundImage:
                                              NetworkImage(community.avatar),
                                          onBackgroundImageError: (exception,
                                                  stackTrace) =>
                                              const AssetImage(
                                                  "assets/images/logo.png"), // Fallback image
                                        ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          error: (error, StackTrace stackTrace) =>
              ErrorText(error: error.toString()),
          loading: () => const Loader(),
        );
  }
}
