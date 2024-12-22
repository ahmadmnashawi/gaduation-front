import 'package:flutter/material.dart';

class TextFieldGPWidget extends StatefulWidget {
  TextFieldGPWidget(
      {Key? key,
      required this.type,
      this.label,
      this.hint,
      this.prefIcon,
      this.onChanged,
      this.dufaltText,
      this.suffixIcon,
      required this.obscureText,
      this.validator})
      : super(key: key);

  final TextInputType type;
  final String? label;
  final String? dufaltText;
  final String? hint;
  final IconData? prefIcon;
  final IconButton? suffixIcon;
  final Function(String)? onChanged;
  bool obscureText = false;
  final String? Function(String?)? validator;

  @override
  _TextFieldGPWidgetState createState() => _TextFieldGPWidgetState();
}

class _TextFieldGPWidgetState extends State<TextFieldGPWidget> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if ((widget.dufaltText?.isNotEmpty ?? false) ||
          (widget.dufaltText?.isNotEmpty ?? false)) {
        _controller.value = TextEditingValue(
          text: widget.dufaltText ?? '',

          ///prevent revesed text :!
          selection: TextSelection.collapsed(
            offset: widget.dufaltText?.length ?? 0,
          ),
        );
      }
    });
    return TextFormField(
      validator: widget.validator,
      maxLines: 1,
      obscureText: widget.obscureText,
      controller: _controller,
      onChanged: widget.onChanged,
      keyboardType: widget.type,
      cursorColor: const Color.fromARGB(255, 42, 42, 114),
      cursorHeight: 20,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.grey[350]),
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: Icon(
          widget.prefIcon,
          color: const Color.fromARGB(255, 42, 42, 114),
        ),
        suffixIcon: widget.suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        border: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 42, 42, 114), width: 1.5),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 42, 42, 114), width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 42, 42, 114), width: 1.5),
        ),
      ),
    );
  }
}
