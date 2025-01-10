import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({super.key, required this.label, required this.onChanged, required this.onTap, required this.readOnly, this.keyboardType, this.prefixIcon, this.postfixIcon, this.errorMsg, this.hint});

  final String label;
  final String? hint;
  final Function(String) onChanged;
  final Function()? onTap;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final String? errorMsg;
  final Widget? prefixIcon;
  final Widget? postfixIcon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(label,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16
        ),),

        TextField(
          onChanged: onChanged,
          readOnly: readOnly != null ? true : false,
          onTap: onTap,
          keyboardType : keyboardType != null ? keyboardType : TextInputType.text,
        
          decoration: InputDecoration(
            hintText: hint,
            errorText: (errorMsg != null) ? errorMsg : null,
            prefixIcon: prefixIcon,
            suffix: postfixIcon,
            filled: true,
            fillColor: const Color.fromARGB(255, 214, 213, 213),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )
          ),
        ),
      ],
    );
  }
}