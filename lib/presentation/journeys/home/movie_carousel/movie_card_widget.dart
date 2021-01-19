import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_arguments.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_screen.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/data/core/api_constants.dart';

class MovieCardWidget extends StatelessWidget {
  static final baseHeight = ResponsiveSize.screenHeight * 0.35;

  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key key,
    @required this.movieId,
    @required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.s230.w,
      child: Material(
        elevation: 32,
        borderRadius: BorderRadius.circular(Sizes.s16.w),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => MovieDetailsScreen(
                  movieDetailsArguments: MovieDetailsArguments(movieId),
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.s16.w),
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
