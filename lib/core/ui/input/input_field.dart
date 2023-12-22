import 'package:flutter/services.dart';
import 'package:tectone23_test/core/index.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.controller,
    required this.label,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.autofillHints,
    this.validator,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.autofocus = false,
    this.maxLines = 1,
    super.key,
  });

  const InputField.name({
    required TextEditingController controller,
    required String label,
    TextInputAction textInputAction = TextInputAction.next,
    bool autofocus = false,
    Key? key,
  }) : this(
    key: key,
    controller: controller,
    label: label,
    textInputAction: textInputAction,
    keyboardType: TextInputType.name,
    autofillHints: const [AutofillHints.name],
    validator: Validators.required,
    autofocus: autofocus,
  );

  const InputField.email({
    required TextEditingController controller,
    required String label,
    TextInputAction textInputAction = TextInputAction.next,
    bool autofocus = false,
    ValueChanged<String>? onFieldSubmitted,
    Key? key,
  }) : this(
    key: key,
    controller: controller,
    label: label,
    textInputAction: textInputAction,
    keyboardType: TextInputType.emailAddress,
    autofillHints: const [AutofillHints.email],
    validator: Validators.email,
    autofocus: autofocus,
    onFieldSubmitted: onFieldSubmitted,
  );

  const InputField.password({
    required TextEditingController controller,
    required String label,
    TextInputAction textInputAction = TextInputAction.next,
    ValueChanged<String>? onFieldSubmitted,
    bool autofocus = false,
    Key? key,
  }) : this(
    key: key,
    controller: controller,
    label: label,
    textInputAction: textInputAction,
    keyboardType: TextInputType.visiblePassword,
    autofillHints: const [AutofillHints.password],
    validator: Validators.password,
    onFieldSubmitted: onFieldSubmitted,
    autofocus: autofocus,
  );


  const InputField.address({
    required TextEditingController controller,
    required String label,
    TextInputAction textInputAction = TextInputAction.next,
    bool autofocus = false,
    Key? key,
  }) : this(
          key: key,
          controller: controller,
          label: label,
          textInputAction: textInputAction,
          keyboardType: TextInputType.name,
          autofillHints: const [AutofillHints.name],
          validator: Validators.required,
          autofocus: autofocus,
        );

  InputField.amount({
    required TextEditingController controller,
    required String label,
    TextInputAction textInputAction = TextInputAction.next,
    bool autofocus = false,
    Key? key,
  }) : this(
          key: key,
          controller: controller,
          label: label,
          textInputAction: textInputAction,
          keyboardType: const TextInputType.numberWithOptions(
            signed: true,
            decimal: true,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^-?\d*.?\d*')),
          ],
          autofillHints: const [AutofillHints.transactionAmount],
          validator: Validators.positiveInteger,
          autofocus: autofocus,
        );

  const InputField.multiline({
    required TextEditingController controller,
    required String label,
    bool autofocus = false,
    Key? key,
  }) : this(
          key: key,
          controller: controller,
          label: label,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.multiline,
          validator: Validators.required,
          autofocus: autofocus,
          maxLines: 5,
        );

  final TextEditingController controller;
  final String label;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final List<String>? autofillHints;
  final LocalizedValidator? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool autofocus;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool _obscureText;
  late bool _isPassword;

  @override
  void initState() {
    _isPassword = widget.keyboardType == TextInputType.visiblePassword;
    _obscureText = _isPassword;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant InputField oldWidget) {
    if (oldWidget.keyboardType != widget.keyboardType) {
      _isPassword = widget.keyboardType == TextInputType.visiblePassword;
      _obscureText = _isPassword;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final validator = widget.validator ??
        Validators.getValidator(context, widget.keyboardType);

    return Padding(
        padding: const EdgeInsets.all(15),
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: _obscureText,
          validator:
              validator == null ? null : (input) => validator(context, input),
          autofillHints: widget.autofillHints,
          onFieldSubmitted: widget.onFieldSubmitted,
          inputFormatters: widget.inputFormatters ?? [],
          autofocus: widget.autofocus,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            labelText: widget.label,
            suffixIcon: _isPassword
                ? IconButton(
                    onPressed: () =>
                        setState(() => _obscureText = !_obscureText),
                    icon: _obscureText
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility_sharp),
                  )
                : null,
          ),
        ));
  }
}
