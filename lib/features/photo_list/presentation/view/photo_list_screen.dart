import 'package:flickr_app/features/photo_list/presentation/cubit/photo_list_cubit.dart';
import 'package:flickr_app/features/photo_list/presentation/view/widgets/photo_list_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoListScreen extends StatelessWidget {
  PhotoListScreen({Key? key}) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(child: TextField(controller: textEditingController)),
          IconButton(
            onPressed: () => context.read<PhotoListCubit>().getPhotoList(text: textEditingController.text),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<PhotoListCubit, PhotoListState>(
        builder: (context, state) {
          switch (state.status) {
            case PhotoListStatus.initial:
              return const Center(child: Text('İstediğiniz anahtar kelimeyi girerek arama yapabilirsiniz'));
            case PhotoListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PhotoListStatus.success:
              return const PhotoListGridView();
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
