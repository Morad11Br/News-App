import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/components/components.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/cubit/states.dart';
import 'package:news_application/search/search_screen.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('New App'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
              ),
              IconButton(
                icon: Icon(Icons.brightness_4),
                onPressed: () {
                  cubit.changeAppTheme();
                },
              ),
            ],
          ),
          body: cubit.screenItem[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.navBarItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeNavBarItem(index);
            },
          ),
        );
      },
    );
  }
}
