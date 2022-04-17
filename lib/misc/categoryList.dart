import 'package:flutter/material.dart';
import 'package:ugaoo/Screens/MainPage/Plants/air_purifier.dart';
import 'package:ugaoo/Screens/MainPage/Plants/cactus.dart';
import 'package:ugaoo/Screens/MainPage/Plants/flowers.dart';
import 'package:ugaoo/Screens/MainPage/Plants/foliage.dart';
import 'package:ugaoo/Screens/MainPage/Plants/indoor_plants.dart';
import 'package:ugaoo/Screens/MainPage/Plants/low_maintenance.dart';
import 'package:ugaoo/Screens/MainPage/Plants/pet_friendly.dart';
import 'package:ugaoo/Screens/MainPage/Plants/trending.dart';
import 'package:ugaoo/Screens/MainPage/Pots/ceramic.dart';
import 'package:ugaoo/Screens/MainPage/Pots/concrete.dart';
import 'package:ugaoo/Screens/MainPage/Pots/grow_bags.dart';
import 'package:ugaoo/Screens/MainPage/Pots/metalic.dart';
import 'package:ugaoo/Screens/MainPage/Pots/plastic.dart';
import 'package:ugaoo/Screens/MainPage/Pots/tray.dart';
import 'package:ugaoo/Screens/MainPage/Seeds/seeds_easy.dart';
import 'package:ugaoo/Screens/MainPage/Seeds/seeds_summer.dart';
import 'package:ugaoo/Screens/MainPage/Seeds/seeds_winter.dart';

// Shown on Main Screen

class CategoryList {
  static final CategoryList categoryList = CategoryList();

  final List<String> mainCategories = [
    "Seeds",
    "Plants",
    "Pots",
    "Tools",
    "Plant Care",
    "Merch",
    "Kits",
    "Blog",
    "Offers",
    "Subscription",
    "Gifting"
  ];

  final List<Tab> subPlants = [
    Tab(text: "Air Purifier"),
    Tab(text: "Foliage Pattern"),
    Tab(text: "Indoor"),
    Tab(text: "Low Maintenance"),
    Tab(text: "Flowering"),
    Tab(text: "Pet-Friendly"),
    Tab(text: "Cacti & Succulents"),
    Tab(text: "Trending")
  ];

  final List<Tab> subSeeds = [
    Tab(text: "Winter Season"),
    Tab(text: "Summer Season"),
    Tab(text: "Easy to Grow")
  ];

  final List<Tab> subPots = [
    Tab(text: "Plastic"),
    Tab(text: "Ceramic"),
    Tab(text: "Metallic"),
    Tab(text: "Concrete"),
    Tab(text: "Seedling Tray"),
    Tab(text: "Grow Bags"),
  ];

  final List<Tab> subTools = [
    Tab(text: "Pruning & Cutting"),
    Tab(text: "Hand Tools"),
    Tab(text: "Diggind & Ranking"),
    Tab(text: "Watering"),
    Tab(text: "Spray Pumps"),
    Tab(text: "Garden Decor"),
  ];

  final List<Widget> seedsPages = [WinterSeeds(), SummerSeeds(), EasySeeds()];

  final List<Widget> plantPages = [
    AirPurifier(),
    FoliagePlants(),
    IndoorPlants(),
    LowMaintenance(),
    Flowers(),
    PetFriendly(),
    Cactus(),
    Trending(),
  ];

  final List<Widget> potPages = [
    Plastic(),
    Ceramic(),
    Metallic(),
    Concerete(),
    Tray(),
    GrowBags(),
  ];
}
