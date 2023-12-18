import 'package:flutter/material.dart';
import 'package:vkmusic/model/music_model.dart';
import 'package:vkmusic/screens/song_details/song_details.dart';
import 'package:vkmusic/utils/common_export.dart';

class MusicCard extends StatefulWidget {
  final MusicModel model;
  const MusicCard({super.key, required this.model});

  @override
  State<MusicCard> createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5,left:5),
      child: InkWell(
        onTap: (){
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SongsDetails(
                      model:widget.model
                    ),
                  ));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                    widget.model.artworkUrl30??  "https://cdn.wallpapersafari.com/37/94/3SZATC.jpg"),
                  backgroundColor: Colors.transparent,
                ),
           
         
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Text(
                        widget.model.trackName??"No track name",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.white),
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
                            Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width / 1.9,
                          child: Text(
                               (widget.model.collectionName??"").replaceAll("+", " "),//+","+ (widget.model.artistName??"" ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: AppTheme.white),
                          ),
                        ),     
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
