import 'package:flutter/material.dart';

class SearchTextFeild extends StatefulWidget {
  final String? value;
  final String? label;
  final String? hintText;
  final Function(String)? onChange;
  const SearchTextFeild(
      {required this.value,
      this.hintText,
      this.label,
      this.onChange,
      super.key});

  @override
  State<SearchTextFeild> createState() => _SearchTextFeildState();
}

class _SearchTextFeildState extends State<SearchTextFeild> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _controller,
        onChanged: widget.onChange,
        decoration: InputDecoration(
            labelText: widget.label!,
            labelStyle: const TextStyle(
                color: Color.fromARGB(255, 184, 183, 183),
                fontWeight: FontWeight.bold),
            hintText: widget.hintText!,
            prefixIcon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 196, 195, 195),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 3, color: Color.fromARGB(255, 245, 146, 149)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 3, color: Color.fromARGB(255, 245, 146, 149)),
              borderRadius: BorderRadius.circular(15),
            )));
  }
}
