import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobic_cover/component/common_sizebox.dart';
import 'package:mobic_cover/component/common_svg_image.dart';
import 'package:mobic_cover/component/common_text.dart';
import 'package:mobic_cover/component/common_text_field.dart';
import 'package:mobic_cover/constant/app_colors.dart';
import 'package:mobic_cover/constant/app_images.dart';
import 'package:mobic_cover/constant/app_string.dart';
import 'package:mobic_cover/constant/break_point.dart';
import 'package:mobic_cover/model/drawer_list_model.dart';

class CommonStartUpWidget extends StatelessWidget {
  final Widget body;
  CommonStartUpWidget({super.key, this.body = const SizedBox()});
  RxBool showMorOption = false.obs;
  RxBool showSearchField = false.obs;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var appBarBreakPoint = size.width > BreakPoint.appBarBreak840;
    if (appBarBreakPoint) {
      showSearchField = false.obs;
    }
    return Scaffold(
      drawer: DrawerWidget(size, context),
      body: Column(
        children: [
          /// FREE SHIPPING HEADER
          TopHeader(size, appBarBreakPoint),

          Expanded(
            child: NestedScrollView(
              physics: NeverScrollableScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  /// MAIN APP BAR
                  Obx(() {
                    return SliverAppBar(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      expandedHeight: 0,
                      toolbarHeight: showSearchField.value ? 130 : 60,
                      automaticallyImplyLeading: false,
                      floating: false,
                      pinned: true,
                      title: Center(
                        child: AnimatedContainer(
                          height: showSearchField.value ? 130 : 60,
                          color: AppColors.whiteColor,
                          constraints: BoxConstraints(
                            maxWidth: BreakPoint.appBarConstraints1092,
                          ),
                          duration: Duration(milliseconds: 600),
                          child: showSearchField.value
                              ? Column(
                                  children: [
                                    15.SizedBoxHeight(),
                                    MainAppBarHeader(
                                        appBarBreakPoint, context, size),
                                    25.SizedBoxHeight(),
                                    SearchWidget(),
                                  ],
                                )
                              : MainAppBarHeader(
                                  appBarBreakPoint, context, size),
                        ),
                      ),
                    );
                  })
                ];
              },
              body: body,
            ),
          ),
        ],
      ),
    );
  }

  /// MAIN HEADER
  Row MainAppBarHeader(bool appBarBreakPoint, BuildContext context, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!appBarBreakPoint)
          Row(
            children: [
              InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: AppColors.blackColor,
                  size: 20,
                ),
              ),
              20.SizedBoxWidth(),
              InkWell(
                onTap: () {
                  showSearchField.value = !showSearchField.value;
                },
                child: CommonSvgImage.commonSvgImage(
                  imagePath: showSearchField.value
                      ? AppImages.close
                      : AppImages.search,
                  height: 15,
                  width: 15,
                  color: AppColors.blackColor,
                ),
              )
            ],
          ),

        /// LOGO
        InkWell(
          onTap: () {},
          child: CommonText.textBoldWeight700(
            text: AppBarString.appName,
            color: AppColors.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        if (appBarBreakPoint) 50.SizedBoxWidth(),

        /// CATEGORIES
        if (appBarBreakPoint) CategoriesWidget(),
        if (appBarBreakPoint) Spacer(),

        ///  SEARCH FIELD
        if (appBarBreakPoint)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: 150,
              child: SearchWidget(),
            ),
          ),
        if (appBarBreakPoint) 15.SizedBoxWidth(),

        /// WALLET
        WalletWidget(size, appBarBreakPoint)
      ],
    );
  }

  /// FREE SHIPPING HEADER
  Container TopHeader(Size size, bool appBarBreakPoint) {
    return Container(
      height: 25,
      width: size.width,
      color: AppColors.blackColor,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: BreakPoint.appBarConstraints1092,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// FREE SHIPPING TEXT
              CommonText.textBoldWeight400(
                text: AppBarString.freeShippingText,
                color: AppColors.whiteColor,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
              if (appBarBreakPoint) Spacer(),
              if (appBarBreakPoint)
                Row(
                  children: [
                    /// CONTACT US
                    InkWell(
                      onTap: () {},
                      child: CommonText.textBoldWeight400(
                        text: AppBarString.contactUs,
                        color: AppColors.greyF7F7F7,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    10.SizedBoxWidth(),
                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.grey.shade800,
                    ),
                    10.SizedBoxWidth(),

                    /// FAQS
                    InkWell(
                      onTap: () {},
                      child: CommonText.textBoldWeight400(
                        text: AppBarString.faqs,
                        color: AppColors.greyF7F7F7,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
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

  /// CATEGORIES MOBILE COVER, MORE, OFFER ETC...
  Row CategoriesWidget() {
    return Row(
      children: [
        /// MOBILE COVER
        InkWell(
          onTap: () {},
          child: CommonText.textBoldWeight400(
            text: AppBarString.mobileCover.toUpperCase(),
            color: AppColors.blackColor,
            fontSize: 13,
          ),
        ),
        15.SizedBoxWidth(),

        /// MORE
        MouseRegion(
          onEnter: (event) => showMorOption.value = true,
          onExit: (event) => showMorOption.value = false,
          child: InkWell(
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonText.textBoldWeight400(
                  text: AppBarString.more.toUpperCase(),
                  color: AppColors.blackColor,
                  fontSize: 13,
                ),
                3.SizedBoxWidth(),
                CommonSvgImage.commonSvgImage(
                  imagePath: AppImages.arrow_down,
                  height: 7,
                  width: 7,
                  color: AppColors.grey939292,
                ),
              ],
            ),
          ),
        ),

        15.SizedBoxWidth(),

        /// OFFER
        InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CommonText.textBoldWeight400(
                    text: AppBarString.offer.toUpperCase(),
                    color: AppColors.blackColor,
                    fontSize: 13,
                  ),
                  3.SizedBoxWidth(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColors.redB20000,
                    ),
                    // margin: EdgeInsets.only(bottom: 2),
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: CommonText.textBoldWeight500(
                      text: AppBarString.hot.toUpperCase(),
                      color: AppColors.whiteColor,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///  SEARCH FIELD
  SearchWidget() {
    return CommonTextField(
      controller: TextEditingController(),
      textFieldSize: showSearchField.value ? 14 : 10,
      borderRadius: showSearchField.value ? 0 : 100,
      filled: showSearchField.value ? false : true,
      fillColor: AppColors.greyF7F7F7,
      enabledBorderColor:
          showSearchField.value ? AppColors.blackColor : AppColors.greyE8DEDE,
      focusedBorderColor:
          showSearchField.value ? AppColors.blackColor : AppColors.greyE8DEDE,
      hintText: 'Search...',
      inputTextSize: 15,
    );
  }

  /// WALLET WIDGET
  WalletWidget(Size size, bool appBarBreakPoint) {
    RxBool isHover = false.obs;
    return MouseRegion(
      onEnter: (event) => isHover.value = true,
      onExit: (event) => isHover.value = false,
      child: InkWell(
        onTap: () {},
        child: Obx(
          () {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              decoration: BoxDecoration(
                color:
                    isHover.value ? AppColors.blackColor : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.blackColor),
              ),
              child: Row(
                children: [
                  if (appBarBreakPoint)
                    CommonText.textBoldWeight500(
                      text: '₹ 0.0',
                      color: isHover.value
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                      fontSize: 14,
                    ),
                  if (appBarBreakPoint) 10.SizedBoxWidth(),
                  CommonSvgImage.commonSvgImage(
                    imagePath: AppImages.bag,
                    height: 17,
                    width: 17,
                    color: isHover.value
                        ? AppColors.whiteColor
                        : AppColors.blackColor,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// OPEN DRAWER WIDGET
  DrawerWidget(Size size, BuildContext context) {
    List<DrawerListModel> menuList = [
      DrawerListModel(name: 'MOBILE COVER', type: AppBarString.popular),
      DrawerListModel(
          name: 'SOFT SILICON PRINTED COVER', type: AppBarString.newt),
      DrawerListModel(name: 'PREMIUM GLASS CASE', type: AppBarString.newt),
      DrawerListModel(name: 'SOFT BLACK COVER', type: ''),
      DrawerListModel(name: 'SNAP CASE', type: ''),
      DrawerListModel(name: 'MOBILE ACCESSORIES', type: ''),
      DrawerListModel(name: 'ACRYLIC PHOTO FRAME', type: AppBarString.newt),
      DrawerListModel(name: 'PERFUMES', type: AppBarString.newt),
      DrawerListModel(name: 'POWER BANK', type: AppBarString.newt),
      DrawerListModel(name: 'MOUSEPAD', type: AppBarString.newt),
      DrawerListModel(name: 'PHONE GRIPS', type: AppBarString.popular),
      DrawerListModel(name: 'PLAIN T-SHIRT FOR MAN', type: AppBarString.newt),
      DrawerListModel(name: 'KEYCHAIN', type: ''),
      DrawerListModel(name: 'MUG', type: AppBarString.newt),
      DrawerListModel(name: 'UMBRELLA', type: ''),
      DrawerListModel(name: 'OFFER', type: AppBarString.hot),
      DrawerListModel(name: 'TRACK YOUR ORDER', type: ''),
    ];
    RxInt isHover = (-1).obs;

    return Container(
      height: size.height,
      width: 300,
      color: AppColors.whiteColor,
      padding: EdgeInsets.only(top: 40),
      child: ListView.separated(
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          return MouseRegion(
            onEnter: (event) => isHover.value = index,
            onExit: (event) => isHover.value = -1,
            child: InkWell(
              hoverColor: Colors.grey.shade200,
              onTap: () {
                Scaffold.of(context).closeDrawer();
              },
              child: Obx(
                () {
                  return Container(
                    height: 50,
                    width: 300,
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    color: isHover.value == index
                        ? AppColors.greyF7F7F7
                        : AppColors.transparent,
                    child: Row(
                      children: [
                        CommonText.textBoldWeight400(
                          text: menuList[index].name!.toString(),
                          color: AppColors.blackColor,
                          fontSize: 13,
                        ),
                        3.SizedBoxWidth(),
                        if (menuList[index].type!.toString().isNotEmpty)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: menuList[index].type!.toString() ==
                                      AppBarString.popular
                                  ? AppColors.green7A9C59
                                  : menuList[index].type!.toString() ==
                                          AppBarString.hot
                                      ? AppColors.redB20000
                                      : AppColors.blackColor,
                            ),
                            margin: EdgeInsets.only(bottom: 2),
                            padding: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            child: CommonText.textBoldWeight500(
                              text: menuList[index].type!.toString(),
                              color: AppColors.whiteColor,
                              fontSize: 10,
                            ),
                          )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            width: 300,
            height: 0.5,
            color: Colors.grey.shade100,
          );
        },
      ),
    );
  }
}
