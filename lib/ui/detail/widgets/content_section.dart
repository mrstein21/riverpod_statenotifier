
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifier/riverpod/riverpod.dart';
import 'package:riverpod_statenotifier/ui/detail/widgets/recommended_section.dart';
import '../../../model/detail_movie.dart';
import '../../../utils/constant.dart';
import 'field_section.dart';

class ContentSection extends ConsumerWidget {
  const ContentSection({Key? key, required this.movie}) : super(key: key);
  final DetailMovie movie;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final state=ref.read(detailViewModel(movie.id!));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kDefaultPadding/2,),
          FieldSection(field: "Original Title", value: movie.originalTitle!+" (${movie.title!}) "),
          const SizedBox(height: kDefaultPadding/2,),
          FieldSection(field: "Genres", value: movie.genresString),
          const SizedBox(height: kDefaultPadding/2,),
          FieldSection(field: "Tagline", value: movie.tagline==""?"N/A":movie.tagline!),
          const SizedBox(height: kDefaultPadding/2,),
          FieldSection(field: "Synopsis", value: movie.overview!),
          const SizedBox(height: kDefaultPadding,),
          state.isLoadingRecommended || state.listRecommend.isEmpty?
          Container()
          :
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Recommended Movie",style: TextStyle(
                fontSize: 14,
                color: kColorWhite
              ),),
              const SizedBox(height: kDefaultPadding/2,),
              SizedBox(
                height:125,
                child: ListView.builder(
                    itemCount:  state.listRecommend.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_,i){
                      return RecommendationSection(movie: state.listRecommend[i]);
                    }
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
