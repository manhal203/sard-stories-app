import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/core/widgets/button.dart';
import 'package:sard/features/favorites/cubit/favorite_cubit.dart';
import 'package:sard/features/story/bloc/story_bloc.dart';
import 'package:sard/features/story/widgets/rating_stars.dart';
import 'package:sizer/sizer.dart';
import 'package:sard/routes/route_keys.dart';

class StoryInfoScreen extends StatelessWidget {
  final int id;

  const StoryInfoScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Story Details")),
      body: BlocBuilder<StoryBloc, StoryState>(
        builder: (context, state) {
          switch (state) {
            case StoryLoading _:
              return Center(child: CircularProgressIndicator());
            case StoryLoaded _:
              final story = state.story;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AnyImageView(
                      imagePath: story.image,
                      fit: BoxFit.cover,
                      errorWidget: Icon(Icons.error, color: Colors.red),
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  story.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  context.watch<FavoriteCubit>().isFavorite(
                                        story.id,
                                      )
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                  size: 4.h,
                                ),
                                onPressed: () {
                                  context.read<FavoriteCubit>().favoriteButton(
                                    story,
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Age: ${story.age}",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RatingStars(rating: story.review),
                              SizedBox(width: 2.w),
                              Text(
                                "${story.review}/5",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            story.description,
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          SizedBox(height: 2.h),
                          CustomButton(
                            text: "Read Story",
                            onPressed: () {
                              context.push(RouteKeys.storyScreen, extra: story);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            case StoryError _:
              return Center(child: Text(state.message));

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
