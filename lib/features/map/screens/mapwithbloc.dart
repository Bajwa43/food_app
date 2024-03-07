import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda_clone/Widgets/customWidgets.dart';
import 'package:food_panda_clone/features/dashBoard/screens/dashboard.dart';
// import 'package:food_panda_clone/Bloc/BlocOfMapType/_bloc.dart';
// import 'package:food_panda_clone/Bloc/BlocOfMapType/_state.dart';
// import 'package:food_panda_clone/Screens/dashBoard/dashboard.dart';
import 'package:food_panda_clone/features/map/bloc/BlocOfMap/_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../../../Bloc/BlocOfMap/_bloc.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});
  static const String pageName = '/GoogleMapPage';

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  // LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  // LatLng destination = LatLng(37, -100);

  List<LatLng> polylineCordinate = [];
  final LatLng _currentLocation = const LatLng(0, 0);
  MapType mapType = MapType.normal;

  // late TextEditingController _textControlerForGooglePaces;

  @override
  void initState() {
    super.initState();

    // _textControlerForGooglePaces = TextEditingController();

    // HelperMethods.getPolylinePoints(
    //     startCordinate: sourceLocation, endCordinate: destination)
    //     .then((value) => polylineCordinate = value);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double widthOfSelectionLocationbtn = width * 0.5;
    double heightOfSelectionLocationbtn = height * 0.07;

    // context.read<LocationBlocClass>().add(OnMarkerTap(_currentLocation));
    print('CURRENT LOCATION Is : 1----> $_currentLocation');

    return Scaffold(
      body: BlocBuilder<LocationBlocClass, LocationStateClass>(
        builder: (context, state) {
          print('Stateeeeeeeeeeeeeeeeeeeeeeeeeee$state');
          switch (state.runtimeType) {
            case InitialState:
              return const Center(child: CircularProgressIndicator());

            default:
              return Stack(children: [
                // GOOGLE MAP WIDGET................

                GoogleMap(
                    mapType: mapType,
                    onMapCreated: BlocProvider.of<LocationBlocClass>(context)
                        .onMapController,
                    initialCameraPosition:
                        CameraPosition(target: _currentLocation, zoom: 3),
                    // polylines: {
                    //     Polyline(
                    //       points: polylineCordinate,
                    //       polylineId: PolylineId('Route'),
                    //       color: Colors.blue,
                    //       endCap: Cap.roundCap,
                    //       jointType: JointType.round,
                    //       startCap: Cap.roundCap,
                    //       zIndex: 50,
                    //     ),
                    //   },
                    markers: {
                      Marker(
                          // draggable: true,
                          rotation: 5,
                          markerId: const MarkerId('_currentId'),
                          icon: BitmapDescriptor.defaultMarker,
                          position:
                              (state as LocationLoadedState).currentLocation,
                          onTap: () {
                            // BlocProvider.of<LocationBlocClass>(context)
                            //     .add(OnMarkerTap(_currentLocation));
                          },
                          infoWindow:
                              // InfoWindow(title: (state as LoadedState).address)
                              InfoWindow(title: (state).address)),
                      // Marker(
                      //     markerId: const MarkerId('_source'),
                      //     draggable: true,
                      //     onTap: () => const Text('sourceLocation'),
                      //     icon: BitmapDescriptor.defaultMarker,
                      //     position: sourceLocation),
                      // Marker(
                      //     // infoWindow: InfoWindow(title: addressOfDestination),
                      //     markerId: const MarkerId('_destination'),
                      //     icon: BitmapDescriptor.defaultMarkerWithHue(5),
                      //     position: destination),
                    }),

                //.......................................................... SECOND STACK LAWER ................

                // .............................................................MapType Changed Button
                Padding(
                  padding: EdgeInsets.all(width * 0.1),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton.outlined(
                        tooltip: 'MapType',
                        color: Colors.white,
                        onPressed: () {},
                        icon: const AnimatedCrossFade(
                          firstChild: Icon(Icons.maps_home_work_outlined),
                          secondChild: Icon(Icons.map),
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(microseconds: 500),
                          crossFadeState: CrossFadeState.showFirst,
                        )),
                  ),
                ),

                //............................................................ Location Selected BUTTON

                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.04),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        clipBehavior: Clip.antiAlias,
                        width: widthOfSelectionLocationbtn,
                        height: heightOfSelectionLocationbtn,
                        decoration: BoxDecoration(
                            // color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(height * 0.02)),
                        child: TWidgets.inkWellBtn(
                            context: context,
                            fun: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text((state).address.toString())));

                              Navigator.of(context).pushNamed(
                                  DashboardPage.pageName,
                                  arguments: state.address.toString());
                              // print('.............>  ${state.address}');
                            },
                            btnText: 'Location Selected')
                        //  Material(
                        //   color: Colors.red,
                        //   child: InkWell(
                        //     onTap: () {
                        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //           content: Text((state).address.toString())));

                        //       Navigator.of(context).pushNamed(
                        //           DashboardPage.pageName,
                        //           arguments: state.address.toString());
                        //       print('.............>  ${state.address}');
                        //     },
                        //     child: Center(
                        //         child: FittedBox(
                        //       child: Text(
                        //         'Location Selected',
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: height * 0.025,
                        //             fontWeight: FontWeight.w500),
                        //       ),
                        //     )),
                        //   ),
                        // ),
                        ),
                  ),
                ),
              ]);
          }
        },
      ),
    );
  }
}


/**
 * 
 * 
 * 
 * 
 *    // // GOOGLE Places MAP FLUTTER

                // Container(
                //   clipBehavior: Clip.hardEdge,
                //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                //   child: GooglePlaceAutoCompleteTextField(
                //     // boxDecoration: BoxDecoration(color: Colors.white),
                //     textEditingController: _textControlerForGooglePaces,
                //     googleAPIKey: GOOGLE_API_KEY,
                //     inputDecoration: InputDecoration(
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20))),
                //     debounceTime: 800,
                //     isLatLngRequired: true,
                //     getPlaceDetailWithLatLng: (Prediction prediction) {
                //       print(
                //           'placeDetail >>>>>>>>>>>>>>>>>>>>>>>>>>: ${prediction.lat} ');
                //     },
                //     itemClick: (Prediction prediction) {
                //       _textControlerForGooglePaces.text = prediction.description!;
                //       _textControlerForGooglePaces.selection =
                //           TextSelection.fromPosition(
                //               TextPosition(offset: prediction.description!.length));
                //     },
                //     // if we want to make custom list item builder
                //     itemBuilder: (context, index, Prediction prediction) {
                //       return Container(
                //         padding: EdgeInsets.all(10),
                //         child: Row(
                //           children: [
                //             const Icon(Icons.location_on),
                //             SizedBox(
                //               width: 3,
                //             ),
                //             Expanded(child: Text("${prediction.description ?? ""}"))
                //           ],
                //         ),
                //       );
                //     },

                //     // if you want to add seperator between list items
                //     seperatedBuilder: Divider(),
                //     // want to show close icon
                //     isCrossBtnShown: true,
                //   ),
                // ),





                  // // ...............................................................................

  // // GET_LOCATION_UPDATE this Method For While Application open if Location Permission in Already Garnted
  // // Than Map show its Live Loocation in Map
  // // If LocationPermission is  denied (Off Mean Not On) RequestPermission send on Screen For Granted
  // //Than LiveLocation Acccess of User By On Listen The Values And Change there Posiotion of Marks On That Base

//   Future<void> getLocationUpdate(
//       Completer<GoogleMapController> _mapController) async {
//     // bool serviceEnable;
//     location.PermissionStatus permissionStatus;
//     // serviceEnable = await _locationControler.serviceEnabled();
//     // if (serviceEnable) {
//     //   serviceEnable = await _locationControler.requestService();
//     // } else {
//     //   return;
//     // }

// // ..............

//     permissionStatus = await _locationControler.hasPermission();
//     if (permissionStatus == location.PermissionStatus.denied) {
//       permissionStatus = await _locationControler.requestPermission();
//       if (permissionStatus == location.PermissionStatus.granted) {}
//     }

//     _locationControler.onLocationChanged
//         .listen((location.LocationData currentData) async {
//       setState(() {
//         _currentLocation =
//             LatLng(currentData.latitude ?? 100, currentData.longitude ?? 100);
//         // print('CURRENT LOCATION Is :2 ----> $_currentLocation');
//         print(
//             '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$_currentLocation');
//       });

//       await HelperMethods.onCameraPosition(_currentLocation, _mapController);
//       print('CURRENT LOCATION Is : 3 ----> $_currentLocation');
//     });
//   }

//  ............................................................................ Convert Latlng in Adres
// GET CORDINATE FROM ADDRESS

// Future<LatLng?> getLocationFromAddress(String address) async {
//   locationFromAddress(address).then((List<Location> location) {
//     LatLng coordinate = LatLng(location[0].latitude, location[0].longitude);
//     return coordinate;
//   });
// }
 */