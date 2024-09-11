import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.margin,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.onTapSuffixIcon,
      this.hintText,
      this.validator,
      this.obscureText = false,
      this.keyboardType,
      this.readOnly = false,
      this.onTap,
      this.color,
      this.borderColor,
      this.height,
      this.helperText});
  final String? hintText;
  final EdgeInsets? margin;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? onTapSuffixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final Color? color;
  final Color? borderColor;
  final double? height;
  final String? helperText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isHidden;
  @override
  void initState() {
    isHidden = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height ?? 60,
      decoration: BoxDecoration(
          color: widget.color ?? const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.borderColor ?? const Color(0xffA8A8A9),
            width: 1,
          )),
      child: Center(
        child: TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: isHidden,
          keyboardType: widget.keyboardType,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          decoration: InputDecoration(
            // helperText: widget.helperText ?? null,
            // helperStyle: AppStyles.styleMedium16(context).copyWith(
            //   color: Colors.black,
            // ),
            hintText: widget.hintText ?? widget.helperText,
            hintStyle: widget.helperText != null
                ? const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  )
                : const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff757575),
                  ),
            prefixIcon: widget.prefixIcon,
            prefixIconColor: const Color(0xff626262),
            suffixIcon: widget.suffixIcon != null
                ? GestureDetector(
                    onTap: widget.onTapSuffixIcon,
                    child: widget.suffixIcon!,
                  )
                : toggleVisibility(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget? toggleVisibility() {
    if (widget.obscureText) {
      return GestureDetector(
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
        child: Icon(
          isHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: const Color(0xff626262),
        ),
      );
    }
    return null;
  }
}
