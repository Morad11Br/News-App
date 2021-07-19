import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubit/states.dart';
import 'package:news_application/modules/business/business_screen.dart';
import 'package:news_application/modules/science/science_screen.dart';
import 'package:news_application/modules/sport/sport_screen.dart';
import 'package:news_application/network/cache_helper.dart';
import 'package:news_application/network/dio_helper.dart';

class NewsCubit extends Cubit<Newsstates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer),
      label: 'Sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_rounded),
      label: 'Science',
    ),
  ];

  List<Widget> screenItem = [
    BusinessScreen(),
    SportScreen(),
    SciencessScreen(),
  ];

  void changeNavBarItem(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  List<dynamic> business = [];

  Future<Response> getBusiness() async {
    emit(NewsGetBusinessLodingState());
    return await Diohelper.getData(
      url: 'v2/top-headlines',
      queries: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'f0347c75d90c484fa40ac287425bb07a',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((e) {
      print(e);
      emit(NewsGetBusinessErrorState(e.toString()));
    });
  }

  List<dynamic> sports = [];

  Future<Response> getSports() async {
    emit(NewsGetSportsLodingState());
    return await Diohelper.getData(
      url: 'v2/top-headlines',
      queries: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'f0347c75d90c484fa40ac287425bb07a',
      },
    ).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((e) {
      print(e);
      emit(NewsGetSportsErrorState(e.toString()));
    });
  }

  List<dynamic> science = [];

  Future<Response> getScience() async {
    emit(NewsGetScienceLodingState());
    return await Diohelper.getData(
      url: 'v2/top-headlines',
      queries: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'f0347c75d90c484fa40ac287425bb07a',
      },
    ).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((e) {
      print(e);
      emit(NewsGetScienceErrorState(e.toString()));
    });
  }

  bool isDark = false;

  void changeAppTheme({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else
      isDark = !isDark;
    CacheHelper.setData(key: 'isDark', value: isDark).then((value) {
      emit(NewsChangeAppThemeState());
    });
  }

  List<dynamic> search = [];

  Future<Response> getSearch(String value) async {
    emit(NewsGetSearchLodingState());
    return await Diohelper.getData(
      url: 'v2/everything',
      queries: {
        'q': '$value',
        'apiKey': 'f0347c75d90c484fa40ac287425bb07a',
      },
    ).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((e) {
      print(e);
      emit(NewsGetSearchErrorState(e.toString()));
    });
  }
}
