import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableDropDownWidget extends StatelessWidget {
  ReusableDropDownWidget(
      {Key? key,
      this.onChanged,
      this.items,
      this.validator,
      required this.value,
      required this.hint})
      : super(key: key);
  final Function(dynamic)? onChanged;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  List<DropdownMenuItem<String>>? items;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(hint!),
      icon: const Icon(Icons.expand_more),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(width: 0.0, color: Colors.grey),
          ),
          isDense: true),
      value: value,
      validator: validator,
      items: items,
      onChanged: onChanged,
      padding: EdgeInsets.zero,
    );
  }
}