import 'package:equatable/equatable.dart';
import 'package:riverpod_statenotifier/model/movie.dart';

class HomeState extends Equatable{
  final List<Movie>list;
  final bool isLoading;
  final int page;
  final bool hasReachMax;
  final String isError;


  const HomeState({
    this.list=const [],
    this.isLoading=false,
    this.page=1,
    this.hasReachMax=false,
    this.isError=""
  });

  HomeState copyWith({
    List<Movie>?list,
    bool? isLoading,
    int? page,
    bool? hasReachMax,
    String? isError
  }){
    return HomeState(
        list: list ?? this.list,
        isLoading: isLoading ?? this.isLoading,
        page: page ?? this.page,
        hasReachMax: hasReachMax ?? this.hasReachMax,
        isError: isError ?? this.isError
    );
  }

  HomeState addListMovie(List<Movie> list){
    return copyWith(
       page: page+1,
       list: [...this.list,...list],
       isLoading: false,
       hasReachMax: list.isEmpty?true:false
    );
  }



  @override
  // TODO: implement props
  List<Object?> get props => [list,isLoading,page,hasReachMax];

}