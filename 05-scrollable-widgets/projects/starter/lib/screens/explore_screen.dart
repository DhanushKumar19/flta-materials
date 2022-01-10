import 'package:flutter/material.dart';

import '../components/components.dart';
import '../components/friend_post_list_view.dart';
import '../models/models.dart';
import '../components/today_recipe_list_view.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatefulWidget {

  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent
        && !_scrollController.position.outOfRange) {
      print('${_scrollController.offset} reached the bottom');
    }
    if (_scrollController.offset <= _scrollController.position.minScrollExtent
        && !_scrollController.position.outOfRange) {
      print('${_scrollController.offset} reached the top');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final recipes = snapshot.data?.todayRecipes ?? [];
            final friendPosts = snapshot.data?.friendPosts ?? [];
            return ListView(
                controller: _scrollController,
                children: [
              TodayRecipeListView(recipes: recipes),
              const SizedBox(
                height: 16,
              ),
              FriendPostListView(friendPosts: friendPosts),
            ]);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
