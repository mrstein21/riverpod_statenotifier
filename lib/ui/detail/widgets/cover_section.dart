import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/detail_movie.dart';
import '../../../utils/constant.dart';

class CoverSection extends StatelessWidget {
  const CoverSection({Key? key,required this.movie}) : super(key: key);
  final DetailMovie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: Stack(
          children: [
            CachedNetworkImage(
              width: double.infinity,
              height: 250,
              imageUrl: kImageAddress+movie.backdropPath!,
              imageBuilder: (context,imageProvider)=>Image(image: imageProvider,),
              placeholder: (context, url) => Container(
                  color: kColorBlack,
                  child: Center(child: const CircularProgressIndicator())
              ),
              errorWidget: (context, url, error) => Container(
                  color: kColorBlack,
                  child: const Center(child: CircularProgressIndicator())
              ),
            ),
            // Image.network(kImageAddress+movie.backdropPath!,height: 250,),
            Positioned(
                top: kDefaultPadding/4*6,
                left: kDefaultPadding/2,
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.7)
                    ),
                    padding: const EdgeInsets.all(kDefaultPadding/2),
                    child: const Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                )
            ),
            Positioned(
                left: kDefaultPadding/2,
                bottom: 0,
                child: CachedNetworkImage(
                  width: 80,
                  height: 150,
                  imageUrl: kImageAddress+movie.posterPath!,
                  imageBuilder: (context,imageProvider)=>Image(image: imageProvider,),
                  placeholder: (context, url) => Container(
                      color: kColorBlack,
                      child: const Center(child: CircularProgressIndicator())
                  ),
                  errorWidget: (context, url, error) => Container(
                      color: kColorBlack,
                      child: const Center(child: CircularProgressIndicator())
                  ),
                )
            ),
            Positioned(
                left:90+(kDefaultPadding/5) ,
                bottom: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title!,style: const TextStyle(
                      fontSize: 14,
                      color: kColorWhite
                    ),),
                    const SizedBox(height: kDefaultPadding/10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.star,color: Colors.yellow,size: 15,),
                        Text(" (${(movie.voteAverage!/10)*5})",style: const TextStyle(
                          fontSize: 12,
                          color: kColorWhite
                        ),),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding/4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Release Date :",style: TextStyle(
                          color: kColorWhite,
                          fontSize: 12
                        ),),
                        const SizedBox(width: kDefaultPadding/5,),
                        Text(movie.releaseDate!,style: const TextStyle(
                          fontSize: 12,
                          color: kColorWhite
                        ),),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding/4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Runtime :",style: TextStyle(
                          color: kColorWhite,
                          fontSize: 12
                        ),),
                        const SizedBox(width: kDefaultPadding/5,),
                        Text("${movie.runtime!} min",style: const TextStyle(
                          fontSize: 12,
                          color: kColorWhite
                        ),),
                      ],
                    ),
                  ],
                ))
          ]
      ),
    );
  }
}
