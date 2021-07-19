import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/components/components.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/cubit/states.dart';

class SportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return articleBuilder(list, context);
      },
    );
  }
}
