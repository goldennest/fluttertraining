import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:vkmusic/model/music_model.dart';

import '../../utils/common_export.dart';

class SongsDetails extends StatefulWidget {
  final MusicModel model;
  const SongsDetails({
    super.key,
    required this.model,
  });

  @override
  State<SongsDetails> createState() => _SongsDetailsState();
}

class _SongsDetailsState extends State<SongsDetails> {
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.secondarycolor.withOpacity(.1),
        appBar: null,
        
        body: Stack(
          children: [
            Container(
             
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height ,
              child: SingleChildScrollView(

                child: Column(
                  children: [
                       SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                    
                          ),
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(widget.model.artworkUrl100!,
                            fit: BoxFit.fill,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _details("Song Description",widget.model.shortDescription??""),
                    _details("Album",widget.model.collectionName??""),
                    _details("Artist",widget.model.artistName??""),
                    _details("Release Date",widget.model.releaseDateStr??""),
                    _details("long Description",widget.model.longDescription??""),
                    _details("Duration (Seconds)",("${widget.model.trackDurationInSecond}" )),
                      SizedBox(
                      height: 150,
                    ),
    
    
                  ],
                ),
              ),
            ),
          Positioned(
            bottom: 20, left:0,right: 0,
            child: Container(
              child: _playerControll(),
            ))
          
          ],
        ),
      ),
    );
  }
  _playerControll(){
    return Column( children: [
          _info(),

      Padding(
        padding: const EdgeInsets.only(left: 12,right: 12),
        child: ProgressBar(
        progress: Duration(seconds: 50),
        buffered: Duration(seconds: 60),
        total: Duration(seconds: 200),
        progressBarColor: Colors.red,
        baseBarColor: Colors.white.withOpacity(0.24),
        bufferedBarColor: Colors.white.withOpacity(0.24),
        thumbColor: Colors.white,
        barHeight: 3.0,
        thumbRadius: 5.0,
        timeLabelTextStyle: TextStyle(color: AppTheme.white,fontSize: 12),
        onSeek: (duration) {
        },
      ),
      ),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.shuffle,color: AppTheme.white,size: 20,),
    Icon(Icons.skip_previous,color: AppTheme.white,size: 30,),

    Icon(Icons.play_arrow,color: AppTheme.white,size: 40,),
    Icon(Icons.skip_next,color: AppTheme.white,size: 30,),
    Icon(Icons.repeat,color: AppTheme.white,size: 20,),

  ],
)

    ],);
  }
  _info(){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
         Container(
                width: MediaQuery.of(context).size.width*.8,
                height: 30,
                 child: Marquee(
                 text: widget.model.trackName??"No Track Name",
                 style: TextStyle(fontWeight: FontWeight.bold,color: AppTheme.white,fontSize: 20),
                 scrollAxis: Axis.horizontal,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 blankSpace: 20.0,
                 velocity: 70.0,
                 pauseAfterRound: Duration(seconds: 1),
                 startPadding: 10.0,
                 accelerationDuration: Duration(seconds: 1),
                 accelerationCurve: Curves.linear,
                 decelerationDuration: Duration(milliseconds: 500),
                 decelerationCurve: Curves.easeOut,
               ),
               ),
      
               Icon(Icons.favorite_border_outlined,color:AppTheme.white)
          ],
        ),
      ),
    );
  }
  _details(String name,String details){
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width/2,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(name,style: TextStyle(
                color: AppTheme.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
            Container(
            width: MediaQuery.of(context).size.width/2,
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(details,style: TextStyle(
                color: AppTheme.white,
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
