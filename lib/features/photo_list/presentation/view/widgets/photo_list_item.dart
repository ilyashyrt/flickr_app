import 'package:flickr_app/features/photo_list/presentation/cubit/photo_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoListItem extends StatelessWidget {
  const PhotoListItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoListCubit, PhotoListState>(
      builder: (context, state) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 3,
          shadowColor: Colors.white,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  state.photoList?.photos?.photo?[index].urlT ?? '',
                  width: 120,
                  height: 120,
                  fit: BoxFit.fitHeight,
                ),
                Text(
                  state.photoList?.photos?.photo?[index].title ?? '',
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
