import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sard/core/bloc/app_bloc.dart';
import 'package:sard/core/widgets/display_all_stories.dart';
import 'package:sard/models/category_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for a story ...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                context.read<AppBloc>().add(SearchStoriesEvent(value));
              },
            ),
          ),
        ),
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          switch (state) {
            case AppLoading _:
              return Center(child: CircularProgressIndicator());
            case AppLoaded _:
              final stories =
                  state.filteredStories ??
                  state.categories.expand((c) => c.stories).toList();

              if (stories.isEmpty) {
                return const Center(child: Text("No matching results found"));
              }

              return DisplayAllStories(
                category: CategoryModel(
                  category: "Search Results",
                  stories: stories,
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
