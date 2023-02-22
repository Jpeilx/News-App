import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/newscubit.dart';
import 'package:news/layout/cubit/newsstates.dart';
import 'package:news/modules/search/search_screan.dart';
import 'package:news/shared/components/components.dart';

class Newslayout extends StatelessWidget {
  const Newslayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  
    BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text('NEWS'),
                actions: [IconButton(onPressed: (){
                  navigateTo(context, const SearchScrean() ) ;
                }, icon: const Icon(Icons.search)) ,
                IconButton(onPressed: (){
                  cubit.changethememode() ;
                }, icon: const Icon(Icons.brightness_4_outlined))
                ],
              ),
              body: cubit.screans[cubit.currentindex],
              bottomNavigationBar: BottomNavigationBar(
                items: cubit.navList , 
                currentIndex: cubit.currentindex,
                onTap: (index){
                  cubit.changeNavItem(index) ; 
                },
                ),
                
            );
          });
   
  }
}
