import 'package:flutter/material.dart';
import '../utility/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker(
      {Key? key,
      required this.sizes,
      required this.onSelected,
      required this.initialSelected})
      : super(key: key);

  final List<String> sizes;
  final Function(int selectIndex) onSelected;
  final int initialSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int _selectedSizeIndex = 0;

  @override
  void initState() {
    _selectedSizeIndex = widget.initialSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.sizes.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            _selectedSizeIndex = index;
            widget.onSelected(index);
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
              color:
                  _selectedSizeIndex == index ? AppColors.primaryColor : null,
            ),
            alignment: Alignment.center,
            child: Text(widget.sizes[index]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 8,
        );
      },
    );
  }
}
