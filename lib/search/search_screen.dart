import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/components/components.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/cubit/states.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextField(
                    controller: searchController,
                    label: 'search',
                    prefix: Icons.search,
                    textInputType: TextInputType.text,
                    onValidate: (String value) {
                      if (value.isEmpty) {
                        return 'search must not be empty!';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      NewsCubit.get(context).getSearch(value);
                    }),
              ),
              Expanded(child: articleBuilder(list, context)),
            ],
          ),
        );
      },
    );
  }
}
