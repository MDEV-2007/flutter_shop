// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/app_style.dart';
import 'package:shop/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> categories = [
    "All Items",
    "Drees",
    'Hat',
    'Watch',
  ];
  
  List<String> icons = [
    "all_items_icon",
    'dress_icon',
    'hat_icon',
    'watch_icon',
  ];
  
  List<String> image = [
    'image1',
    'image2',
    'image3',
    'image4',
    'image5',
    'image6',
    'image7',
    'image8',
    'image9',
    'image10',
    'image11',
    'image12',
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);


    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal,
            ),
            
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hello, Welcome ❤️', style: kEncodeSnasRegular.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                      ),
                       Text('Ismoillov Murodulla', style: kEncodeSnasbold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: kGrey,
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgWkA3X9cdGn3tggpvy_hnWe0QmRZW-DjwHw&usqp=CAU'),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              children: [
                Expanded(child: 
                  TextField(
                    style: kEncodeSnasRegular.copyWith(
                      color: kDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5
          
                    ),
                    controller: TextEditingController(),
                    decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 13,
          
                      ),
                      prefixIcon: IconTheme(data: IconThemeData(
                        color: kDarkGrey
                      ),
                      child: const Icon(Icons.search)),
                      hintText: 'Search clothes ...',
                      border: kInputBorder,
                      errorBorder: kInputBorder,
                      disabledBorder: kInputBorder,
                      focusedBorder: kInputBorder,
                      focusedErrorBorder: kInputBorder,
                      enabledBorder: kInputBorder,
                      hintStyle: kEncodeSnasRegular.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! *3.5
                      )
          
                    ),
          
                  )
                ),
                SizedBox(
                  width: 16,
                ),

                Container(
                  height: 49,
                  width: 49,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular
                  (kBorderRadius),
                  color: kBlack
                  ),
                  child: SvgPicture.asset('assets/filter.svg', color: kWhite,),
          
                )
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            height: 36,

            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                      
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: index==0? kPaddingHorizontal: 15,
                      right: index== categories.length-1? kPaddingHorizontal : 0
                    ),
                    height: 36,
                    decoration: BoxDecoration(
                      color: current == index? kBrown : kWhite, 
                      borderRadius: BorderRadius.circular(8),
                      border: current  == index? null : Border.all(
                        color: kLightGrey,width: 1 ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          current == index? 'assets/${icons[index]}_selected.svg' : 
                          'assets/${icons[index]}_unselected.svg', width: 50,height: 30,
                        ),
                        const SizedBox(width: 4,),
                        Text(categories[index], style: kEncodeSnasMedium.copyWith(
                          color: current == index? kWhite : kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        ),)
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
          const SizedBox(height: 32,),

          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 23,
            itemCount: image.length,
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            itemBuilder: (context, index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          child: Image.asset('assets/images/${image[index]}.jpg',
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 12,
                        top: 12,
                        child: GestureDetector(
                          onTap: (){},
                          child: SvgPicture.asset('assets/dislike.svg',),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 40,),
                  Text('Modern light clothes', 
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: kEncodeSnasSemibold.copyWith(
                    color: kDarkBrown,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  ),),
                  Text('Drees Modern', 
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kEncodeSnasRegular.copyWith(
                    color: kGrey,
                    fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                    
                  ),),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('\$212.66', 
                      style: kEncodeSnasSemibold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),),
                      Row(
                        children: [
                          const Icon(Icons.star, color: kYellow,size: 16,),
                          SizedBox(width: 8,),
                          Text('5.0', 
                          style: kEncodeSnasRegular.copyWith(
                            color: kDarkBrown,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          ),),
                        ],
                      ),
                    ],
                  )
                ],
              );
            }
          ),
        ],
      ),
    );
  }
}