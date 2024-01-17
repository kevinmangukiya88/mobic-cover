import 'package:flutter/material.dart';
import 'package:mobic_cover/component/common_sizebox.dart';
import 'package:mobic_cover/component/common_text.dart';
import 'package:mobic_cover/constant/app_colors.dart';
import 'package:mobic_cover/constant/app_string.dart';
import 'package:mobic_cover/constant/break_point.dart';
import 'package:mobic_cover/model/drawer_list_model.dart';

class CommonBottomBarWidget extends StatelessWidget {
  const CommonBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      // height: 400,
      padding: EdgeInsets.symmetric(vertical: 20),
      color: AppColors.blackColor,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          constraints: BoxConstraints(
            maxWidth: BreakPoint.appBarConstraints1092,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText.textBoldWeight600(
                text: BottomBarString.popularSearch,
                color: AppColors.whiteColor,
                fontSize: 15.5,
              ),
              Wrap(
                children: [],
              ),
              20.SizedBoxHeight(),
              if (size.width > BreakPoint.appBarBreak840)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: CompanyWidget()),
                    20.SizedBoxWidth(),
                    Expanded(child: ContactUsWidget()),
                    20.SizedBoxWidth(),
                    Expanded(child: CustomerServiceWidget()),
                    20.SizedBoxWidth(),
                    Expanded(child: WarehouseAddressWidget())
                  ],
                ),
              if (!(size.width > BreakPoint.appBarBreak840))
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CompanyWidget(),
                    40.SizedBoxHeight(),
                    ContactUsWidget(),
                    40.SizedBoxHeight(),
                    CustomerServiceWidget(),
                    40.SizedBoxHeight(),
                    WarehouseAddressWidget()
                  ],
                ),
              50.SizedBoxHeight(),
              Row(
                children: [
                  /// CONTACT US
                  InkWell(
                    onTap: () {},
                    child: CommonText.textBoldWeight500(
                      text: AppBarString.contactUs.toUpperCase(),
                      color: AppColors.greyF7F7F7,
                      fontSize: 13,
                    ),
                  ),

                  20.SizedBoxWidth(),

                  /// FAQS
                  InkWell(
                    onTap: () {},
                    child: CommonText.textBoldWeight500(
                      text: AppBarString.faqs.toUpperCase(),
                      color: AppColors.greyF7F7F7,
                      fontSize: 13,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  /// COMPANY WIDGET

  CompanyWidget() {
    List<DrawerListModel> menuList = [
      DrawerListModel(name: 'About Us'),
      DrawerListModel(name: 'Privacy Policy'),
      DrawerListModel(name: 'Terms & Condition'),
      DrawerListModel(name: 'Payment & Returns'),
      DrawerListModel(name: 'Printing Terms & Cancellation Policy'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText.textBoldWeight600(
          text: BottomBarString.company,
          color: AppColors.whiteColor,
          fontSize: 15.5,
        ),
        15.SizedBoxHeight(),
        Container(
          height: 3,
          width: 50,
          color: AppColors.grey525151,
        ),
        25.SizedBoxHeight(),
        ListView.separated(
          shrinkWrap: true,
          itemCount: menuList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: CommonText.textBoldWeight400(
                  text: menuList[index].name.toString(),
                  color: AppColors.whiteColor,
                  fontSize: 14,
                  height: 1.5,
                  maxLine: 2),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 0.7,
              width: 50,
              color: AppColors.grey525151.withOpacity(0.5),
            );
          },
        )
      ],
    );
  }

  /// CONTACT US WIDGET
  ContactUsWidget() {
    List<DrawerListModel> menuList = [
      DrawerListModel(name: 'Track Your Order'),
      DrawerListModel(name: 'Check Out'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText.textBoldWeight600(
          text: BottomBarString.contactUs,
          color: AppColors.whiteColor,
          fontSize: 15.5,
        ),
        15.SizedBoxHeight(),
        Container(
          height: 3,
          width: 50,
          color: AppColors.grey525151,
        ),
        25.SizedBoxHeight(),
        Row(
          children: [
            Icon(
              Icons.email_outlined,
              color: AppColors.whiteColor,
              size: 18,
            ),
            10.SizedBoxWidth(),
            CommonText.textBoldWeight600(
              text: BottomBarString.email,
              color: AppColors.whiteColor,
              fontSize: 15.5,
            ),
          ],
        ),
        10.SizedBoxHeight(),
        CommonText.textBoldWeight400(
          text: 'help@mobic.in',
          color: AppColors.whiteColor,
          fontSize: 14,
        ),
        20.SizedBoxHeight(),
        CommonText.textBoldWeight400(
          text: BottomBarString.guaranteedText,
          color: AppColors.whiteColor,
          fontSize: 15.5,
          height: 1.5,
        ),
        25.SizedBoxHeight(),
        Row(
          children: [
            Icon(
              Icons.access_time_outlined,
              color: AppColors.whiteColor,
              size: 18,
            ),
            10.SizedBoxWidth(),
            CommonText.textBoldWeight600(
              text: BottomBarString.workingText,
              color: AppColors.whiteColor,
              fontSize: 15.5,
            ),
          ],
        ),
        10.SizedBoxHeight(),
        CommonText.textBoldWeight400(
          text: 'Mon – Sat / 9:30AM – 6:30PM',
          color: AppColors.whiteColor,
          fontSize: 14,
        ),
      ],
    );
  }

  /// COMPANY WIDGET
  CustomerServiceWidget() {
    List<DrawerListModel> menuList = [
      DrawerListModel(name: 'Track Your Order'),
      DrawerListModel(name: 'Check Out'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText.textBoldWeight600(
          text: BottomBarString.customerService,
          color: AppColors.whiteColor,
          fontSize: 15.5,
        ),
        15.SizedBoxHeight(),
        Container(
          height: 3,
          width: 50,
          color: AppColors.grey525151,
        ),
        25.SizedBoxHeight(),
        ListView.separated(
          shrinkWrap: true,
          itemCount: menuList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: CommonText.textBoldWeight400(
                text: menuList[index].name.toString(),
                color: AppColors.whiteColor,
                fontSize: 14,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 0.7,
              width: 50,
              color: AppColors.grey525151.withOpacity(0.5),
            );
          },
        )
      ],
    );
  }

  /// REGISTERED WAREHOUSE ADDRESS WIDGET
  WarehouseAddressWidget() {
    List<DrawerListModel> menuList = [
      DrawerListModel(name: 'Track Your Order'),
      DrawerListModel(name: 'Check Out'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText.textBoldWeight600(
          text: BottomBarString.wareHouseAddress,
          color: AppColors.whiteColor,
          maxLine: 2,
          height: 1.7,
          fontSize: 15.5,
        ),
        15.SizedBoxHeight(),
        Container(
          height: 3,
          width: 50,
          color: AppColors.grey525151,
        ),
        25.SizedBoxHeight(),
        CommonText.textBoldWeight400(
          text:
              '23-24 4th Floor Girivar Industrial \nPark, Saniya Hemad Village, Near \nSaroli, Surat-kadodara Road, Surat, \nGujarat – 395006',
          color: AppColors.whiteColor,
          maxLine: 5,
          height: 2,
          fontSize: 14,
        ),
      ],
    );
  }
}
