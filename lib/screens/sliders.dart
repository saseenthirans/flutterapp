import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:courier_app/api/my_api.dart';
import 'package:courier_app/model/sliders.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  var sliders = <SliderInfo>[];
  // List<SliderInfo> sliders = [];
  @override
  void initState() {
    _getSliders();
    super.initState();
  }

  _getSliders() {
    CallApi().getSliderData('sliders').then((response) {
      Iterable list = json.decode(response.body);
      sliders = list.map((model) => SliderInfo.fromJson(model)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
              items: sliders.map((e) {
                return Container(
                  width: 1000.0,
                  margin: const EdgeInsets.only(top: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image:  DecorationImage(
                        image: NetworkImage("https://courier.lkdevops.com/"+e.image),
                        fit: BoxFit.cover,
                      )),
                );
              }).toList(),
              // items: <Widget>[

              // ],
              options: CarouselOptions(
                autoPlay: true,
                height: 180.0,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ))
        ],
      ),
    );
  }
}
