import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:courier_app/api/my_api.dart';
import 'package:courier_app/model/sliders.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var sliders = <SliderInfo>[];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void initState() {
    _getSliders();
    // super.initState();
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
              items: sliders.map((e) =>
                Container(
                  width: 1000.0,
                  margin: const EdgeInsets.only(top: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                        fit: BoxFit.cover,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'No Data Found',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ).toList(),
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
