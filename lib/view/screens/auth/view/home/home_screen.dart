import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/controller/manager/home/cubit/home_cubit.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/link.dart';
import 'package:e_commerce_app/view/widgets/auth/customTextField.dart';
import 'package:e_commerce_app/view/widgets/home/custom_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => HomeCubit()..getallData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener if needed
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeFailuer) {
            return Center(child: Text("${state.message}"));
          } else if (state is HomeSuccess) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomSearch(width: width, height: height),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: height * 0.15,
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            ListTile(
                              title: Text(
                                'Home',
                                style: TextStyle(
                                    color: AppColor.KBackgroundColor,
                                    fontSize: 30),
                              ),
                              subtitle: Text('This is home screen',
                                  style: TextStyle(
                                      color: AppColor.KBackgroundColor,
                                      fontSize: 20)),
                            ),
                            Positioned(
                              bottom: height * 0.02,
                              left: width * 0.67,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.scoundColor,
                                    borderRadius:
                                        BorderRadius.circular(width * 0.3)),
                                width: width * 0.3,
                                height: width * 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (state.categories != null)
                        SizedBox(
                          height: height * 0.15,
                          width: width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true, 
                            itemCount: state.categories.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 243, 155, 149),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: width * 0.05),
                                      child: SvgPicture.network("${imageCategories}/${state.categories[index].categorieImage}",width:  width* 0.15,),
                                    ),
                                  ),
                                  Text("${state.categories[index].categorieNameEn}",style: TextStyle(
                                    fontSize: 15,
                                  ),)
                                ],
                              );
                            },
                          ),
                        ),
                    
                    Text("Product For You",style: TextStyle(color: AppColor.primaryColor,fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 200,
                        width: width,
                        
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.items.length,
                          itemBuilder: (context,index){
                         return Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child:Stack(
                            alignment: AlignmentDirectional.center,
  children: [
    // Background cover image
    Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        '${imageItems}/${state.items[index].itemImage}',
       
        fit: BoxFit.cover, // Makes the image cover the whole container
      ),
    ),
    // Overlay for background color if needed
    Container(
      height: 120,
      width: 150,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 178, 174, 174).withOpacity(0.5), // Optional overlay color
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    
    Positioned(
      top: 140,
      left: 10,
      child: Text(
        '${state.items[index].itemNameEn} ',
        style: TextStyle(
          color: AppColor.KBackgroundColor,
        ),
      ),
    ),
  ],
)

                         );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text("Unexpected state"));
          }
        },
      ),
    );
  }
}
