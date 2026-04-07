import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/features/favorites/cubit/favorite_cubit.dart';
import 'package:sard/models/story_model.dart';
import 'package:sard/routes/route_keys.dart';
import 'package:sizer/sizer.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<FavoriteCubit, List<StoryModel>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return Center(child: Text("No favorites found"));
          }
          return Padding(
            padding: EdgeInsets.all(4.w),
            child: ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                final story = state[index];

                return GestureDetector(
                  onTap: () {
                    context.push(RouteKeys.storyInfoScreen, extra: story.id);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 2.h),
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25.w,
                          height: 12.h,
                          child: AnyImageView(
                            imagePath: story.image,
                            fit: BoxFit.cover,
                            errorWidget: const Icon(Icons.error),
                          ),
                        ),

                        SizedBox(width: 4.w),

                        Expanded(
                          child: Text(
                            story.title,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
