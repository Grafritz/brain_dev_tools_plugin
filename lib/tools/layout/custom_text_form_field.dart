import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label, labelText, hintText, initialValue;
  final bool readOnly, enabled, autofocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputFormatter? textInputFormatter;
  final int? maxLines, minLines, maxLength;
  final Widget? suffixIcon, prefixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged, onFieldSubmitted;
  final GestureTapCallback? onTap;
  final Function? suffixIconOnTap;
  final VoidCallback? onEditingComplete;

  const CustomTextFormField({
    super.key,
    this.label,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines,
    this.minLines,
    this.keyboardType,
    this.maxLength,
    this.controller,
    this.focusNode,
    this.textInputFormatter,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.suffixIconOnTap,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      autofocus: autofocus,
      readOnly: readOnly,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      focusNode: focusNode,
      maxLength: maxLength,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(5.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 0.1, color: Theme.of(context).primaryColor)),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
      ),
      onTap: onTap,
      initialValue: initialValue,
      // ignore: missing_return
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
    );
  }
}
