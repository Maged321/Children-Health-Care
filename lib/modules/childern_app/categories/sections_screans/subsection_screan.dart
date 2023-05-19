import 'package:childern_health_care/models/pregrancymodel.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/cuibt/cubit.dart';
import '../../../../shared/cuibt/states.dart';
import '../../../../shared/styles/colores.dart';
import '../../home_screan/home_screan.dart';
import 'category_screan.dart';

class Subsection_Sreans extends StatelessWidget {
  final int id;

  Subsection_Sreans(this.id);

  final cubit = ChildernCubit();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (BuildContext context) => cubit..getPregrancyData(secId: id),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: InkWell(
                onTap: () {
                  navigateTo(
                    context,
                    HomePage_Screan(),
                  );
                },
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: size.width * 0.1,
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                      width: size.width * 0.0001,
                    ),
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
            body: BlocConsumer<ChildernCubit, ChildernStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = ChildernCubit.get(context);
                  if(state  is ChildernGetPregrancyDataLoadingState){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  final model = cubit.preModel!;
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        CarouselSlider(
                          items: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image(
                                  image: NetworkImage(
                                      model.subsection?[0].subsectionImage??''),
                                ),
                                Text(
                                  '${model.subsection?[0].subsectionName??''}',
                                  style: TextStyle(
                                    color:white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image(
                                  image: NetworkImage(
                                      model.subsection?[1].subsectionImage??''),
                                ),
                                Text(
                                  '${model.subsection?[1].subsectionName??''}',
                                  style: TextStyle(
                                    color:white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image(
                                  image: NetworkImage(
                                      model.subsection?[2].subsectionImage??''),
                                ),
                                Text(
                                  '${model.subsection?[2].subsectionName??''}',
                                  style: TextStyle(
                                    color:white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image(
                                  image: NetworkImage(
                                     "${ model.subsection?[3].subsectionImage}"),
                                ),
                                Text(
                                  '${model.subsection?[3].subsectionName}',
                                  style: TextStyle(
                                    color:white,
                                    fontWeight: FontWeight.w700,
                                  ),
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 3 / 2.2,
                          padding:
                              MediaQuery.of(context).systemGestureInsets * 0.4,
                          children: List.generate(
                            model.subsection!.length,
                            (index) => InkWell(
                                onTap: () {
                                  navigateTo(context,
                                      Category_Screan(model.subsection![index].id!));
                                },
                                child: buildGridCategories(
                                    model.subsection![index], context)),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ));
  }
  Widget buildGridCategories(Subsection model, context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            if (model.subsectionImage != null)
              Image(
                image: NetworkImage(model.subsectionIcon!),
                width: MediaQuery.of(context).size.width * 0.12,
                height: MediaQuery.of(context).size.height * 0.12,
              ),
            if (model.subsectionImage != null)
              Text(
                '${model.subsectionName}',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ));
  }
}
