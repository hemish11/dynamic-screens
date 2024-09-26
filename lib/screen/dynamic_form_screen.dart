import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../models/models.dart';

class DynamicFormScreen extends StatefulWidget {
  final FormModel formModel;

  const DynamicFormScreen({super.key, required this.formModel});

  @override
  DynamicFormScreenState createState() => DynamicFormScreenState();
}

class DynamicFormScreenState extends State<DynamicFormScreen> {
  int _currentSectionIndex = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final currentSection = widget.formModel.sections[_currentSectionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentSection.properties.headerTitle),
        leading: _currentSectionIndex > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _currentSectionIndex--;
                    _formKey.currentState!.reset();
                  });
                },
              )
            : null,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (currentSection.properties.headerIconUrl.isNotEmpty)
                Center(
                  child: Image.network(
                    currentSection.properties.headerIconUrl,
                    height: 100,
                  ),
                ),
              const SizedBox(height: 20),
              Text(
                currentSection.properties.headerSubtitle,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ...currentSection.fields.map((field) => Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: buildField(field),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentSectionIndex > 0)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentSectionIndex--;
                          _formKey.currentState!.reset();
                        });
                      },
                      child: const Text('Back'),
                    ),
                  if (_currentSectionIndex <
                      widget.formModel.sections.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          setState(() {
                            _currentSectionIndex++;
                            _formKey.currentState!.reset();
                          });
                        }
                      },
                      child: const Text('Next'),
                    ),
                  if (_currentSectionIndex ==
                      widget.formModel.sections.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Form Completed'),
                              content:
                                  const Text('You have filled all the fields.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text('Finish'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(Field field) {
    Widget fieldWidget;

    switch (field.properties.inputType) {
      case InputType.textName:
      case InputType.address:
      case InputType.locality:
      case InputType.city:
        fieldWidget = TextFormField(
          decoration: InputDecoration(
            labelText: field.properties.title,
            hintText: field.properties.hint ?? field.properties.subtitle,
            border: const OutlineInputBorder(),
          ),
          initialValue: field.value,
          maxLength: field.properties.maxLength,
          enabled: field.properties.isEditable,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return field.properties.errorText ?? 'This field is required';
            }
            if (field.properties.minLength != null &&
                value.length < field.properties.minLength!) {
              return 'Minimum ${field.properties.minLength} characters required';
            }
            if (field.properties.maxLength != null &&
                value.length > field.properties.maxLength!) {
              return 'Maximum ${field.properties.maxLength} characters allowed';
            }
            return null;
          },
          onSaved: (value) {
            field.value = value ?? '';
          },
        );
        break;

      case InputType.date:
        fieldWidget = GestureDetector(
          onTap: field.properties.isEditable
              ? () {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime(1900, 1, 1),
                    maxTime: DateTime.now(),
                    onConfirm: (date) {
                      setState(() {
                        field.value = date.toIso8601String();
                      });
                    },
                    currentTime: DateTime.now(),
                    locale: LocaleType.en,
                  );
                }
              : null,
          child: AbsorbPointer(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: field.properties.title,
                hintText: field.properties.hint,
                border: const OutlineInputBorder(),
              ),
              controller: TextEditingController(
                text: field.value.isNotEmpty ? formatDate(field.value) : '',
              ),
              validator: (value) {
                if (field.value.isEmpty) {
                  return field.properties.errorText ?? 'Please select a date';
                }
                return null;
              },
            ),
          ),
        );
        break;

      case InputType.singleSelection:
        fieldWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              field.properties.title ?? '',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            ...field.properties.selections!.map((selection) {
              return RadioListTile<String>(
                title: Row(
                  children: [
                    if (selection.iconUrl != null)
                      Image.network(
                        selection.iconUrl!,
                        height: 24,
                        width: 24,
                      ),
                    const SizedBox(width: 8),
                    Text(selection.title ?? ''),
                  ],
                ),
                value: selection.name,
                groupValue: field.value,
                onChanged: field.properties.isEditable
                    ? (value) {
                        setState(() {
                          field.value = value!;
                        });
                      }
                    : null,
              );
            }).toList(),
            if (field.value.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  field.properties.errorText ?? 'Please make a selection',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        );
        break;

      case InputType.pincode:
        fieldWidget = TextFormField(
          decoration: InputDecoration(
            labelText: field.properties.title,
            hintText: field.properties.hint ?? field.properties.subtitle,
            border: const OutlineInputBorder(),
          ),
          initialValue: field.value,
          keyboardType: TextInputType.number,
          maxLength: field.properties.maxLength,
          enabled: field.properties.isEditable,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return field.properties.errorText ?? 'This field is required';
            }
            if (!RegExp(r'^\d{6}$').hasMatch(value)) {
              return field.properties.errorText ?? 'Invalid pincode';
            }
            return null;
          },
          onSaved: (value) {
            field.value = value ?? '';
          },
        );
        break;

      default:
        fieldWidget = const SizedBox.shrink();
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fieldWidget,
        if (field.properties.subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              field.properties.subtitle!,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        if (field.version.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Status: ${field.status.toString().split('.').last}, Version: ${field.version}',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
      ],
    );
  }

  String formatDate(String isoDate) {
    DateTime date = DateTime.parse(isoDate);
    return '${date.day}/${date.month}/${date.year}';
  }
}
