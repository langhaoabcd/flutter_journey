import 'package:flutter/material.dart';

class FormWidgets extends StatefulWidget {
  const FormWidgets({Key? key}) : super(key: key);

  @override
  _FormWidgetsState createState() => _FormWidgetsState();
}

class _FormWidgetsState extends State<FormWidgets> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool? brushedTeeth = false;
  bool enableFeature = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Widgets'),
      ),
      body: Form(
          key: _formKey,
          child: Scrollbar(
            child: Align(
              alignment: Alignment.topCenter,
              child: Card(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(children: [
                      ...[
                        TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: 'Enter a title...',
                            labelText: 'Title',
                          ),
                          onChanged: (value) {
                            setState(() {
                              title = value;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: 'Enter a description...',
                            labelText: 'Description',
                          ),
                          onChanged: (value) {
                            description = value;
                          },
                          maxLines: 5,
                        ),
                        _FormDatePicker(
                          date:date,
                          onChange: (value){
                            setState(() {
                              date = value;
                            });
                          },
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Estimated value',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                )
                              ],
                            ),
                            Text(maxValue.toString()),
                            Slider(
                                value: maxValue,
                                onChanged: (value) {
                                  setState(() {
                                    maxValue = value;
                                  });
                                }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: brushedTeeth,
                                onChanged: (checked) {
                                  setState(() {
                                    brushedTeeth = checked;
                                  });
                                }),
                            Text(
                              'Brushed teeth',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Enable feature',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Switch(
                                value: enableFeature,
                                onChanged: (enable) {
                                  setState(() {
                                    enableFeature = enable;
                                  });
                                })
                          ],
                        )
                      ].expand(
                        (widget) => [
                          widget,
                          const SizedBox(
                            height: 24,
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChange;
  const _FormDatePicker({required this.date, required this.onChange});

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              widget.date.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        TextButton(onPressed: () async {
          var newDate = await showDatePicker(
            context: context,
            initialDate: widget.date,
            firstDate: DateTime(1900),
            lastDate: DateTime(2100));
            if(newDate == null){
              return;
            }
            widget.onChange(newDate);
        }, child: const Text('Edit'))
      ],
    );
  }
}
