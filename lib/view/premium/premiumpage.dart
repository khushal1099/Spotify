import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/controller/premium_controller.dart';
import 'package:spotify/utils/AssetsUtils.dart';
import 'package:spotify/view/premium/premium_plans.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  ScrollController controller = ScrollController();
  final pController = Get.put(PremiumController());

  @override
  void initState() {
    super.initState();
    controller.addListener(
      () {
        pController.offset.value = controller.offset;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 370,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff121212),
                  ),
                  alignment: Alignment.center,
                  child: Obx(
                    () {
                      double width = MediaQuery.sizeOf(context).width -
                          pController.offset.value;
                      double height = 370 - pController.offset.value;

                      if (width < MediaQuery.sizeOf(context).width / 2) {
                        width = MediaQuery.sizeOf(context).width / 2;
                      }
                      if (height < 370 / 2) {
                        height = 370 / 2;
                      }
                      print("object${width}");
                      return Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                          color: Color(0xff121212),
                          image: DecorationImage(
                              image: AssetImage(AssetsUtils.bgs),
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 20,
                  child: Text(
                    "Listen without limits.Try\n2 months of Premium for\n\$119.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "Get Premium Individual",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        "\$119 for 2 months, then \$119 per month after. Offer only available if you\nhaven't tried Premium before. ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                  TextSpan(
                    text: "Terms apply.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.grey,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              height: 360,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xff242424),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      left: 15,
                      bottom: 10,
                    ),
                    child: Text(
                      "Why join Premium?",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 10,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.volume_mute,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Ad-free music listening",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 10,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.download_for_offline_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Download to listen offline",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 10,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.queue_music_sharp,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Play songs in any orders",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 10,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.headphones,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "High audio quality",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 10,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.group,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Listen with friend in real time",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 10,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.queue_music_sharp,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Organize listening queue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PremiumPlans(),
          ],
        ),
      ),
    );
  }
}
