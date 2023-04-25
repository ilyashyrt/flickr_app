part of 'photo_list_cubit.dart';

enum PhotoListStatus { loading, success, failure }

class PhotoListState extends Equatable {
  const PhotoListState({
    this.photoList,
    required this.status,
  });
  final PhotoList? photoList;
  final PhotoListStatus status;

  PhotoListState copyWith({
    PhotoList? photoList,
    PhotoListStatus? status,
  }) {
    return PhotoListState(
      photoList: photoList ?? this.photoList,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [photoList, status];
}
