import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifier/ui/detail/view_model/detail_view_model.dart';
import 'package:riverpod_statenotifier/ui/home/view_model/home_state.dart';
import 'package:riverpod_statenotifier/ui/home/view_model/home_view_model.dart';

import '../ui/detail/view_model/detail_state.dart';

final homeViewModel = StateNotifierProvider<HomeViewModel,HomeState>(
      (ref) => HomeViewModel(),
);
final detailViewModel= StateNotifierProvider.family<DetailViewModel,DetailState,int>((ref,int id)=>
    DetailViewModel(id)
);