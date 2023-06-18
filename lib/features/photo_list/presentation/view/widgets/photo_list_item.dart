import 'package:flickr_app/features/photo_list/presentation/cubit/photo_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoListItem extends StatefulWidget {
  const PhotoListItem({
    super.key,
    required this.index,
    required this.downloadList,
  });
  final int index;
  final List<String?> downloadList;

  @override
  State<PhotoListItem> createState() => _PhotoListItemState();
}

class _PhotoListItemState extends State<PhotoListItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoListCubit, PhotoListState>(
      builder: (context, state) {
        final cubit = context.read<PhotoListCubit>();
        return InkWell(
          onTap: () {
            setState(() {});
            cubit.toggleCheck(index: widget.index, value: !state.isCheckedList![widget.index]);
          },
          child: Card(
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
                    state.photoList?.photos?.photo?[widget.index].url ?? '',
                    width: 130,
                    height: 130,
                    fit: BoxFit.fill,
                    errorBuilder: (_, __, ___) {
                      return Text('Hata oluştu');
                    },
                  ),
                  Checkbox(
                    value: state.isCheckedList![widget.index],
                    onChanged: (value) {
                      setState(() {});
                      cubit.toggleCheck(index: widget.index, value: value!);
                      if (value == true) {
                        widget.downloadList.add(state.photoList?.photos?.photo?[widget.index].url);
                      } else {
                        widget.downloadList.remove(state.photoList?.photos?.photo?[widget.index].url);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
