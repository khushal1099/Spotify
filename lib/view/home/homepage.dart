import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/controller/HomeController.dart';
import 'package:spotify/utils/ListUtils.dart';
import 'package:spotify/utils/SizeUtils.dart';
import '../../utils/AudioPlayerServiceUtil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  AssetsAudioPlayer assetsAudioPlayer = AudioPlayerService.instance;

  @override
  void initState() {
    SizeUtils.config();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 50,
              floating: false,
              pinned: true,
              backgroundColor: Color(0xff121212),
              title: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "C",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SectionContainer(
                    content: "All",
                    colors: Colors.green,
                    height: 30,
                    width: 40,
                  ),
                  SectionContainer(
                    content: "Music",
                    height: 30,
                    width: 60,
                  ),
                  SectionContainer(
                    content: "Podcasts",
                    height: 30,
                    width: 80,
                  ),
                ],
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: StreamBuilder<Playing?>(
              stream: assetsAudioPlayer.current,
              builder: (context, snapshot) {
                var checkdata = snapshot.data?.playlist.current;
                if (checkdata != null && !recentSongs.contains(checkdata)) {
                  recentSongs.add(checkdata);
                }
                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: 50,
                            width: 152,
                            decoration: BoxDecoration(
                              color: Color(0xff2A2A2A),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                    ),
                                  ),
                                  child: Image.network(
                                    "https://pagalfree.com/images/12810%20Bande%20-%20George%20Sidhu%20128%20Kbps.jpg",
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
                                  width: 8,
                                ),
                                Text(
                                  "Trending \n valentines...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13),
                                ),
                                // Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.more_horiz,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: 50,
                            width: 152,
                            decoration: BoxDecoration(
                              color: Color(0xff2A2A2A),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                    ),
                                  ),
                                  child: Image.network(
                                    "https://pagalfree.com/images/128100%20Phere%20-%20Varinder%20Brar%20128%20Kbps.jpg",
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
                                  width: 8,
                                ),
                                Text(
                                  "Hot Hits Hindi",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (checkdata != null)
                      CategoryListItem(
                          list: recentSongs,
                          title: "Based on your recent listening"),
                    CategoryListItem(
                        list: bollywoodsongs, title: "Bollywood Songs"),
                    SizedBox(height: 20),
                    CategoryListItem(
                        list: panjabisongs, title: "Punjabi Songs"),
                    SizedBox(height: 20),
                    CategoryListItem(list: allsongs, title: "All Songs"),
                    SizedBox(height: 20),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class SectionContainer extends StatelessWidget {
  final String content;
  final Color? colors;
  final double height;
  final double width;

  const SectionContainer(
      {super.key,
      required this.content,
      this.colors,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: colors.isNull ? Color(0xff2A2A2A) : colors,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          content,
          style: TextStyle(
            fontSize: 15,
            color: colors.isNull ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  final List<Audio> list;
  final String title;

  const CategoryListItem({super.key, required this.list, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 23),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              var data = list[index];

              return InkWell(
                onTap: () {
                  var index = 0;
                  try {
                    index = list.indexOf(data);
                  } catch (e) {}
                  AudioPlayerService.instance.open(
                    Playlist(audios: list, startIndex: index),
                    autoStart: true,
                    showNotification: true,
                    notificationSettings: NotificationSettings(
                      customPlayPauseAction: (player) async {
                        if (player.isPlaying.value) {
                          player.pause();
                        } else {
                          player.play();
                        }
                      },
                    ),
                    loopMode: LoopMode.playlist,
                  );
                },
                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        height: 140,
                        width: 140,
                        // color: Colors.grey,
                        child: Image.network(
                          data.metas.image?.path ?? "",
                          fit: BoxFit.cover,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
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
                        height: 8,
                      ),
                      Text(
                        data.metas.artist.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        data.metas.album.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
