import 'package:flutter/material.dart';

import 'dart:math';

class SilverLandingPage extends StatelessWidget {
  const SilverLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text("Welcome to Sliver"),
              background: Container(
                height: 200,
                color: Colors.green[900],
              )),
          pinned: true,
        ),
        SliverList.list(children: const [
          ListTile(
            title: Text("Welcome to Landing page"),
          ),
        ]),
        SliverList.separated(
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("item ${index + 1}"),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(thickness:6
              );
            }),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemCount: 56,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
                color:Color.fromARGB(255,  Random().nextInt(255),  Random().nextInt(255),  Random().nextInt(255)));
          },
        ),
      ]),
    );
  }
}
