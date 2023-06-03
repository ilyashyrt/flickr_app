import 'package:flickr_app/features/photo_list/presentation/cubit/photo_list_cubit.dart';
import 'package:flickr_app/features/photo_list/presentation/view/widgets/photo_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoListGridView extends StatelessWidget {
  const PhotoListGridView({
    super.key,
    required this.downloadList,
  });

  final List<String?> downloadList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoListCubit, PhotoListState>(
      builder: (context, state) {
        if (state.status == PhotoListStatus.failure) {
          return const Center(
            child: Text(
              'Bir hata oluştu',
            ),
          );
        }
        if (state.status == PhotoListStatus.success) {
          return GridView.builder(
            itemCount: state.photoList?.photos?.photo?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(7),
                child: PhotoListItem(
                  index: index,
                  downloadList: downloadList,
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
