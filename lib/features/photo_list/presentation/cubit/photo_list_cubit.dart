import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flickr_app/features/photo_list/data/repository/api_repository.dart';
import 'package:flickr_app/features/photo_list/domain/models/photo_list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_downloader/image_downloader.dart';

part 'photo_list_state.dart';

class PhotoListCubit extends Cubit<PhotoListState> {
  PhotoListCubit(this.apiRepository)
      : super(const PhotoListState(
          status: PhotoListStatus.initial,
          downloadList: [],
        ));

  final ApiRepository apiRepository;

  Future<void> getPhotoList({String text = '', int page = 1, int perPage = 50}) async {
    emit(state.copyWith(status: PhotoListStatus.loading));
    try {
      final photoList = await apiRepository.getPhotoList(text: text, page: page, perPage: perPage);
      if (photoList != null) {
        return emit(
          state.copyWith(
            status: PhotoListStatus.success,
            photoList: photoList,
          ),
        );
      }
    } catch (_) {
      emit(state.copyWith(status: PhotoListStatus.failure));
    }
  }

  Future<void> downloadImages(List<String?> downloadList) async {
    List<File> files = [];

    for (var url in downloadList) {
      try {
        var imageId = await ImageDownloader.downloadImage(url ?? '').catchError((error) {
          print(error);
        });
        if (imageId != null) {
          var path = await ImageDownloader.findPath(imageId);
          files.add(File(path!));
        }
      } catch (error) {
        print(error);
      }
    }
  }
}
