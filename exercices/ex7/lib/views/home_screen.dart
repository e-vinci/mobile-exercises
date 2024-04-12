import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../view_models/sos_view_model.dart';
import 'update_message_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<String?> getLocation() async {
    Location location = Location();

    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    var permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    final locationData = await location.getLocation();
    return "(${locationData.latitude}, ${locationData.longitude})";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SOS app"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () async {
                      final viewModel =
                      Provider.of<SosViewModel>(context, listen: false);
                      if (viewModel.canSendSms) {
                        var message = viewModel.message;

                        if (message.contains("@loc")) {
                          final location = await getLocation();
                          if (location != null) {
                            message = message.replaceAll("@loc", location);
                          }
                        }

                        await sendSMS(
                          message: message,
                          recipients: viewModel.recipients,
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Error"),
                            content: const Text(
                                "Your platform doesn't allow you to send SMS."),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Dismiss"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("SOS"),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const UpdateMessageDialog(),
                ),
                child: const Text("Change SOS message"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go("/recipients"),
                child: const Text("Manage SOS recipients"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
