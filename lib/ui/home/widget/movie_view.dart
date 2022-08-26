import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_statenotifier/model/movie.dart';
import 'package:riverpod_statenotifier/utils/constant.dart';
import 'package:riverpod_statenotifier/utils/routes.dart';

class MovieView extends StatelessWidget {
  final Movie movie;
  const MovieView({
    required this.movie
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        goToDetail(context, movie.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding/2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: 80,
              height: 120,
              imageUrl: kImageAddress+movie.poster_path,
              imageBuilder: (context,imageProvider)=>Image(image: imageProvider,),
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: kDefaultPadding/2,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),),
                  const SizedBox(height: 5),
                  Text(movie.release_date,style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white
                  )),
                  const SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(Icons.star,color: Colors.yellow,size: 16,),
                      const SizedBox(width: kDefaultPadding/4,),
                      Text(movie.vote_average.toString(),style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12
                      )),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding/4,),
                  Text(movie.overview,
                    style: const TextStyle(
                    fontSize: 12,
                    color: kColorWhite,
                    fontWeight: FontWeight.bold),
                    maxLines: 4,overflow: TextOverflow.ellipsis,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
