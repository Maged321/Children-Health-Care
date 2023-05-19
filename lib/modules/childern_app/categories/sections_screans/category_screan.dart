
import 'package:carousel_slider/carousel_slider.dart';
import 'package:childern_health_care/modules/childern_app/categories/sections_screans/video_screan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/articles_model.dart';
import '../../../../models/catModel.dart';
import '../../../../models/pregrancymodel.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/cuibt/cubit.dart';
import '../../../../shared/cuibt/states.dart';
import '../../home_screan/home_screan.dart';


class Category_Screan extends StatelessWidget {
  // final Categoris_Model model;
  // Category_Screan(
  //     this.model
  //     );
  final int id;

  Category_Screan(this.id);

  final cubit = ChildernCubit();

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return BlocProvider(
        create:(BuildContext context)=>cubit..getCat(secId: id),
     child:SafeArea(
       child: Scaffold(
         appBar: AppBar(
           title: InkWell(
             onTap:  () {
               navigateTo(context,HomePage_Screan(),);
             },
             child: Center(
               child: Row (
                 children: [
                   Image(image:AssetImage('assets/images/logo.png'),
                     width:size.width*0.1,
                     height:size.height*0.05,
                   ),
                   SizedBox(width: size.width*0.0001,),
                   Text(
                     "Childern Health Care",
                     style: TextStyle(
                       fontSize: 14,
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ),
         body:BlocConsumer<ChildernCubit,ChildernStates>(
           listener: (context,state){},
           builder: (context,state){
             var cubit=ChildernCubit.get(context);
             if(state  is ChildernGetCategoryDataLoadingState){
               return const Center(child: CircularProgressIndicator(),);
             }
             else if(cubit.catModel ==null){
               return const Center(child: CircularProgressIndicator(),);
             }
             final model = cubit.catModel!;
            // final modelART = cubit.artModel!;
             return SingleChildScrollView(
               physics: BouncingScrollPhysics(),
               child: Column(
                 children: <Widget>[
                   CarouselSlider(
                     items: [
                       Stack(
                         alignment: Alignment.bottomLeft,
                         children: [
                           Image(image:NetworkImage('https://islamnagah.pythonanywhere.com/media/image_sections/NCTUUIPRXZDF7H24VL3AYFV4PA.jpg'),
                           ),
                         ],
                       ),
                     ],
                     options: CarouselOptions(
                       //height: MediaQuery.of(context).size.height * 0.3,
                       initialPage: 0,
                       viewportFraction: 1.0,
                       enableInfiniteScroll: true,
                       reverse: false,
                       autoPlay: true,
                       autoPlayInterval: Duration(seconds: 3),
                       autoPlayAnimationDuration: Duration(seconds: 1),
                       autoPlayCurve: Curves.fastOutSlowIn,
                       scrollDirection: Axis.horizontal,
                     ),
                   ),
                   SizedBox( height:MediaQuery.of(context).size.height * 0.05),
                   Text(
                     '${model.subsectionName}',
                     style: TextStyle(
                       fontSize:16.0,
                       fontWeight: FontWeight.w700,
                     ),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ),
                   ListView(
                     shrinkWrap: true,
                     physics: ScrollPhysics(),
                     children: <Widget>[
                       SizedBox(height: 20.0),
                       Container(
                         child: ListView.builder(
                           shrinkWrap: true,
                         itemCount:model.categories!.length,
                           physics: ScrollPhysics(),
                           itemBuilder: (context,index){
                             return buildExpansion(
                                 model.categories![index],
                                 context,
                               );
                           },
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             );
           },
         ),
       ),
     )
    );
  }
Widget buildExpansion(Categories catModel,context){

  bool _customTileExpanded = false;

  return Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(30),
        ),
        //width: MediaQuery.of(context).size.width * 0.12,
        child: ExpansionTile(
          title: Text('${catModel.categoryName}'),
          trailing: Icon(
            _customTileExpanded
                ? Icons.arrow_drop_down_circle
                : Icons.arrow_drop_down,
          ),
          onExpansionChanged:(value){

            if (value){
              cubit.getArticlesData(catID: catModel.id!);
            }
          } ,
          children: <Widget>[
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3 / 3.3,
              padding:
              MediaQuery.of(context).systemGestureInsets * 0.4,

              children: cubit.artModel != null ?
              List.generate(
                cubit.artModel!.articles!.length,
                    (index) => buildGridCategories(
                    cubit.artModel!.articles![index],catModel.id!,context),
              ):[],
            ),
          ],
        ),
      ),
      SizedBox( height:MediaQuery.of(context).size.height * 0.05),
    ],
  );
}
  Widget buildGridCategories(Articles artModel,int id,context) {
    if(artModel.category ==id){
      return Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image(
                          image:NetworkImage(artModel.imagePath!),
                        ),
                        Text(
                          '${artModel.title}',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          '${artModel.articleDetails}',
                          style: TextStyle(
                            fontSize: 12.0,
                            //fontWeight: FontWeight.bold,
                          ),
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 2,
                        ),

                      ],
                    ),
                  ),
                ),
                child: Image(image:NetworkImage(artModel.imagePath!),
                ),
              ),
              Text(
                '${artModel.title}',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
      );
    }
    return SizedBox();
  }
}
