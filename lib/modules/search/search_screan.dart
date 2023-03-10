import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/newscubit.dart';
import 'package:news/layout/cubit/newsstates.dart';

import 'package:news/shared/components/components.dart';

class SearchScrean extends StatelessWidget {
  const SearchScrean({super.key});

  @override
  Widget build(BuildContext context) {
    var searchcontroller = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {

         var cubit = NewsCubit.get(context) ; 
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultformfield(
                    controller: searchcontroller,
                    keyboardtype: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'search must not be empty';
                      }
                    },
                    prefix: Icons.search,
                    label: 'Search',
                    onchanged: (value){
                      cubit.getsearch(value: value) ;
                    }
                  ),
                ), 
                Expanded(child: articlebuilder(context, cubit.search , issearch: true )) , 
            
              
              ],
            ),
          );
        });
  }
}
