import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda_clone/Controller/Navigator/Routes.dart';
import 'package:food_panda_clone/Utility/helpers/helping_function.dart';
import 'package:food_panda_clone/features/admin/models/food_item_model.dart';
import 'package:food_panda_clone/features/dashBoard/screens/HomePageComponents/Drawer/drawer_widget.dart';
import 'package:food_panda_clone/features/dashBoard/screens/HomePageComponents/searchBarWidget.dart';
// import 'package:food_panda_clone/Screens/Admin/Model/food_item_model.dart';
// import 'package:food_panda_clone/Screens/dashBoard/HomePageComponents/CategoryListViewWidget.dart';
// import 'package:food_panda_clone/Screens/dashBoard/HomePageComponents/TopBarNavigation/bargarCategWidget.dart';
// import 'package:food_panda_clone/Screens/dashBoard/HomePageComponents/TopBarNavigation/topbarNavigation.dart';
// import 'package:food_panda_clone/Screens/dashBoard/HomePageComponents/searchBarWidget.dart';
// import 'package:food_panda_clone/Screens/dashBoard/HomePageComponents/Drawer/drawer_widget.dart';
// import 'package:food_panda_clone/Screens/dashBoard/HomePageComponents/serviceWidget.dart';

// import '../../../Screens/dashBoard/HomePageComponents/Drawer/drawer_widget.dart';
// import '../../admin/Model/food_item_model.dart';
// import '../HomePageComponents/TopBarNavigation/bargarCategWidget.dart';
// import '../HomePageComponents/TopBarNavigation/topbarNavigation.dart';
// import '../HomePageComponents/searchBarWidget.dart';
import 'HomePageComponents/TopBarNavigation/CategLoadWidget.dart';
import 'HomePageComponents/TopBarNavigation/topbarNavigation.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.currentLocation});
  final String currentLocation;
  static const String pageName = '/DashboardPage';
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  FirebaseFirestore instance = FirebaseFirestore.instance;
  var burger;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    // _getBurgersData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Random random = Random();
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double widthOfDrawer = width * 0.8;
    double drawerWidth = 0.5;

    // print(
    //     '>>>>>>>>>>>> ${ModalRoute.of(context)!.settings.arguments.toString()}');

    // Size Of Services Containers
    double widthOfServiceContainer = width * 0.43;
    double heightOfServiceLargeContainer = height * 0.3;
    double heightOfServiceLittleContainer = height * 0.2;

    // Size Of Category Containers
    double widthOfCategoryListView = width;
    double heightOfCategoryListView = height * 0.3;

    return Scaffold(
        // DRAWER
        drawer: const DrawerWidgets(),
        //  APPBAR
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Row(children: [
            // TEXT Of APPBAR...............................................
            Column(
              children: [
                // TEXT
                SizedBox(
                    width: width * 0.5,
                    child: const FittedBox(
                        child: Text(
                      'Selected Location ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ))),
                // TEXT
                SizedBox(
                    width: width * 0.6,
                    child: FittedBox(
                        child: Text(
                      widget.currentLocation,
                      style: const TextStyle(color: Colors.white),
                    )))
              ],
            ),
            const Spacer(),
            //  ICON for SHOPE Items
            SizedBox(
                width: width * 0.1,
                child: IconButton(
                    onPressed: () {
                      THelpingFunction.navigatWithRouteName(
                          context: context,
                          routName: RoutesName.cartedProductPage);
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    )))
          ]),
        ),

        // .............................BODY
        body: Center(
          child: Column(
            children: [
              //
              Container(
                width: width,
                color: Colors.pink,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.01),
                    child: SearchBarWidget(
                      onTape: () {},
                    ),
                  ),
                ),
              ),

              // ..
              DashboardTopBarNavigation(controller: _tabController),

              // ...

              Expanded(
                child: TabBarView(controller: _tabController, children: const [
                  CategoryLoadWidget(collectionName: 'Burger'),
                  CategoryLoadWidget(collectionName: 'Pizza'),
                  CategoryLoadWidget(collectionName: 'Biryani'),
                ]),
              )
            ],
          ),
        )

        // ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????/
        //  CustomScrollView(slivers: [
        //   //...................................................................... SEARCHBAR
        //   SliverAppBar(
        //     floating: true,
        //     snap: true,
        //     automaticallyImplyLeading: false,
        //     backgroundColor: Colors.pink,
        //     actions: [
        //       Padding(
        //           padding: EdgeInsets.only(right: width * 0.05),
        //           child: SearchBarWidget(
        //             onTape: () {},
        //           ))
        //     ],
        //   ),
        //   // ....................................................................
        //   // ..................................................................... Services Containers

        //   SliverToBoxAdapter(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         // ...............................................................First Row For SERVICE CONTAINER
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             ServiceContainerWidget(
        //                 imageOfServiceContainer: 'assets/images/boky.jpeg',
        //                 textForServiceName: 'Food Delivery',
        //                 textForServiceDiscription: 'Order food you love',
        //                 widthOfContainer: widthOfServiceContainer,
        //                 heightOfContainer: heightOfServiceLargeContainer),
        //             ServiceContainerWidget(
        //                 imageOfServiceContainer: 'assets/images/penboy.jpeg',
        //                 textForServiceName: 'Shope',
        //                 textForServiceDiscription: 'Top brands to your door',
        //                 widthOfContainer: widthOfServiceContainer,
        //                 heightOfContainer: heightOfServiceLargeContainer)
        //           ],
        //         ),
        //         // ...............................................................Second Row For SERVICE CONTAINER
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             ServiceContainerWidget(
        //                 imageOfServiceContainer: 'assets/images/book.jpeg',
        //                 textForServiceName: 'Dine-in',
        //                 textForServiceDiscription: 'Go to eat for 25%off',
        //                 heightOfContainer: heightOfServiceLittleContainer,
        //                 widthOfContainer: widthOfServiceContainer),
        //             ServiceContainerWidget(
        //                 imageOfServiceContainer: 'assets/images/books.jpeg',
        //                 textForServiceName: 'Pick-up',
        //                 textForServiceDiscription: 'Self-collect for 50%off',
        //                 heightOfContainer: heightOfServiceLittleContainer,
        //                 widthOfContainer: widthOfServiceContainer),
        //           ],
        //         ),

        //         //................................................................ Category ListView

        //         CategrizedListView(
        //             widthOfCategory: widthOfCategoryListView,
        //             heightOfCategory: heightOfCategoryListView,
        //             textForCategory: 'Popular restaurants')
        //       ],
        //     ),
        //   )
        // ]),
        );
  }
}

/**
 * 
 * CustomScrollView(slivers: [
        SliverAppBar(
            centerTitle: true,
            title: Text('Slivers'),
            expandedHeight: 200,
            pinned: false,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
              'assets/images/Backend.png',
              fit: BoxFit.fill,
            )),
            backgroundColor: Colors.blue),
        SliverFillViewport(
            delegate: SliverChildBuilderDelegate(
                childCount: 20,
                (context, index) => Container(
                      color: Color.fromARGB(
                          random.nextInt(255),
                          random.nextInt(255),
                          random.nextInt(255),
                          random.nextInt(255)),
                    ))),
        SliverToBoxAdapter(
          child: SizedBox(
              height: 100,
              child: Image.asset(
                'assets/images/Backend.png',
                fit: BoxFit.fitHeight,
              )),
        ),
        SliverGrid.builder(
          itemCount: 50,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) => Container(
            color: Color.fromARGB(random.nextInt(255), random.nextInt(255),
                random.nextInt(255), random.nextInt(255)),
          ),
        ),
        SliverFillRemaining(
          child: Container(
            color: Colors.black,
          ),
        ),
        SliverList.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(list[index]),
          ),
        ),
      ]),
 */
