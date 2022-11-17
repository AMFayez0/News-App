// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componenets/componenet.dart';
import 'package:news_app/cubit/app_cubit/app_cubit.dart';
import 'package:news_app/cubit/news_cubit/news_cubit.dart';
import 'package:news_app/modules/search.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Scaffold(
            body: cubit.Screens[cubit.currentindex],
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Search(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeMode();
                  },
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomitems,
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changeNavbar(index);
              },
            ),
          ),
        );
      },
    );
  }
}
