import 'package:flickr_app/features/photo_list/presentation/cubit/photo_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoListScreen extends StatelessWidget {
  const PhotoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PhotoListCubit, PhotoListState>(
        builder: (context, state) {
          switch (state.status) {
            case PhotoListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PhotoListStatus.success:
              return Center(child: Text(state.photoList!.photos!.photo![0].title.toString()));
            case PhotoListStatus.failure:
              return const Center(
                child: Text('Bir hata oluştu!'),
              );
          }
        },
      ),
    );
  }
}
