import 'dart:convert';

import 'package:ex6/models/photo.dart';
import 'package:ex6/view_models/photo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({Key? key}) : super(key: key);

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _urlController = TextEditingController();
  final _thumbnailUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a photo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter photo title',
                ),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter photo title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _urlController,
                decoration: const InputDecoration(
                  hintText: 'Enter photo URL',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter photo URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _thumbnailUrlController,
                decoration: const InputDecoration(
                  hintText: 'Enter thumbnail URL',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter thumbnail URL';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final photo = Photo(
                        title: _titleController.text,
                        url: _urlController.text,
                        thumbnailUrl: _thumbnailUrlController.text,
                      );
                      try {
                        await Provider.of<PhotoViewModel>(context,
                                listen: false)
                            .addPhoto(photo);

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Photo created successfully')));

                        context.go('/');
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Failed to create photo')),
                        );
                      }
                    }
                  },
                  child: Text('Create Photo'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
