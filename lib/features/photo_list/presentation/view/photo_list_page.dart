import 'package:flickr_app/features/photo_list/data/repository/api_repository.dart';
import 'package:flickr_app/features/photo_list/presentation/cubit/photo_list_cubit.dart';
import 'package:flickr_app/features/photo_list/presentation/view/photo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoListPage extends StatelessWidget {
  PhotoListPage({Key? key}) : super(key: key);

  final ApiRepository apiRepository = ApiRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoListCubit(apiRepository),
      child: PhotoListScreen(),
    );
  }
}
