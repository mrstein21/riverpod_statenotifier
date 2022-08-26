import 'package:equatable/equatable.dart';
import 'package:riverpod_statenotifier/model/detail_movie.dart';

import '../../../model/movie.dart';

class DetailState extends Equatable{
  final bool isLoading;
  final DetailMovie detailMovie;
  final String isError;
  final List<Movie>listRecommend;
  final bool isLoadingRecommended;

  const DetailState({
    this.isLoading=false,
    required this.detailMovie,
    this.isError="",
    this.isLoadingRecommended=false,
    this.listRecommend=const[]
  });

  DetailState copyWith({
    bool? isLoading,
    DetailMovie? detailMovie,
    bool? isLoadingRecommended,
    List<Movie>? listRecommend,
    String? isError}){
    return DetailState(
        isError: isError ?? this.isError,
        isLoading: isLoading ?? this.isLoading,
        detailMovie: detailMovie ?? this.detailMovie,
        isLoadingRecommended: isLoadingRecommended ?? this.isLoadingRecommended,
        listRecommend: listRecommend ?? this.listRecommend
    );
  }

  @override
  List<Object?> get props => [isLoading,detailMovie,isError];

}