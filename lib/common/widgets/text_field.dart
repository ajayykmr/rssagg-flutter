import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rssagg_flutter/theme/theme.dart';

class MyTextFormField extends StatefulWidget {
  final String title;
  final Widget? leadingIcon;
  final bool isPass;
  final TextInputType? keyboardType;
  final TextEditingController controller;

  const MyTextFormField({
    super.key,
    required this.title,
    this.leadingIcon,
    this.isPass = false,
    this.keyboardType,
    required this.controller,
  });

  @override
  State<MyTextFormField> createState() => __MyTextFormFieldState();
}

class __MyTextFormFieldState extends State<MyTextFormField> {
  static const UnderlineInputBorder border = UnderlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: AppColor.dividerColor,
    ),
  );
  static const UnderlineInputBorder focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: AppColor.textColorSecondary,
    ),
  );

  static const BoxConstraints iconConstraints = BoxConstraints(
    minWidth: 26,
    minHeight: 26,
  );

  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPass;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyle.highlightedLabel1,
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          onTapOutside: (event){
            FocusScope.of(context).unfocus();
          },
          controller: widget.controller,
          style: AppTextStyle.textField,
          keyboardType: widget.keyboardType,
          obscureText: _isObscure,
          decoration: InputDecoration(
            border: border,
            focusedBorder: focusedBorder,
            enabledBorder: border,

            isDense: true,
            contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
            prefixIcon: widget.leadingIcon==null ? null : Padding(
              padding: const EdgeInsets.all(4.0),
              child: widget.leadingIcon,
            ),
            prefixIconConstraints: iconConstraints,
            suffixIcon: widget.isPass == false
                ? null
                : InkWell(
                    onTap: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        Assets.eye,
                        colorFilter: const ColorFilter.mode(
                            AppColor.textColorSecondary, BlendMode.srcIn),
                      ),
                    ),
                  ),
            suffixIconConstraints: iconConstraints,
          ),
        ),
      ],
    );
  }
}
