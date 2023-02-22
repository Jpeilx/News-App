

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/newscubit.dart';
import 'package:news/layout/cubit/newsstates.dart';

import 'package:news/shared/components/components.dart';


class Business extends StatelessWidget {
  const Business({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    BlocConsumer<NewsCubit , NewsStates>(
        listener: ((context, state) {}),
        builder: ((context, state) {
           var list = NewsCubit.get(context).business ; 
          return  articlebuilder(context, list) ; 
        }));
  }
}
