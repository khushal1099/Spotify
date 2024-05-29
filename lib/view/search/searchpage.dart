import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/utils/ListUtils.dart';
import 'package:spotify/view/search/search_action_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  RxBool isSearch = false.obs;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: Obx(
        () {
          return isSearch.value ?  SearchAction() :
        NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
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
                      "Search",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    )
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(75),
                  child: Container(
                    height: 55,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: controller,
                        readOnly: true,
                        onTap: () {
                          isSearch.value = true;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search_sharp,
                              size: 30,
                            ),
                            hintText: "What do you want to listen to?",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 23,
                ),
                Text(
                  "Explore your genres",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GifContainer(
                      gifUrl: "assets/gifs/bollywood.webp",
                      parameter: "#bollywood",
                    ),
                    GifContainer(
                      gifUrl: "assets/gifs/indian music.gif",
                      parameter: "#indian music",
                    ),
                    GifContainer(
                      gifUrl: "assets/gifs/soothing.gif",
                      parameter: "#soothing",
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Browse all",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    var data = images[index];
                    var data1 = images1[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 103,
                              width: 169.5,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                    data["image"].toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 103,
                              width: 169.5,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                    data1["image"].toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
        },
      ),
    );
  }
}

class GifContainer extends StatelessWidget {
  final String gifUrl;
  final String parameter;

  const GifContainer(
      {super.key, required this.gifUrl, required this.parameter});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 180,
      width: 110,
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
          top: 150,
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
