import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news/modules/webview/webview_screan.dart';
import 'package:news/shared/components/constant.dart';

Widget buildArticleItem( article  , context , bool isdark ){
  return InkWell (
    onTap: (){
      navigateTo(context, WebViewScrean(article['url']));
    },
    child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image:  DecorationImage(
                    image: NetworkImage(
                        '${article['urlToImage']}'),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children:  [
                  Expanded (
                    child: Text(
                      '${article['title']}',
                      maxLines:  4,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: isdark ?  Colors.white : Colors.black,
                        ) ,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(color: Colors.grey),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
  );
}

Widget articlebuilder(context , list, {issearch = false}){
  return ConditionalBuilder(
            condition:list.length>0,
            builder: (context) {
              return ListView.separated(
                  physics: const  BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return buildArticleItem( list [index] , context , isdark);
                  }),
                  separatorBuilder: ((context, index) {
                    return seperator();
                  }),
                  itemCount:list.length );
            },
            fallback: (context) {
              return  Center(child: issearch ? Container() : const CircularProgressIndicator());
            },
          );
}



Widget seperator (){

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
              width:  double.infinity,
              height: 1 ,
              color: Colors.grey,
            ),
  ) ;
}
Widget defaultformfield({
  @required TextEditingController? controller,
  @required TextInputType? keyboardtype,
  void Function(String)? onsubbmited,
  Function(String)? onchanged,
  @required String? Function(String?)? validator,
  @required IconData? prefix,
  @required String  ?label , 
  void Function()? ontap ,
  bool password = false,
  IconData? suffix,
}) {
  return TextFormField(
    style: TextStyle(color:  isdark ? Colors.white : Colors.black ),
    controller: controller,
    obscureText: password,
    keyboardType: keyboardtype,
    onFieldSubmitted: (value) => onsubbmited,
    onChanged: onchanged,
    onTap: ontap ,
    validator: validator ,
    decoration: InputDecoration(
      
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null ? Icon(suffix) : null,
      border: const OutlineInputBorder(),
    
      
      
    
    ),
  );
}



 void  navigateTo (context , object ){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => object  ) );
}