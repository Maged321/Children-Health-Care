import 'package:carousel_slider/carousel_slider.dart';
import 'package:childern_health_care/shared/styles/colores.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/cuibt/cubit.dart';
import '../../../../shared/cuibt/states.dart';
import '../../../models/homemodel.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../about_us/about_us.dart';
import '../categories/sections_screans/subsection_screan.dart';
import '../categories/sections_screans/video_screan.dart';




class HomePage_Screan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
  return BlocConsumer<ChildernCubit,ChildernStates>(
       listener: (context,state)
       {

       },
        builder: (context,state)
        {
          var cubit=ChildernCubit.get(context);
            final int index;
          return SafeArea(
            child: Scaffold(
               drawer: buildMenu(context,cubit.listData),
              appBar: AppBar(
                title: InkWell(
                  onTap:  () {
                    navigateTo(context,HomePage_Screan(),);
                  },
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
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // navigateTo(context, buildGridProduct(context));
                    },
                  ),
                  IconButton(
                      onPressed: ()
                      {
                        cubit.changeAppMode();
                      },
                      icon: Icon(Icons.mode_night_outlined,)
                  ),
                ],
              ),
              body: SingleChildScrollView(
                    physics:  const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        CarouselSlider(
                          items:[
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image(image:NetworkImage('https://islamnagah.pythonanywhere.com/media/image_sections/NCTUUIPRXZDF7H24VL3AYFV4PA.jpg'),
                                ),
                                Text(
                                  'Welcom To Childern Health Care ',
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image(image:NetworkImage('https://islamnagah.pythonanywhere.com/media/image_sections/NCTUUIPRXZDF7H24VL3AYFV4PA.jpg'),
                                ),
                                Text(
                                  'Welcom To Childern Health Care ',
                                  style: TextStyle(
                                    color:white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            // Stack(
                            //   alignment: Alignment.bottomLeft,
                            //   children: [
                            //     Image(image:NetworkImage(cubit.listData[4].sectionImage!),
                            //
                            //     ),
                            //     Text(
                            //       'In Childern Health Care :',
                            //     ),
                            //     Text(
                            //       'We Provid Articles ,Videos For Parents To Keep Childern Health ',
                            //       style: TextStyle(
                            //         fontSize: 13,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Stack(
                            //   alignment: Alignment.bottomLeft,
                            //   children: [
                            //     Image(image:NetworkImage(cubit.listData[5].sectionImage!),
                            //
                            //     ),
                            //     Text(
                            //       'We Also Care About Disable Childern And Childern That Have Autism',
                            //     ),
                            //   ],
                            // ),
                          ],
                          options:CarouselOptions(
                            height: MediaQuery.of(context).size.height*0.3,
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
                        SizedBox(
                          height:MediaQuery.of(context).size.height*0.03,
                        ),
                        Container(
                          //color: Colors.grey[100],
                          height: MediaQuery.of(context).size.height*0.15,
                          width:MediaQuery.of(context).size.width*0.95,
                          child: Padding(
                            padding: MediaQuery.of(context).systemGestureInsets*0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'In Children Health Care Application,'
                                      ' We Provide Parents And Carers With Free ,'
                                      ' Reliable, Scientifically Validated Information. '
                                      'This Information Helps '
                                      'Parents And Carers Keep'
                                      ' Their Children Healthy And Developing Well.',
                                   style:
                                  TextStyle(
                                    fontSize: 13.0,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                TextButton(
                                    onPressed:()
                                    {
                                      navigateTo(context,About_Us(),);
                                    } ,
                                    child:Text(
                                      'Read More ',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color:defultColor,
                                        fontWeight: FontWeight.w700,
                                      ),

                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*0.02,
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing:15.0 ,
                          crossAxisSpacing: 10.0,
                          childAspectRatio:  3 / 2.2,
                          padding: MediaQuery.of(context).systemGestureInsets*0.4,
                          children:List.generate(
                            cubit.listData.length
                              , (index)=>
                              InkWell(
                                  onTap: ()
                                  {
                                    navigateTo(context, Subsection_Sreans(cubit.listData[index].id!));
                                  },
                                  child:
                                  buildGridCategories(cubit.listData[index]))

                          ),
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*0.03,
                        ),
                        Container(
                          //color: Colors.grey[100],
                          width:MediaQuery.of(context).size.width*0.95,
                          child: Padding(
                            padding: MediaQuery.of(context).systemGestureInsets*0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'About',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                                SizedBox(
                                  height:MediaQuery.of(context).size.height*0.02,
                                ),
                                TextButton(
                                    onPressed:()
                                    {
                                      navigateTo(context,About_Us(),);
                                    } ,
                                    child:Text(
                                      '>> About Children Healthy Care ',
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: defultColor
                                      ),

                                    )
                                ),
                                TextButton(
                                    onPressed:()
                                    {
                                      navigateTo(context,About_Us(),);
                                    } ,
                                    child:Text(
                                      '>> What We Do ',
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: defultColor
                                      ),

                                    )
                                ),
                                TextButton(
                                    onPressed:()
                                    {
                                      navigateTo(context,About_Us(),);
                                    } ,
                                    child:Text(
                                      '>> Who We Are ',
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: defultColor
                                      ),

                                    )
                                ),
                                TextButton(
                                    onPressed:()
                                    {
                                      navigateTo(context,About_Us(),);
                                    } ,
                                    child:Text(
                                      '>> Contact Us ',
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: defultColor
                                      ),

                                    )
                                ),
                                myDivider(
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  height:MediaQuery.of(context).size.height*0.02,
                                ),
                                Center(
                                  child: Text(
                                    '© 2022-2023 Children Health Care',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          );

        },
  );
  }

  Widget buildGridCategories(HomeModel model ) {

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        if(model.sectionImage !=null)
        Image(
          image: NetworkImage(model.sectionImage!),
          fit: BoxFit.cover,
        ),
        Text(
          '${model.sectionName}',
          style: TextStyle(
            color: white,
          ),
        ),

      ],
    );
  }

  Widget buildMenu(context,List<HomeModel> model)=>Drawer(

    child: Column(
      children: [
        InkWell(
          onTap: () {
            navigateTo(context,HomePage_Screan(),);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: MediaQuery.of(context).size.width*0.2,
                height: MediaQuery.of(context).size.height*0.17,
              ),
              Text(
                'Children Health Care',
                style: TextStyle(
                  fontSize: 15,
                  color: defultColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height:MediaQuery.of(context).size.height*0.06,
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount:model.length ,
            physics: BouncingScrollPhysics(),
            itemBuilder:(context,index){
              return ListTile(
                leading: Image(
                  image:AssetImage('assets/images/pregnant (1).png'),
                  width: MediaQuery.of(context).size.width*0.08,
                  height: MediaQuery.of(context).size.height*0.08,

                ),
                title: Text(
                  '${model[index].sectionName}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                onTap: () =>
                {
                  navigateTo(context,Subsection_Sreans (model[index].id!),),
                },
              );
            } ,
            separatorBuilder: (context, index) {
              return myDivider(
                color: Colors.grey,
              );
            },

          ),
        ),
        ListTile(
          leading: Image(
            image:AssetImage('assets/images/pregnant (1).png'),
            width: MediaQuery.of(context).size.width*0.08,
            height: MediaQuery.of(context).size.height*0.08,

          ),
          title: Text(
            'Vidoes',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          onTap: () =>
          {
            navigateTo(context,Vidoe_Screan (),),
          },
        ),
        Spacer(),
        ListTile(
          leading: IconTheme(
            data: IconThemeData(
             // size: 30,
            ),
            child: Icon(
              Icons.logout_outlined,
            ),
          ),
          title: Text(
            'Logout',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: defultColor,
            ),
          ),
          onTap: () => signOut(context),
        ),
      ],
    ),
  );

}

