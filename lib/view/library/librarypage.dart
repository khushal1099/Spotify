import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/utils/SingerLists.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  RxBool isView = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(115),
        child: AppBar(
          backgroundColor: Color(0xff121212),
          title: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    "C",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Your Library",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "Podcasts",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "Artists",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 26,
            width: double.infinity,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.import_export,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "Recents",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    isView.value = !isView.value;
                  },
                  icon: Obx(
                    () => Icon(
                      isView.value
                          ? Icons.format_list_bulleted
                          : Icons.grid_view,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => isView.value
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: singer.length,
                      itemBuilder: (context, index) {
                        var data = singer[index];
                        if (index == 0) {
                          return Container(
                            height: 200,
                            width: 150,
                            child: ContainerForPodcasts(
                              imageUrl: data["image"].toString(),
                              name: data["name"].toString(),
                              podcastsname: data["podcasts_name"].toString(),
                              skill: data["skill"].toString(),
                              isView: true,
                            ),
                          );
                        }
                        if (data["index"] == "1") {
                          return Container(
                            height: 200,
                            width: 150,
                            child: ContainerForSinger(
                              parameter: "Add Artist",
                              isView: true,
                            ),
                          );
                        }
                        if (data["index"] == "2") {
                          return Container(
                            height: 200,
                            width: 150,
                            child: ContainerForSinger(
                              parameter: "Add Podcast",
                              isView: true,
                              isShape: true,
                            ),
                          );
                        }
                        return ArtistView(
                          imageUrl: data["image"].toString(),
                          name: data["name"].toString(),
                          skill: data["skill"].toString(),
                          isView: true,
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: singer.length,
                      itemBuilder: (context, index) {
                        var data = singer[index];
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: ContainerForPodcasts(
                              imageUrl: data["image"].toString(),
                              name: data["name"].toString(),
                              podcastsname: data["podcasts_name"].toString(),
                              skill: data["skill"].toString(),
                            ),
                          );
                        }
                        if (data["index"] == "1") {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: ContainerForSinger(
                              parameter: "Add Artist",
                            ),
                          );
                        }
                        if (data["index"] == "2") {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: ContainerForSinger(
                              parameter: "Add Podcasts",
                              isShape: true,
                            ),
                          );
                        }
                        return ArtistView(
                          imageUrl: data["image"].toString(),
                          name: data["name"].toString(),
                          skill: data["skill"].toString(),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class ArtistView extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String skill;
  final bool isView;

  const ArtistView({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.skill,
    this.isView = false,
  });

  @override
  Widget build(BuildContext context) {
    return isView
        ? Container(
            height: 200,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  skill,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        skill,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

class ContainerForPodcasts extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String podcastsname;
  final String skill;
  final bool isView;

  const ContainerForPodcasts(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.podcastsname,
      required this.skill,
      this.isView = false});

  @override
  Widget build(BuildContext context) {
    return isView
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                podcastsname,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "${skill} - ${name}",
                style: TextStyle(
                  color: Colors.grey,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        : Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      podcastsname,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${skill} - ${name}",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

class ContainerForSinger extends StatelessWidget {
  final bool isShape;
  final bool isView;
  final String parameter;

  const ContainerForSinger(
      {super.key,
      this.isShape = false,
      this.isView = false,
      required this.parameter});

  @override
  Widget build(BuildContext context) {
    return isView
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: isShape
                      ? BorderRadius.circular(5)
                      : BorderRadius.circular(40),
                  color: Colors.white12,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  parameter,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        : Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: isShape
                      ? BorderRadius.circular(5)
                      : BorderRadius.circular(40),
                  color: Colors.white12,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  parameter,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          );
  }
}
