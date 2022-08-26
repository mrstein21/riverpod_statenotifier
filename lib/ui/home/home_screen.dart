import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifier/riverpod/riverpod.dart';
import 'package:riverpod_statenotifier/ui/home/widget/loading_view.dart';
import 'package:riverpod_statenotifier/ui/home/widget/movie_view.dart';
import 'package:riverpod_statenotifier/widget/error_view.dart';

import '../../utils/constant.dart';
import '../../utils/logging.dart';

class HomeScreen extends ConsumerStatefulWidget{
   const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
   final ScrollController _scrollController=ScrollController();

   @override
  void initState() {
     _scrollController.addListener(() {
       listenScroll();
     });
    // TODO: implement initState
    super.initState();
  }

  void listenScroll(){
    final viewModel=ref.read(homeViewModel.notifier);
    final state=ref.read(homeViewModel);
    if(_scrollController.offset==_scrollController.position.maxScrollExtent ){
      if(state.isLoading==false){
        viewModel.loadData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state=ref.watch(homeViewModel);
    final viewModel=ref.read(homeViewModel.notifier);
    return Scaffold(
      backgroundColor:kColorDark,
      appBar: AppBar(
        backgroundColor: kColorBlack,
        title: const Text("Top Rated Movie",style: TextStyle(
          fontSize: 12
        ),),
      ),
      body: state.isLoading && state.list.isEmpty?
          const LoadingView():
          RefreshIndicator(
            onRefresh: ()async{
              viewModel.resetData();
            },
            child: state.isError.isNotEmpty?
            ErrorView(message: state.isError)    
                :
            ListView.builder(
                controller: _scrollController,
                itemCount:
                state.hasReachMax?state.list.length:
                state.list.length+1,
                itemBuilder:(_,index){
                  if(index<state.list.length){
                    return MovieView(movie: state.list[index]);
                  }else{
                    return const LoadingView();
                  }
                }
            )
          )
      );
  }
}
