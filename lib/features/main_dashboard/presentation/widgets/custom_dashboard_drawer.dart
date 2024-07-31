import 'dart:developer';

import 'package:admin_chef_app/core/database/api/api_keys.dart';
import 'package:admin_chef_app/core/database/cache/cache_helper.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utillis/app_colors.dart';
import '../../../../core/widgets/line_widget.dart';
import 'drawer_list_tile.dart';

class CustomDashboardDrawer extends StatelessWidget {
  const CustomDashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainDashboardCubit, MainDashboardState>(
      builder: (context, state) {

        return Container(
            color: AppColors.white,
            child: Column(
              children: [
                LineWidget(
                  height: 4,
                ),
                SpaceWidget(height: 24,),
                ...List.generate(MainDashboardCubit.get(context).firstDrawerDataList.length, (index) => Padding(
                  padding:  EdgeInsetsDirectional.only(bottom: 10.h,start: 30.w),
                  child: DrawerListTile(
                    onListTileTap: ()
                      {
                        MainDashboardCubit.get(context).updateFirstDrawerListShape(currentIndex: index);
                        switch(index)
                        {
                          case 0:
                            MainDashboardCubit.get(context).allSystemMealsModel=null;
                            MainDashboardCubit.get(context).allChefsData=null;
                            break;
                          case 1:
                            MainDashboardCubit.get(context).allChefsData=null;
                            MainDashboardCubit.get(context).getAllMealsFun();
                            break;
                          case 2:
                            MainDashboardCubit.get(context).allSystemMealsModel=null;
                            MainDashboardCubit.get(context).getAllSystemChefsFun();
                            break;
                          case 3:
                            MainDashboardCubit.get(context).allSystemMealsModel=null;
                            MainDashboardCubit.get(context).allChefsData=null;
                            MainDashboardCubit.get(context).getChefRequestDesign();
                            break;
                          case 4:
                            MainDashboardCubit.get(context).allSystemMealsModel=null;
                            MainDashboardCubit.get(context).allChefsData=null;
                            MainDashboardCubit.get(context).getMealRequestDesign();
                            break;

                        }
                      },
                      drawerDataModel: MainDashboardCubit.get(context).firstDrawerDataList[index]),
                ),),
                Spacer(),
                ...List.generate(
                  MainDashboardCubit.get(context).secondDrawerDataList.length,
                    (index) => Padding(
                      padding:  EdgeInsetsDirectional.only(bottom: 10.h,start: 30.w),
                      child: DrawerListTile(
                        drawerDataModel: MainDashboardCubit.get(context).secondDrawerDataList[index],
                        onListTileTap: ()
                        {
                          MainDashboardCubit.get(context).updateSecondDrawerListShape(currentIndex: index);
                          switch(index)
                          {
                            case 0:
                              MainDashboardCubit.get(context).allSystemMealsModel=null;
                              MainDashboardCubit.get(context).allChefsData=null;
                              MainDashboardCubit.get(context).getDeleteMealDesign();
                              break;
                            case 1:
                              MainDashboardCubit.get(context).allSystemMealsModel=null;
                              MainDashboardCubit.get(context).allChefsData=null;
                              MainDashboardCubit.get(context).getDeleteChefDesign();
                              break;
                            case 2:
                              MainDashboardCubit.get(context).allSystemMealsModel=null;
                              MainDashboardCubit.get(context).allChefsData=null;
                              MainDashboardCubit.get(context).getLogoutDesign();
                              MainDashboardCubit.get(context).logoutAdminFun();
                              break;
                          }
                        },
                      ),
                    ),),
                SpaceWidget(height: 24,),


              ],
            )

        );
      },
    );
  }
}
