import 'package:animate_do/animate_do.dart';
import 'package:film/movie/presentaion/controller/bloc/movie_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utills/contant.dart';
import '../../../../core/utills/enum.dart';
import '../../../../core/widgets/loading_widget.dart';

class ActorMovieWidget extends StatelessWidget {
  const ActorMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous.actorsState != current.actorsState,
      builder: (context, state) {
        return FadeInUp(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 60.0,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: state.actorsList.length,
              itemBuilder: (context, index) {
                final actor = state.actorsList[index];
                return Row(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: actor.profilePath == null ||
                                  actor.profilePath.isEmpty
                              ? NetworkImage(
                                  'https://image.tmdb.org/t/p/w500/borthNRiTGa7oKZjLKHuUGUrZdq.jpg')
                              : NetworkImage(
                                  '${AppConstant.imageUrl(actor.profilePath)}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          actor.name,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          actor.character,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10.0,
                );
              },
            ),
          ),
        );
        // switch (state.actorsState) {
        //   case RequestState.loading:
        //     return const LoadingWidgets();

        //   case RequestState.loaded:
        //     return FadeInUp(
        //       duration: const Duration(milliseconds: 500),
        //       child: SizedBox(
        //         height: 70.0,
        //         child: ListView.separated(
        //           shrinkWrap: true,
        //           scrollDirection: Axis.horizontal,
        //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //           itemCount: 6,
        //           itemBuilder: (context, index) {
        //             return Container(
        //               color: Colors.yellow,
        //               width: 30.0,
        //               height: 70.0,
        //             );
        //           },
        //           separatorBuilder: (context, index) {
        //             return const SizedBox(
        //               width: 8.0,
        //             );
        //           },
        //         ),
        //       ),
        //     );

        //   case RequestState.error:
        //     return SizedBox(
        //       height: 170.0,
        //       child: Center(
        //         child: Text(state.actorsMessage),
        //       ),
        //     );
        // }
      },
    );
  }
}