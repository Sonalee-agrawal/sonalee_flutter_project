import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelScreen extends StatefulWidget {
  const MethodChannelScreen({super.key});

  @override
  State<MethodChannelScreen> createState() => _MethodChannelScreenState();
}

class _MethodChannelScreenState extends State<MethodChannelScreen> {
  final String methodChannelName = 'com.bajaj.com/method_channel';
  late MethodChannel _methodChannel;
  final String getResultMethodName = 'getResult';
  final String showDialogMethodName = 'showDialog';
  final TextEditingController _dialogTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _methodChannel = MethodChannel(methodChannelName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Method channel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _dialogTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Text',
                  hintText: 'Your Text',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await _methodChannel.invokeMethod(
                      showDialogMethodName, _dialogTextController.text);
                  setState(() {});
                },
                child: const Text('show dialog !')),
            const SizedBox(
              height: 30,
            ),
            
             
          ],
        ),
      ),
    );
  }
}
