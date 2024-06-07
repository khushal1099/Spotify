import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:spotify/controller/HomeController.dart';
import 'package:spotify/view/home/current_song_page.dart';
import 'package:spotify/view/home/homepage.dart';
import 'package:spotify/view/library/librarypage.dart';
import 'package:spotify/view/premium/premiumpage.dart';
import 'package:spotify/view/search/searchpage.dart';
import '../../utils/AudioPlayerServiceUtil.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  RxInt cIndex = 0.obs;
  HomeController homeController = Get.put(HomeController());
  AssetsAudioPlayer assetsAudioPlayer = AudioPlayerService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: cIndex.value,
                children: [
                  HomePage(),
                  SearchPage(),
                  LibraryPage(),
                  PremiumPage()
                ],
              ),
            ),
            StreamBuilder<Playing?>(
              stream: assetsAudioPlayer.current,
              builder: (context, snapshot) {
                var current = snapshot.data?.audio;
                if (current != null)
                  return SizedBox(
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            () => CurrentSong(),
                            transition: Transition.downToUp,
                            duration: Duration(milliseconds: 300),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xff6C1C25),
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
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
                                    current.audio.metas.image?.path ?? "",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          child: Marquee(
                                            text:
                                                " ${current.audio.metas.title ?? ""}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Text(
                                          current.audio.metas.artist ?? "",
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
                    ),
                  );
                return SizedBox();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          height: 57,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black12, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    cIndex.value = 0;
                  },
                  child: BottomIcon(
                    iconData: cIndex.value == 0
                        ? Icons.home_filled
                        : Icons.home_outlined,
                    label: 'Home',
                    colorss: cIndex.value == 0 ? Colors.white : Colors.white24,
                    Iconcolor:
                        cIndex.value == 0 ? Colors.white : Colors.white24,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    cIndex.value = 1;
                  },
                  child: BottomIcon(
                    iconData:
                        cIndex.value == 1 ? Icons.search_sharp : Icons.search,
                    label: 'Search',
                    colorss: cIndex.value == 1 ? Colors.white : Colors.white24,
                    Iconcolor:
                        cIndex.value == 1 ? Colors.white : Colors.white24,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    cIndex.value = 2;
                  },
                  child: BottomIcon(
                    iconData: cIndex.value == 2
                        ? Icons.library_music
                        : Icons.library_music_outlined,
                    label: 'Library',
                    colorss: cIndex.value == 2 ? Colors.white : Colors.white24,
                    Iconcolor:
                        cIndex.value == 2 ? Colors.white : Colors.white24,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    cIndex.value = 3;
                  },
                  child: BottomIcon(
                    iconData: cIndex.value == 3
                        ? Icons.workspace_premium
                        : Icons.workspace_premium_outlined,
                    label: 'Premium',
                    colorss: cIndex.value == 3 ? Colors.white : Colors.white24,
                    Iconcolor:
                        cIndex.value == 3 ? Colors.white : Colors.white24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomIcon extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Color colorss;
  final Color Iconcolor;

  const BottomIcon(
      {super.key,
      required this.iconData,
      required this.label,
      required this.colorss,
      required this.Iconcolor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: Iconcolor,
        ),
        Text(
          label,
          style: TextStyle(
            color: colorss,
          ),
        ),
      ],
    );
  }
}
