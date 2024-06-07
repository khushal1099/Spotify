import 'package:flutter/material.dart';

class PremiumPlans extends StatefulWidget {
  const PremiumPlans({super.key});

  @override
  State<PremiumPlans> createState() => _PremiumPlansState();
}

class _PremiumPlansState extends State<PremiumPlans> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 210),
          child: Text(
            "Available plans",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          height: 440,
          width: 350,
          decoration: BoxDecoration(
            color: Color(0xff242424),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.workspace_premium,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Premium",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Mini",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffCFF56A),
                      fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "\$7 for 1 day",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "\$25 for 1 week",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "1 mobile-only Premium account",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Exclude listening insights (Your\nSound Capsule)",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Offline listening of up to 30 songs on\n1 device",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "One-time payment",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Basic audio quality",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xffCFF56A),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "One-time payment",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "Terms apply.",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        PremiumContainer(
          color: Color(0xffFFD2D7),
          stitle1: '\$119 for 2 months',
          stitle2: '\$119/month after',
          points: [
            '1 Premium account',
            'Cancel anytime',
            'Subscribe or one-time payment'
          ],
          endcontent:
              '\$119 for 2 months, then \$119 per month after. Offer only available\n\t\t\t\t\t\t\t\t\t\t\t\t\tif you haven\'t tried Premium before. ',
          rebentitle: '\$119 for 2 months',
          heading: 'Individual',
          buttoncontent: 'Get Premium Individual',
        ),
        PremiumContainer(
          color: Color(0xffA5BBD2),
          stitle1: '\$179 for 2 months',
          stitle2: '\$179/month after',
          points: [
            'Up to 6 Premium accounts',
            'Control content marked as explicit',
            'Cancel anything',
            'Subscribe or one-time payment',
          ],
          endcontent:
              '\t\t\t\t\$179 for 2 months, then \$179 per months after. Offer only\navailable if you haven\'t tried Premium before. For up to 6 family\n\t\t\t\t\t\t\t\tmembers residing at the same address. ',
          rebentitle: '\$179 for 2 months',
          heading: 'Family',
          isLine: true,
          buttoncontent: 'Get Premium Family',
        ),
        PremiumContainer(
          color: Color(0xffFFC863),
          stitle1: '\$149 for 2 months',
          stitle2: '\$149/month after',
          points: [
            '2 Premium accounts',
            'Cancel anything',
            'Subscribe or one-time payment',
          ],
          endcontent:
              '\t\t\t\t\$149 for 2 months, then \$149 per month after. Offer only\navailable if you haven\'t tried Premium before.For couples who\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\treside at the same address. ',
          rebentitle: '\$149 for 2 months',
          heading: 'Duo',
          buttoncontent: 'Get Premium Duo',
        ),
        PremiumContainer(
          color: Color(0xffC5B1D4),
          stitle1: '\$59 for 2 months',
          stitle2: '\$59/month after',
          points: [
            '1 Verified Premium accounts',
            'Discount for eligible students',
            'Cancel anything',
            'Subscribe or one-time payment',
          ],
          isLine: true,
          isSecondbutton: false,
          endcontent:
              '\$59 for 2 months, then \$59 per month after. Offer available only\n to students at an accredited higher education institution and if\n\t\t\t\t\t\t\t\t\t\t\t\tyou haven\'t tried Premium before. ',
          rebentitle: '\$59 for 2 months',
          heading: 'Student',
          buttoncontent: 'Get Premium Student',
        ),
      ],
    );
  }
}

class PremiumContainer extends StatelessWidget {
  final Color color;
  final String rebentitle;
  final String heading;
  final String stitle1;
  final String stitle2;

  final String buttoncontent;
  final String endcontent;
  final bool isLine;
  final bool isSecondbutton;
  final List<String> points;

  const PremiumContainer({
    super.key,
    required this.color,
    required this.stitle1,
    required this.stitle2,
    required this.endcontent,
    required this.rebentitle,
    required this.heading,
    this.isLine = false,
    required this.buttoncontent,
    this.isSecondbutton = true,
    this.points = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 500,
      width: 350,
      decoration: BoxDecoration(
        color: Color(0xff242424),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: 150,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: Center(
              child: Text(
                rebentitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.workspace_premium,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Premium",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  heading,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: color, fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  stitle1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  stitle2,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: points
                      .map((e) => Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                e,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      buttoncontent,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                isSecondbutton
                    ? Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "One-time payment",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: endcontent,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
