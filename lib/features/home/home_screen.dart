import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sard/core/bloc/app_bloc.dart';
import 'package:sard/core/widgets/logo.dart';
import 'package:sard/features/home/widgets/display_authors.dart';
import 'package:sard/features/home/widgets/display_stories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Logo(), automaticallyImplyLeading: false),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          switch (state) {
            case AppLoading _:
              return const Center(child: CircularProgressIndicator());
            case AppLoaded _:
              final authors = state.authors;
              final categories = state.categories;

              return ListView.builder(
                itemCount: categories.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return DisplayAuthors(authors: authors);
                  }
                  final category = categories[index - 1];
                  return DisplayStories(category: category);
                },
              );
            case AppError _:
              return Center(child: Text("Error: ${state.message}"));

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
