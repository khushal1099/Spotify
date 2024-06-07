import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/utils/ListUtils.dart';
import 'package:spotify/view/search/search_action_page.dart';

import '../../controller/search_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  RxBool isSearch = false.obs;
  TextEditingController searchcontroller = TextEditingController();
  ScrollController sController = ScrollController();
  final controller = Get.put(Searchcontroller());

  @override
  void initState() {
    super.initState();
    sController.addListener(
      () {
        controller.offset.value = sController.offset;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: Obx(
        () => isSearch.value
            ? SearchAction()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SafeArea(
                  child: Column(
                    children: [
                      Obx(() {
                        double height = 60 - controller.offset.value;
                        print('height $height');
                        if (height < 0) {
                          height = 0;
                        }
                        return Column(
                          children: [
                            Container(
                              height: height,
                              child: Row(
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
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 55,
                              width: 370,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: searchcontroller,
                                  readOnly: true,
                                  onTap: () {
                                    isSearch.value = true;
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.search_sharp,
                                        size: 30,
                                      ),
                                      hintText:
                                          "What do you want to listen to?",
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: sController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              GridView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.6,
                                ),
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  var data = images[index];
                                  return Container(
                                    margin: EdgeInsets.all(5),
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
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
