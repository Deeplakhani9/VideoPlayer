import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class csp extends StatefulWidget {
  const csp({Key? key}) : super(key: key);

  @override
  State<csp> createState() => _cspState();
}

class _cspState extends State<csp> {
  CarouselController carouselController = CarouselController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("carousel slider page"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                onPageChanged: (val, _) {
                  setState(() {
                    index = val;
                  });
                },
                scrollDirection: Axis.horizontal,
                height: 200,
                viewportFraction: 0.8,
                autoPlay: true,
                enableInfiniteScroll: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayInterval: Duration(seconds: 5),
                //  autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
              ),
              items: Global.imeg.map((e) {
                return Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image.network(
                    e,
                  ),
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 130),
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                // color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: Global.imeg.map((e) {
                  int i = Global.imeg.indexOf(e);
                  return GestureDetector(
                    onTap: () {
                      carouselController.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor:
                          (i == index) ? Colors.black : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
