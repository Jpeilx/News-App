
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/newscubit.dart';
import '../../layout/cubit/newsstates.dart';
import '../../shared/components/components.dart';
class Sports extends StatelessWidget {
  const Sports({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: ((context, state) {}),
        builder: ((context, state) {
           var list = NewsCubit.get(context).sports ; 
          return articlebuilder(context, list) ; 
        }));
  }
}