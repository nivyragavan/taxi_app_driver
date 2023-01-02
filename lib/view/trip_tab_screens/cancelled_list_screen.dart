import 'package:flutter/material.dart';

class CancelledListScreen extends StatefulWidget {
  const CancelledListScreen({Key? key}) : super(key: key);

  @override
  State<CancelledListScreen> createState() => _CancelledListScreenState();
}

class _CancelledListScreenState extends State<CancelledListScreen> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: isLoading == false
              ? Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/nofilefound.jpg',
                  ),
                )
              : Column(
                  children: [
                    const Text(
                      'February 2022',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Text('Item ${index + 1}');
                          }),
                    ),
                  ],
                )),
    );
  }
}
