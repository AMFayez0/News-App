// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componenets/componenet.dart';
import 'package:news_app/cubit/news_cubit/news_cubit.dart';

class Search extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).search;
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  enabled: true,
                  onChanged: (Value) {
                    NewsCubit.get(context).getSearch(Value);
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'search must not be Empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              
              Expanded(
                child: ConditionalBuilder(
                  fallback: (context) => Center(
                    child: SizedBox(),
                  ),
                  condition: list.isNotEmpty,
                  builder: (context) => ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildArticleItem(list[index], context),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: list.length),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
