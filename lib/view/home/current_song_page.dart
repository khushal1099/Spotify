import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:spotify/controller/HomeController.dart';
import 'package:spotify/utils/AssetsUtils.dart';
import 'package:spotify/utils/AudioPlayerServiceUtil.dart';
import '../../controller/scroll_controller.dart';

class CurrentSong extends StatefulWidget {
  const CurrentSong({super.key});

  @override
  State<CurrentSong> createState() => _CurrentSongState();
}

class _CurrentSongState extends State<CurrentSong> {
  final controller = Get.put(SController());
  final homeController = Get.put(HomeController());
  ScrollController scrollController = ScrollController();
  AssetsAudioPlayer assetsAudioPlayer = AudioPlayerService.instance;

  double height = 0;

  @override
  void initState() {
    super.initState();
    height = MediaQuery.of(Get.context!).size.height;
    scrollController.addListener(
      () {
        controller.isScroll.value = scrollController.offset >= height;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            padding: EdgeInsets.zero,
            children: [
              StreamBuilder<Playing?>(
                stream: assetsAudioPlayer.current,
                builder: (context, snapshot) {
                  var current = snapshot.data?.audio;
                  return Container(
                    height: height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          current?.audio.metas.image?.path ?? "",
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          StreamBuilder<Playing?>(
                            stream: assetsAudioPlayer.current,
                            builder: (context, snapshot) {
                              var current = snapshot.data?.audio;
                              return SizedBox(
                                height: 60,
                                child: Card(
                                  color: Colors.black38,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      children: [
                                        Container(
                                          clipBehavior: Clip.antiAlias,
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.network(
                                            current?.audio.metas.image?.path ??
                                                "",
                                            frameBuilder: (context, child,
                                                frame, wasSynchronouslyLoaded) {
                                              if (frame == null) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.grey,
                                                  ),
                                                );
                                              }
                                              return child;
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 160,
                                            height: 50,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                  child: Marquee(
                                                    text:
                                                        " ${current?.audio.metas.title}"
                                                            .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Text(
                                                  current?.audio.metas.artist ??
                                                      "",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 230,
                              height: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    child: Marquee(
                                      text:
                                          " ${current?.audio.metas.title ?? ""}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    current?.audio.metas.artist ?? "",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          StreamBuilder<Duration>(
                            stream: assetsAudioPlayer.currentPosition,
                            builder: (context, snapshot) {
                              var second = snapshot.data?.inSeconds ?? 0;
                              var min = snapshot.data?.inMinutes ?? 0;
                              return StreamBuilder<Playing?>(
                                stream: assetsAudioPlayer.current,
                                builder: (context, snapshot1) {
                                  var duration = snapshot1.data?.audio.duration;
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: Slider(
                                          value: second.toDouble(),
                                          max: (duration?.inSeconds ?? 0)
                                              .toDouble(),
                                          activeColor: Colors.white,
                                          inactiveColor: Colors.white12,
                                          onChanged: (value) {
                                            assetsAudioPlayer.seek(
                                              Duration(
                                                seconds: value.toInt(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "${min % 60}:${second % 60}",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  assetsAudioPlayer.previous();
                                },
                                icon: Icon(
                                  Icons.skip_previous_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              StreamBuilder<bool>(
                                  stream: assetsAudioPlayer.isPlaying,
                                  builder: (context, snapshot) {
                                    var playing = snapshot.data ?? false;
                                    return StreamBuilder<bool>(
                                        stream: assetsAudioPlayer.isBuffering,
                                        builder: (context, snapshot) {
                                          return Container(
                                            height: 75,
                                            width: 75,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child: snapshot.data ?? false
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator())
                                                : IconButton(
                                                    onPressed: () {
                                                      playing
                                                          ? assetsAudioPlayer
                                                              .pause()
                                                          : assetsAudioPlayer
                                                              .play();
                                                    },
                                                    icon: Center(
                                                      child: Icon(
                                                        playing
                                                            ? Icons.pause
                                                            : Icons.play_arrow,
                                                        color: Colors.black,
                                                        size: 45,
                                                      ),
                                                    ),
                                                  ),
                                          );
                                        });
                                  }),
                              IconButton(
                                onPressed: () {
                                  assetsAudioPlayer.next();
                                },
                                icon: Icon(
                                  Icons.skip_next_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  assetsAudioPlayer.seek(Duration.zero,
                                      force: true);
                                  assetsAudioPlayer.play();
                                },
                                icon: Icon(
                                  Icons.repeat,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff242424),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 250,
                                width: double.infinity,
                                child: Image.asset(
                                  AssetsUtils.rk,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 20,
                                left: 20,
                                child: Text(
                                  "About the artist",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      "Rochak Kohli",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 25),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      "12.6M monthly listeners",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff242424),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Text(
                              "Explore Rochak Kohli",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GifC(
                                gifUrl: "assets/gifs/bollywood.webp",
                                parameter: "Songs by\nRochak\nKohli",
                              ),
                              GifC(
                                gifUrl: "assets/gifs/indian music.gif",
                                parameter: "Similar to\nRochak\nkohli",
                              ),
                              GifC(
                                gifUrl: "assets/gifs/soothing.gif",
                                parameter: "Similar to\nTu Hi Yaar\nMera",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff242424),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Credits",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Show all",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            RowForContainer(
                              title: "Rochak Kohli",
                              subtitle: "Main Artist",
                              buttontitle: "Follow",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RowForContainer(
                              title: "Arijit Singh",
                              subtitle: "Main Artist",
                              buttontitle: "Following",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RowForContainer(
                              title: "Neha Kakkar",
                              subtitle: "Main Artist",
                              buttontitle: "Follow",
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Obx(() {
            return AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: controller.isScroll.value ? 1 : 0,
              child: StreamBuilder<Playing?>(
                stream: assetsAudioPlayer.current,
                builder: (context, snapshot) {
                  var current = snapshot.data?.audio;
                  return SizedBox(
                    height: 100,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xff6C1C25),
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SafeArea(
                          child: Row(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Image.network(
                                  current?.audio.metas.image?.path ?? "",
                                  frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) {
                                    if (frame == null) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.grey,
                                        ),
                                      );
                                    }
                                    return child;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  // width: 160,
                                  height: 50,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        child: Marquee(
                                          text: " ${current?.audio.metas.title}"
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Text(
                                        current?.audio.metas.artist ?? "",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  assetsAudioPlayer.previous();
                                },
                                icon: Icon(
                                  Icons.skip_previous_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              StreamBuilder<bool>(
                                stream: assetsAudioPlayer.isPlaying,
                                builder: (context, snapshot) {
                                  var playing = snapshot.data ?? false;
                                  return StreamBuilder<bool>(
                                    stream: assetsAudioPlayer.isBuffering,
                                    builder: (context, snapshot1) {
                                      if (snapshot1.data ?? false) {
                                        return SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return IconButton(
                                        onPressed: () {
                                          playing
                                              ? assetsAudioPlayer.pause()
                                              : assetsAudioPlayer.play();
                                        },
                                        icon: Icon(
                                          playing
                                              ? Icons.pause
                                              : Icons.play_arrow_sharp,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                onPressed: () {
                                  assetsAudioPlayer.next();
                                },
                                icon: Icon(
                                  Icons.skip_next_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}

class GifC extends StatelessWidget {
  final String gifUrl;
  final String parameter;

  const GifC({super.key, required this.gifUrl, required this.parameter});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 170,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            gifUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 90,
        ),
        child: Center(
          child: Text(
            parameter,
            style: TextStyle(
                fontWeight: FontWeight.w800, color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

class RowForContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttontitle;

  const RowForContainer(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.buttontitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Center(
            child: Text(
              buttontitle,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
