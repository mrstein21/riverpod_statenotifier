import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifier/widget/error_view.dart';

import '../../riverpod/riverpod.dart';
import '../../utils/constant.dart';
import 'widgets/content_section.dart';
import 'widgets/cover_section.dart';
import 'widgets/section_header.dart';


class DetailScreen extends ConsumerWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    final state=ref.watch(detailViewModel(int.parse(id)));
    final viewModel=ref.read(detailViewModel(int.parse(id)).notifier);
    return SafeArea(
        child: Scaffold(
            backgroundColor: kColorDark,
            body: state.isLoading?Container(
              width: double.infinity,
              height: double.infinity,
              color: kColorBlack,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ):
            RefreshIndicator(
              onRefresh: ()async{
                viewModel.loadData(int.parse(id));
                viewModel.loadDataRecommendation(int.parse(id));
              },
              child: state.isError.isNotEmpty?
              ErrorView(message: state.isError)
                  :
              NestedScrollView(
                  headerSliverBuilder:  (BuildContext context, bool innerBoxIsScrolled){
                    return <Widget>[
                      SliverLayoutBuilder(
                        builder: (context, constraint) {
                          return SliverAppBar(
                            elevation: 0,
                            floating: true,
                            backgroundColor: kColorDark,
                            expandedHeight: 340,
                            pinned: true,
                            title: constraint.scrollOffset > 10
                                ? SectionHeader(
                              name: state.detailMovie.title!,
                            )
                                : Container(),
                            centerTitle: false,
                            automaticallyImplyLeading: false,
                            titleSpacing: 0,
                            flexibleSpace: FlexibleSpaceBar(
                              background: CoverSection(
                                movie: state.detailMovie,
                              ),
                            ),
                          );
                        },
                      )
                    ];
                  },
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContentSection(movie: state.detailMovie)
                    ],
                  )
              ),
            )
        )
    );
  }
}
