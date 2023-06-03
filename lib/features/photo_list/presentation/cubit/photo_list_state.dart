part of 'photo_list_cubit.dart';

enum PhotoListStatus { initial, loading, success, failure }

class PhotoListState extends Equatable {
  const PhotoListState({
    this.photoList,
    required this.status,
    required this.downloadList,
  });
  final PhotoList? photoList;
  final PhotoListStatus status;
  final List<String?> downloadList;

  PhotoListState copyWith({
    PhotoList? photoList,
    PhotoListStatus? status,
    List<String?>? downloadList,
  }) {
    return PhotoListState(
      photoList: photoList ?? this.photoList,
      status: status ?? this.status,
      downloadList: downloadList ?? this.downloadList,
    );
  }

  @override
  List<Object?> get props => [
        photoList,
        status,
        downloadList,
      ];
}
