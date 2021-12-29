import 'package:flutter/material.dart';

import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/components/friend_post_list_view.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/components/today_recipe_list_view.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final recipes = snapshot.data?.todayRecipes ?? [];
            final friendPosts = snapshot.data?.friendPosts ?? [];
            return ListView(children: [
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
