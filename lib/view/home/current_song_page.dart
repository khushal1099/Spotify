import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:spotify/utils/AssetsUtils.dart';

import '../../controller/scroll_controller.dart';

class CurrentSong extends StatefulWidget {
  const CurrentSong({super.key});

  @override
  State<CurrentSong> createState() => _CurrentSongState();
}

class _CurrentSongState extends State<CurrentSong> {
  final controller = Get.put(SController());
  ScrollController scrollController = ScrollController();

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
              Container(
                height: height,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://pagalfree.com/images/128Arjan%20Vailly%20-%20Animal%20128%20Kbps.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 53,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "PLAYING FROM PLAYLIST",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "Trending Valentine\'s Hits",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // color: Color(0xff6C1C25),
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Image.network(
                                  "https://pagalfree.com/images/128Lutt%20Putt%20Gaya%20-%20Dunki%20128%20Kbps.jpg",
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
                              Container(
                                width: 160,
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      child: Marquee(
                                        text: " Lutt Putt Gaya",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Rochak Kohli",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.surround_sound,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add_circle_outline_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.play_arrow_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Slider(
                        value: 0.8,
                        activeColor: Colors.white,
                        inactiveColor: Colors.white12,
                        onChanged: (value) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Text(
                              "2:55",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "3:21",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.queue_music,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_previous_rounded,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                  size: 45,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_next_rounded,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.repeat,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.speaker_group,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
          Obx(
            () => AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: controller.isScroll.value ? 1 : 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff6C1C25),
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 17),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 190,
                              height: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    child: Marquee(
                                      text: " Lutt Putt Gaya",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Text(
                                    "Rochak Kohli",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.surround_sound,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_circle_outline_sharp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_arrow_sharp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      LinearProgressIndicator(
                        value: 0.9,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        backgroundColor: Colors.white30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
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
