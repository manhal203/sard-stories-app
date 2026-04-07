import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/core/widgets/button.dart';
import 'package:sard/core/widgets/hex_to_color.dart';
import 'package:sard/features/author/bloc/author_bloc.dart';
import 'package:sard/routes/route_keys.dart';
import 'package:sizer/sizer.dart';

class AuthorInfoScreen extends StatelessWidget {
  final int authorId;
  const AuthorInfoScreen({super.key, required this.authorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Author Details")),
      body: BlocBuilder<AuthorBloc, AuthorState>(
        builder: (context, state) {
          switch (state) {
            case AuthorLoading _:
              return Center(child: CircularProgressIndicator());
            case AuthorLoaded _:
              final author = state.author;
              final authorColor = hexToColor(author.color);

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 2.sp),
                    CircleAvatar(
                      backgroundColor: authorColor,
                      radius: 60,
                      child: Icon(
                        Icons.person_outlined,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 1.h),

                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            author.authorName,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),

                          Text(
                            author.summary,
                            style: TextStyle(fontSize: 18.sp, height: 0.2.h),
                          ),
                          SizedBox(height: 5.h),

                          CustomButton(
                            text: "View Stories",
                            onPressed: () {
                              context.push(
                                RouteKeys.authorStoriesScreen,
                                extra: author.authorId,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );

            case AuthorError _:
              return Center(child: Text(state.message));

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
