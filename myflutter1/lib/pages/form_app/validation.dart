import 'package:flutter/material.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({Key? key}) : super(key: key);

  @override
  _FormValidationState createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final _formKey = GlobalKey<FormState>();
  String? adjective;
  bool? agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Generator'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              child: const Text('Submit'),
              onPressed: () {
                var valid = _formKey.currentState!.validate();
                if (!valid) {
                  return;
                }
                showDialog<void>(
                  context: context,
                  builder: (builder) => AlertDialog(
                    title: const Text('Your story'),
                    content: Text('xx'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Done')),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            TextFormField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
                //'Not a valid adjective';
              },
              decoration: const InputDecoration(
                  filled: true,
                  hintText: 'xx',
                  labelText: 'Enter an adjective'),
              onChanged: (value) {
                adjective = value;
              },
            ),
            const SizedBox(height: 24),
            // A custom form field that requires the user to check a
            // checkbox.
            FormField(
                initialValue: false,
                validator: (value) {
                  if (value == false) {
                    return 'You must agree to the terms of service.';
                  }
                  return null;
                },
                builder: (formFieldState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: agreedToTerms,
                              onChanged: (value) {
                                formFieldState.didChange(value);
                                setState(() {
                                  agreedToTerms = value;
                                });
                              }),
                          Text(
                            'I agree to the terms of service',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      if (!formFieldState.isValid)
                        Text(
                          formFieldState.errorText ?? "",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                        )
                    ],
                  );
                })
          ]),
        )),
      ),
    );
  }
}
