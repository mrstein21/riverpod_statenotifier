import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifier/model/detail_movie.dart';
import '../../../model/res/movie_res.dart';
import '../../../provider/movie_provider.dart';
import 'detail_state.dart';

class DetailViewModel extends StateNotifier<DetailState>{
  DetailViewModel(int id):super(DetailState(detailMovie: DetailMovie())){
    loadData(id);
    loadDataRecommendation(id);
  }

  void loadData(int id)async{
    try{
      state=state.copyWith(isLoading: true);
      DetailMovie movieRes= await MovieProvider().geDetailMovie(id.toString());
      state=state.copyWith(
        isLoading: false,
        detailMovie: movieRes
      );
    }catch(error){
      state=state.copyWith(
          isLoading: false,
          isError: "Can't connect to Server ,Please Swipe to refresh request"
      );
    }
  }

  void loadDataRecommendation(int id)async {
    try{
      state=state.copyWith(isLoadingRecommended: true);
      MovieRes movieRes= await MovieProvider().getRecommendation(id);
      state=state.copyWith(isLoadingRecommended: false,listRecommend: movieRes.results!);
    }catch(error){
      state=state.copyWith(
          isLoadingRecommended: false,
      );
    }
  }

}