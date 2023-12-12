import 'package:flutter/material.dart';

class StatefulLifecycleExample extends StatefulWidget {
  @override
  _StatefulLifecycleExample createState() => _StatefulLifecycleExample();
}

class _StatefulLifecycleExample extends State<StatefulLifecycleExample> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifecycle Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $_counter'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter++;
                  print(_counter);
                });
              },
              child: Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(StatefulLifecycleExample oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget is Updated $_counter');
  }
}

// class StatelessLifecycleExample extends StatelessWidget {
//   StatelessLifecycleExample({Key? key}) : super(key: key) {
//     print('Constructor');
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('build');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stateless Lifecycle Example'),
//       ),
//       body: const Center(
//         child: Text('This is a Stateless Widget'),
//       ),
//     );
//   }
// }
