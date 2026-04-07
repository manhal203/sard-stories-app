import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sard/core/widgets/display_all_stories.dart';
import 'package:sard/models/category_model.dart';
import 'package:sard/core/bloc/app_bloc.dart';

class AuthorStoriesScreen extends StatelessWidget {
  final int authorId;
  const AuthorStoriesScreen({super.key, required this.authorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Author Stories")),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          switch (state) {
            case AppLoading _:
              return Center(child: CircularProgressIndicator());

            case AppLoaded _:
              final allStories = state.categories
                  .expand((c) => c.stories)
                  .toList();
              final authorStories = allStories
                  .where((story) => story.authorId == authorId)
                  .toList();

              return DisplayAllStories(
                category: CategoryModel(
                  category: "Author Stories",
                  stories: authorStories,
                ),
              );
            case AppError _:
              return Center(child: Text("error: ${state.message}"));

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
