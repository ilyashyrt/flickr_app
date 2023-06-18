part of 'photo_list_cubit.dart';

enum PhotoListStatus { initial, loading, success, failure }

class PhotoListState extends Equatable {
  const PhotoListState({
    this.photoList,
    this.isCheckedList,
    required this.status,
    required this.downloadList,
  });
  final PhotoList? photoList;
  final PhotoListStatus status;
  final List<String?> downloadList;
  final List<bool>? isCheckedList;

  PhotoListState copyWith({
    PhotoList? photoList,
    PhotoListStatus? status,
    List<String?>? downloadList,
    List<bool>? isCheckedList,
  }) {
    return PhotoListState(
      photoList: photoList ?? this.photoList,
      status: status ?? this.status,
      downloadList: downloadList ?? this.downloadList,
      isCheckedList: isCheckedList ?? this.isCheckedList,
    );
  }

  @override
  List<Object?> get props => [
        photoList,
        status,
        downloadList,
        isCheckedList,
      ];
}
