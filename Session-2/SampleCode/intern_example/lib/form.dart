import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null; // Return null if the input is valid
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.length < 7) {
                    return 'Password must be at least 7 characters long';
                  }
                  return null; // Return null if the input is valid
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate the form
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, perform your action
                    // e.g., submit the data
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Form is valid. Submitting...'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
