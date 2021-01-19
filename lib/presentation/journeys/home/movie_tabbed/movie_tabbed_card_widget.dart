import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_arguments.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_screen.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:truncate/truncate.dart';

class MovieTabbedCardWidget extends StatelessWidget {
  final int movieId;
  final String title;
  final String posterPath;

  const MovieTabbedCardWidget({
    Key key,
    @required this.title,
    @required this.posterPath,
    @required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MovieDetailsScreen(
              movieDetailsArguments: MovieDetailsArguments(movieId),
            ),
          ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.s16.w),
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Text(
            truncate(title, 15),
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
