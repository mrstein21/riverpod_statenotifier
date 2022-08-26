import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_statenotifier/utils/routes.dart';
import '../../../model/movie.dart';
import '../../../utils/constant.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        goToDetail(context, movie.id);
      },
      child: Container(
        margin: const EdgeInsets.only(right: kDefaultPadding/2),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: 100,
              height: 80,
              imageUrl: kImageAddress+movie.poster_path,
              imageBuilder: (context,imageProvider)=>Image(image: imageProvider,fit: BoxFit.cover,),
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: kDefaultPadding/4,),
            Text(movie.title,style: const TextStyle(
              fontSize: 12,
              color: kColorWhite
            ),maxLines: 2,overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }
}
