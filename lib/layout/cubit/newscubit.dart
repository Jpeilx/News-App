

import 'package:flutter/material.dart';
import 'package:news/layout/cubit/newsstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/business_screan.dart';
import 'package:news/modules/scince/scince_screan.dart';
import 'package:news/modules/sports/sports_screan.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

import '../../shared/components/constant.dart';
import '../../shared/network/local/cache_helper.dart';




class NewsCubit extends Cubit <NewsStates>{
  
  NewsCubit() :super(InitialState()) ; 

  static NewsCubit get(context) => BlocProvider.of(context) ;

  int currentindex = 0 ; 


  List <BottomNavigationBarItem> navList = [
    const BottomNavigationBarItem(icon: Icon(Icons.business ) , label:  'Business') , 
    const BottomNavigationBarItem(icon: Icon(Icons.science ) , label:  'Scince') ,
    const BottomNavigationBarItem(icon: Icon(Icons.sports ) , label:  'Sports'),
    
  ] ; 

   
  List<Widget> screans = [
    const Business() , 
    const Scince() , 
    const Sports() ,
  ];

  void changeNavItem(int index ){
    currentindex = index ; 
    emit(ButtonNavState()) ; 
  }
  List<dynamic> business =[] ; 

  void getbusiness(){
    emit(GetBusinessLoadingState()) ; 
   DioHelper.getdata(
    url: 'v2/top-headlines' , 
    query: {
      'country':'us',
      'category':'business',
      'apiKey':apiKey,
    }
   ).then((value){
    business = value?.data['articles'] ;
    print(business[0]['title']) ;
    emit(GetBusinessSuccessState()) ;
   }).catchError((error){
    print(error.toString()) ; 
    emit(GetBusinessErorrState(error.toString())) ; 
   }) ; 
  } 
  List<dynamic> scince =[] ; 

  void getscince(){
    emit(GetScinceLoadingState()) ; 
   DioHelper.getdata(
    url: 'v2/top-headlines' , 
    query: {
      'country':'us',
      'category':'science',
      'apiKey':apiKey,
    }
   ).then((value){
    scince  = value?.data['articles'] ;
    print(scince[0]['title']) ;
    emit(GetScinceSuccessState()) ;
   }).catchError((error){
    print(error.toString()) ; 
    emit(GetScinceErorrState(error.toString())) ; 
   }) ; 
  } 
  List<dynamic> sports =[] ; 

  void getsports(){
    emit(GetSportsLoadingState()) ; 
   DioHelper.getdata(
    url: 'v2/top-headlines' , 
    query: {
      'country':'us',
      'category':'sports',
      'apiKey':apiKey,
    }
   ).then((value){
    sports = value?.data['articles'] ;
    print(sports[0]['title']) ;
    emit(GetSportsSuccessState()) ;
   }).catchError((error){
    print(error.toString()) ; 
    emit(GetSportsErorrState(error.toString())) ; 
   }) ; 
  } 
  List <dynamic> search = [] ; 
  void getsearch({required String  value}){
    search = [] ;
    emit(GetSearchLoadingState()) ; 
   DioHelper.getdata(
    url: 'v2/everything' , 
    query: {
      'q': value ,
      'apiKey':apiKey,
    }
   ).then((value){
    search = value?.data['articles'] ;
    print(search[0]['title']) ;
    emit(GetSearchSuccessState()) ;
   }).catchError((error){
    print(error.toString()) ; 
    emit(GetSearchErorrState(error.toString())) ; 
   }) ; 
  } 
   void changethememode(){
    
    isdark = !isdark ;
    CacheHelper.setbooleandata(key: 'isdark', value: isdark).then((value) {
    }); 
    emit(ChangeThemeModeState()) ;
    
  }
  

}