import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscured,
        // focusNode: textFieldFocusNode,
        decoration: InputDecoration(
          // floatingLabelBehavior:
          //     FloatingLabelBehavior.never, //Hides label on focus or if filled
          labelText: "Password",
          // filled: true, // Needed for adding a fill color
          // fillColor: Colors.grey.shade800,
          // isDense: true, // Reduces height a bit
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.amber), // No border
            borderRadius:
                BorderRadius.all(Radius.circular(10.0)), // Apply corner radius
          ),
          hintText: 'Enter Your password',
          prefixIcon: const Icon(Icons.lock_rounded, size: 24),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: GestureDetector(
              onTap: _toggleObscured,
              child: Icon(
                _obscured
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                // ? Icons.visibility_rounded
                // : Icons.visibility_off_rounded,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
