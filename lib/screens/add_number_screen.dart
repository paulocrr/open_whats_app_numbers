import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';
import 'package:open_whats_app_numbers/local_models/whats_app_number.dart';
import 'package:open_whats_app_numbers/providers/home_screen_controller.dart';
import 'package:open_whats_app_numbers/screens/whats_app_web_browser_screen.dart';

class AddNumberScreen extends ConsumerStatefulWidget {
  const AddNumberScreen({super.key});

  @override
  ConsumerState<AddNumberScreen> createState() => _AddNumberScreenState();
}

class _AddNumberScreenState extends ConsumerState<AddNumberScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Number'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              controller: _descriptionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Number',
              ),
              controller: _numberController,
              validator: ValidationBuilder().phone().maxLength(15).build(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WhatsAppWebBrowserScreen(
                        number: _numberController.text,
                      ),
                    ),
                  );
                }
              },
              child: const Text('Open WhatsApp'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final whatsAppNumber = WhatsAppNumber(
                    number: _numberController.text,
                    description: _descriptionController.text,
                  );
                  ref
                      .read(homeScreenControllerProvider.notifier)
                      .addNumber(whatsAppNumber);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WhatsAppWebBrowserScreen(
                        number: _numberController.text,
                      ),
                    ),
                  );
                }
              },
              child: const Text('Open and Save'),
            ),
          ],
        ),
      ),
    );
  }
}
