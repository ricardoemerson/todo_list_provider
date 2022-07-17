import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final IconButton? suffixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> showObscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;

  InputText({
    Key? key,
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.focusNode,
  })  : assert(
          obscureText == true ? suffixIconButton == null : true,
          'obscureText não pode ser enviado em conjunto com suffixIconButton.',
        ),
        showObscureText = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: showObscureText,
        builder: (_, showObscureTextValue, __) {
          return TextFormField(
            controller: controller,
            validator: validator,
            focusNode: focusNode,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red),
              ),
              suffixIcon: obscureText
                  ? IconButton(
                      onPressed: () {
                        showObscureText.value = !showObscureTextValue;
                      },
                      icon: Icon(
                          showObscureTextValue ? Icons.visibility : Icons.visibility_off),
                    )
                  : suffixIconButton,
            ),
            obscureText: showObscureTextValue,
          );
        });
  }
}
