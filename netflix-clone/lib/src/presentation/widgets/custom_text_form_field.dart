import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netfix_clone/src/presentation/widgets/field_validator.dart';
import 'package:netfix_clone/src/utils/custom_colors.dart';
import 'package:netfix_clone/src/utils/enums.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String? placeholderText;
  final String? hintText;
  final ValidatorResult? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final int? maxLength;
  final int? numberOfLines;
  final double? height;
  final String? initialValue;
  final Color? fillColor;
  final bool enabled;
  final bool readOnly;
  final bool filled;
  final bool autoFocus;
  final bool maxLines;
  final bool isPassword;
  final bool validateOnChange;
  final bool validateOnSubmit;
  final bool changeBorderOnValidate;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final EdgeInsets padding;
  final InputBorder? inputDecorationBorder;
  final InputBorder? focusedInputDecorationBorder;
  final TextStyle? placeholderStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;
  final TextStyle? labelStyle;
  final List<TextInputFormatter> inputFormatterList;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final BorderRadius? borderRadius;
  final Border? border;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isDense;
  final Alignment verticalAlign;
  const CustomTextField({
    this.isDense = false,
    this.verticalAlign = Alignment.topLeft,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLength,
    this.validator,
    this.initialValue,
    this.fillColor,
    this.errorStyle,
    this.focusNode,
    this.labelStyle,
    this.placeholderStyle,
    this.placeholderText,
    this.hintStyle,
    this.hintText,
    this.textStyle,
    this.borderRadius,
    this.height,
    this.numberOfLines = 1,
    this.filled = false,
    this.enabled = true,
    this.validateOnChange = false,
    this.validateOnSubmit = false,
    this.changeBorderOnValidate = true,
    this.maxLines = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.isPassword = false,
    this.textAlign = TextAlign.start,
    this.inputFormatterList = const [],
    this.keyboardType = TextInputType.text,
    this.inputDecorationBorder = InputBorder.none,
    this.focusedInputDecorationBorder = InputBorder.none,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    this.border,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  ValidatorResult? validatorResult;
  bool passwordVisible = false;
  Widget? sufixIcon;
  @override
  void initState() {
    if (widget.isPassword) {
      passwordVisible = true;
      sufixIcon = Icon(
        Icons.remove_red_eye_outlined,
        color: CustomColors.mediumGrey200,
      );
    }
    super.initState();
  }

  setPasswordVisible() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
    if (passwordVisible) {
      setState(() {
        sufixIcon = Icon(
          Icons.visibility_outlined,
          color: CustomColors.mediumGrey200,
        );
      });
    } else {
      setState(() {
        sufixIcon = Icon(
          Icons.visibility_off_outlined,
          color: CustomColors.mediumGrey200,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label != null || widget.hintText != null)
          Padding(
            padding: widget.padding.copyWith(top: 0, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.label ?? "",
                    style: widget.labelStyle ??
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: CustomColors.black,
                            ),
                  ),
                ),
                Text(
                  widget.hintText ?? "",
                  style: widget.hintStyle ??
                      Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: CustomColors.black,
                          ),
                ),
              ],
            ),
          ),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(9),
            border: ValidatorResult.getBorder(
              validatorResult: validatorResult,
              context: context,
              border: widget.border,
              changeBorderOnValidate: widget.changeBorderOnValidate,
            ),
            color: widget.filled ? widget.fillColor : const Color(0xffffffff),
          ),
          child: Localizations(
            locale: const Locale('en', 'US'),
            delegates: const <LocalizationsDelegate<dynamic>>[
              DefaultWidgetsLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
            ],
            child: MediaQuery(
              data: const MediaQueryData(),
              child: Row(
                children: [
                  if (widget.prefixIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 10.71),
                      child: widget.prefixIcon,
                    ),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Align(
                        alignment: widget.verticalAlign,
                        child: TextFormField(
                          cursorColor: CustomColors.white,
                          cursorHeight: 20,
                          scrollPadding: EdgeInsets.zero,
                          key: widget.key,
                          maxLength: widget.maxLength,
                          enabled: widget.enabled,
                          controller: widget.controller,
                          textInputAction: widget.numberOfLines == null ||
                                  widget.numberOfLines == 1
                              ? TextInputAction.next
                              : TextInputAction.newline,
                          validator: (value) {
                            if (widget.validator != null) {
                              setState(() {
                                validatorResult = widget.validator!(value);
                              });
                              if (validatorResult != null &&
                                  validatorResult!.validatorStatus !=
                                      ValidatorStatus.success) {
                                return "";
                              }
                            }
                            return null;
                          },
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          onChanged: (value) {
                            if (widget.onChanged != null) {
                              widget.onChanged!(value);
                            }
                            if (widget.validator != null &&
                                widget.validateOnChange) {
                              setState(() {
                                validatorResult = widget.validator!(value);
                              });
                            }
                          },
                          onFieldSubmitted: (value) {
                            if (widget.onFieldSubmitted != null) {
                              widget.onFieldSubmitted!(value);
                            }
                            if (widget.validator != null &&
                                widget.validateOnSubmit) {
                              setState(() {
                                validatorResult = widget.validator!(value);
                              });
                            }
                          },
                          keyboardType: widget.numberOfLines == null ||
                                  widget.numberOfLines == 1
                              ? widget.keyboardType
                              : TextInputType.multiline,
                          obscureText: passwordVisible,
                          inputFormatters: widget.inputFormatterList,
                          textAlign: widget.textAlign,
                          maxLines:
                              widget.maxLines ? null : widget.numberOfLines,
                          initialValue: widget.initialValue,
                          focusNode: widget.focusNode,
                          autofocus: widget.autoFocus,
                          style: widget.textStyle ??
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: CustomColors.white,
                                  ),
                          decoration: InputDecoration(
                            hintText: widget.placeholderText,
                            errorStyle: const TextStyle(fontSize: 0, height: 0),
                            hintStyle: widget.placeholderStyle ??
                                Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: const Color(0xff909090),
                                    ),
                            border: widget.inputDecorationBorder,
                            focusedBorder: widget.focusedInputDecorationBorder,
                            contentPadding: widget.padding,
                            isDense: widget.isDense,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (sufixIcon != null)
                    GestureDetector(
                      onTap: () {
                        if (widget.isPassword) {
                          setPasswordVisible();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.71),
                        child: sufixIcon!,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (validatorResult != null)
          Container(
            padding: widget.padding.copyWith(bottom: 0),
            margin: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                if (validatorResult!.validatorStatus != null)
                  validatorResult!.getValidatorIcon(context) ??
                      const SizedBox.shrink(),
                if (validatorResult!.statusText != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      validatorResult!.statusText!,
                      style: widget.errorStyle ??
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
