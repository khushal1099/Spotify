import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/view/search/searchpage.dart';
import '../../utils/ListUtils.dart';

class SearchAction extends StatefulWidget {
  const SearchAction({super.key});

  @override
  State<SearchAction> createState() => _SearchActionState();
}

class _SearchActionState extends State<SearchAction> {
  RxBool isValue = false.obs;
  RxBool isBack = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> isBack.value ? SearchPage() : Scaffold(
        backgroundColor: Color(0xff121212),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff121212),
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  isBack.value = true;
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    isValue.value = value.isNotEmpty;
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_sharp,
                      size: 30,
                    ),
                    hintText: "What do you want to listen to?",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Obx(
          () {
            if (isValue.value) {
              return ListView.builder(
                itemCount: allSongs.length,
                itemBuilder: (context, index) {
                  var data = allSongs[index];
                  return ListTile(
                    leading: Container(
                      clipBehavior: Clip.antiAlias,
                      height: 53,
                      width: 53,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Image.network(data["image"].toString(),),
                    ),
                    title: Text(
                      data["title"].toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["artist"].toString(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          data["album"].toString(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Play what you love",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Search for artists, songs, podcasts, and more.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
