import 'package:equatable/equatable.dart';
import 'package:flickr_app/features/photo_list/data/repository/api_repository.dart';
import 'package:flickr_app/features/photo_list/domain/models/photo_list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'photo_list_state.dart';

class PhotoListCubit extends Cubit<PhotoListState> {
  PhotoListCubit()
      : super(const PhotoListState(
          status: PhotoListStatus.loading,
        ));

  final ApiRepository apiRepository = ApiRepository();

  Future<void> getPhotoList({String text = '', int page = 1, int perPage = 50}) async {
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
}
