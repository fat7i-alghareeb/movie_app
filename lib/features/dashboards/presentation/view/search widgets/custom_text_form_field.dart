import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/search%20cubit/search_cubit.dart';
import '../../../../../constants.dart';
import '../../../../../utils/extensions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
  });

  final TextEditingController controller;
  final Widget prefixIcon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: context.onPrimaryColor(),
      ),
      onSubmitted: (value) {
        context.read<SearchCubit>().fetchSearchedMovies(
              searchText: controller.text.trim(),
            );
      },
      textInputAction: TextInputAction.search,
      cursorColor: context.onPrimaryColor(),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.borderRadius),
          borderSide: BorderSide(
            color: context.primaryColor(),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.borderRadius),
          borderSide: BorderSide(
            color: context.onPrimaryColor().withOpacity(0.5),
          ),
        ),
        filled: true,
        fillColor: context.neutralColor(),
        hintText: hintText,
        hintStyle: TextStyle(
          color: context.onPrimaryColor().withOpacity(0.3),
        ),
      ),
    );
  }
}
