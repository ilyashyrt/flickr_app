import 'package:flickr_app/features/photo_list/presentation/cubit/photo_list_cubit.dart';
import 'package:flickr_app/features/photo_list/presentation/view/widgets/photo_list_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoListScreen extends StatelessWidget {
  PhotoListScreen({Key? key}) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  List<String?> downloadList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<PhotoListCubit>().downloadImages(downloadList),
        child: const Icon(Icons.download),
      ),
      appBar: AppBar(
        actions: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autocorrect: true,
              maxLines: 1,
              minLines: 1,
              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(color: Colors.white, decoration: TextDecoration.none),
              controller: textEditingController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.white), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.white), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.white), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          )),
          IconButton(
            onPressed: () {
              downloadList = [];
              context.read<PhotoListCubit>().getPhotoList(text: textEditingController.text);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<PhotoListCubit, PhotoListState>(
        builder: (context, state) {
          switch (state.status) {
            case PhotoListStatus.initial:
              return const Center(
                child: Text(
                  'İstediğiniz anahtar kelimeyi girerek arama yapabilirsiniz.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              );
            case PhotoListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PhotoListStatus.success:
              return PhotoListGridView(
                downloadList: downloadList,
              );
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
