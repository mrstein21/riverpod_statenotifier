import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifier/model/res/movie_res.dart';
import 'package:riverpod_statenotifier/provider/movie_provider.dart';
import 'package:riverpod_statenotifier/ui/home/view_model/home_state.dart';


class HomeViewModel extends StateNotifier<HomeState>{
  HomeViewModel():super(const HomeState()){
    loadData();
  }

  void loadData()async{
    try{
      state=state.copyWith(isLoading: true);
      MovieRes movieRes= await MovieProvider().getTopRatedMovie(state.page);
      state=state.addListMovie(movieRes.results!);
    }catch(error){
     state=state.copyWith(
          isLoading: false,
          isError: "Can't connect to Server !"
      );
    }
  }

  void resetData()async{
    try{
      state=state.copyWith(isLoading: true,list: [],hasReachMax: false,isError: "",page: 1);
      MovieRes movieRes= await MovieProvider().getTopRatedMovie(1);
      state=state.addListMovie(movieRes.results!);
    }catch(error){
      state=state.copyWith(
          isLoading: false,
          isError: "Can't connect to Server ,Please Swipe to refresh request "
      );
    }
  }



}