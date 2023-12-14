import 'package:flutter/material.dart';
import 'package:vkmusic/model/music_model.dart';
import 'package:vkmusic/services/services.dart';
import 'package:vkmusic/utils/common_export.dart';

import 'widget/xwidget.dart';

class SongList extends StatefulWidget {
  const SongList({super.key});

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  TextEditingController searchController = new TextEditingController();
  ApiServices apiservice = ApiServices();
  late Future<List<MusicModel>> futuresongList;

  late Future<bool> futureGet;
  void initState() {
    super.initState();
    futuresongList = apiservice.getSongList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondarycolor.withOpacity(.1),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Container(
                width: 70,
                child: Image.asset(
                  'assets/images/logo-white.png',
                  width: MediaQuery.of(context).size.width / 2.9,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            expandedHeight: 0,
            pinned: true,
            backgroundColor: AppTheme.primarycolor,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.primarycolor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.8),
                          blurRadius: 5.0,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.settings,
                      size: 27,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.primarycolor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.8),
                          blurRadius: 5.0,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.logout_outlined,
                      size: 27,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // SliverPersistentHeader(
          //   pinned: true,
          //   floating: true,
          //   delegate: MyPersistentHeaderDelegate(
          //     minHeight: 100,
          //     maxHeight: 100,
          //     child: Search(
          //       controller: searchController,
          //       onchanged: (value) {
          //         print(value);
          //       },
          //       submit: () {
          //         print(searchController.text);
          //       },
          //     ),
          //   ),
          // ),
          SliverList(
            delegate: SliverChildListDelegate([
              FutureBuilder<List<MusicModel>>(
                future: futuresongList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/2.7),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (snapshot.hasError) {
                    return Padding(
                      padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/2.7),
                      child: Center(child: Text("Failed to load")),
                    );
                  } else if (snapshot.hasData && snapshot.data!=null) {
                    return Column(children: [
                      ...snapshot.data!.map((e) => MusicCard(
                            model: e,
                          ))
                    ]);
                  }
                   return      Padding(
                      padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/2.7),
                      child: Center(child: CircularProgressIndicator()),
                    );
                },
              )
            ]),
          ),
        ],
      ),
    );
  }
}
