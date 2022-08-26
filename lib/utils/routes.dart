import 'package:flutter/cupertino.dart';
import 'package:riverpod_statenotifier/ui/home/home_screen.dart';

import '../ui/detail/detail_screen.dart';

const String homeRoute="/home";
const String detailRoute="/detail";

final routesPage={
  homeRoute:(context)=> const HomeScreen(),
  detailRoute:(context)=>const DetailScreen()
};

goToDetail(BuildContext context,int id){
  Navigator.of(context).pushNamed(detailRoute,arguments: id.toString());
}