import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda_clone/Widgets/customWidgets.dart';
import 'package:food_panda_clone/features/admin/models/food_item_model.dart';
// import 'package:food_panda_clone/Bloc/BlocOfMap/_bloc.dart';
// import 'package:food_panda_clone/Screens/Admin/Model/food_item_model.dart';
// import 'package:food_panda_clone/Screens/Admin/Widgets/dropDown_button.dart';
// import 'package:food_panda_clone/Screens/Admin/bloc/bloc_food_category_bloc.dart';
// import 'package:food_panda_clone/Screens/Admin/bloc/bloc_image_picker_bloc.dart';
import 'package:image_picker/image_picker.dart';

// import '../../../Widgets/TextFormWidget.dart';
// import '../Model/food_item_model.dart';
import '../bloc/bloc_food_category_bloc.dart';
import '../bloc/bloc_image_picker_bloc.dart';
import '../bloc/waiting_bloc.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});
  static const String pageName = '/AdminPage';

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late TextEditingController _itemNameController;
  late TextEditingController _itemPriceController;
  late TextEditingController _descriptionController;
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String categoryValue = 'Burger';
  XFile? image;

  final List<DropdownMenuItem> _items = const [
    DropdownMenuItem(
      value: 'Burger',
      child: Text('Burger'),
    ),
    DropdownMenuItem(value: 'Pizza', child: Text('Pizza')),
    DropdownMenuItem(value: 'Biryani', child: Text('Biryani')),
  ];

  @override
  void initState() {
    super.initState();
    _itemNameController = TextEditingController();
    _itemPriceController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _itemPriceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  //   Servises
  User? user = FirebaseAuth.instance.currentUser;
  _eventToGallery() {
    BlocProvider.of<BlocImagePickerBloc>(context).add(OnGalleryModeEvent());
  }

  _eventToCamera() {
    BlocProvider.of<BlocImagePickerBloc>(context).add(OnCameraModeEvent());
  }

  _eventToInitial() {
    BlocProvider.of<BlocImagePickerBloc>(context).add(OnInitialModeEvent());
  }

  _registerData() async {
    BlocProvider.of<WaitingBloc>(context).add(OnWaitingLoadedEvent());

    String urlCloudeImage;
    // formKey.currentState!.validate();

    // .........................

    final instance = FirebaseFirestore.instance;

    if (formKey.currentState!.validate()) {
      // ......................
      var ref = FirebaseStorage.instance.ref().child(
          'Food/$categoryValue/$categoryValue-${DateTime.now().toString()}');

      await ref.putFile(File(image!.path));
      urlCloudeImage = await ref.getDownloadURL();

      print('============================================>> $urlCloudeImage');

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Image Uploaded',
        ),
        duration: Duration(seconds: 1),
      ));

      // ....................
      FoodItemModel items = FoodItemModel(
          category: categoryValue,
          itemName: _itemNameController.text,
          itemPrice: _itemPriceController.text,
          description: _descriptionController.text,
          imageUrl: urlCloudeImage);

      var dateTime = DateTime.now().microsecondsSinceEpoch.toString();
      var doc =
          instance.collection(categoryValue).doc("${user!.uid} $dateTime");

      await doc.set(items.toMap()).then(
          (value) => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('SuccessFully'))),
          onError: (e) => log("Error booking appointment: $e"));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('State is Not Valid')));
    }

    BlocProvider.of<WaitingBloc>(context).add(OnWaitingInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //.................................................................... Container For Image SELECTION
            Container(
              height: height * 0.3,
              color: Colors.amber,
              child: BlocBuilder<BlocImagePickerBloc, BlocImagePickerState>(
                builder: (context, state) {
                  print('?????????? ${state.runtimeType}');
                  switch (state.runtimeType) {
                    // ......Initial Image
                    case ImagePickerInitialState:
                      return Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton.outlined(
                                onPressed: _eventToCamera,
                                tooltip: 'Camera',
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  size: (width + height) * 0.035,
                                )),
                            SizedBox(
                              width: width * 0.1,
                            ),
                            IconButton.outlined(
                                onPressed: _eventToGallery,
                                tooltip: 'Gallery',
                                icon: Icon(
                                  Icons.library_add,
                                  size: (width + height) * 0.035,
                                ))
                          ],
                        ),
                      );

                    // On Gallery State
                    case GalleryLoadedState:
                      {
                        print(
                            '>>>>>>>>>>>>IMAGE : ${(state as GalleryLoadedState).imagePath}');
                        image = state.imagePath;

                        return Stack(children: [
                          // image == null
                          // ? Text('Image is Null')
                          Center(
                              child: (state).imagePath == null
                                  ? const Text('No Image')
                                  : Image.file(
                                      File(image!.path),
                                      fit: BoxFit.cover,
                                    )),
                          // RESELECT IMAGE
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: IconButton.filledTonal(
                                  onPressed: _eventToInitial,
                                  icon: const Icon(Icons.image)))
                        ]);
                      }

                    //  On Camera Loaded State
                    case CameraLoadedState:
                      {
                        image = (state as CameraLoadedState).imagePath;

                        return Stack(
                          children: [
                            Center(
                              child: (state).imagePath == null
                                  ? const Text('No Image')
                                  : Image.file(File(image!.path),
                                      fit: BoxFit.cover),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: IconButton.filledTonal(
                                  onPressed: _eventToInitial,
                                  icon: const Icon(
                                    Icons.image,
                                  )),
                            )
                          ],
                        );
                      }
                    default:
                      return Center(child: Text('There No image : $state '));
                  }
                },
              ),
            ),
            // ................................................................... Getting Other Info About Item Related

            Padding(
                padding:
                    EdgeInsets.only(right: width * 0.08, top: height * 0.02),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Select :  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.045)),
                          // DROPDOWN BUTTON
                          BlocBuilder<BlocFoodCategoryBloc,
                              BlocFoodCategoryState>(
                            builder: (context, state) {
                              if (state is BlocFoodCategoryInitial) {
                                categoryValue = 'Burger';
                              } else {
                                categoryValue =
                                    (state as LoadedFoodCategoryState)
                                        .selectedCategory;
                              }
                              return DropdownButton(
                                value: categoryValue,
                                items: _items,
                                onChanged: (newValue) {
                                  BlocProvider.of<BlocFoodCategoryBloc>(context)
                                      .add(OnSelectCategoryEvent(
                                          selectCategory: newValue));
                                },
                                icon: const Icon(Icons.arrow_drop_down_circle),
                                iconSize: width * 0.06,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: width * 0.045),
                                underline: Container(
                                  height: 2,
                                  color: Colors.black,
                                ),
                              );
                            },
                          ),
                        ]))),

            SizedBox(
              height: height * 0.7,
              child: Form(
                key: formKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.025, bottom: height * 0.025),
                      child: SizedBox(
                        width: width * 0.9,
                        child: TWidgets.textformFieldWidget(
                            value: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return 'Enter Item Name';
                              }
                            },
                            context: context,
                            controller: _itemNameController,
                            lable: 'Item Name'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.025, bottom: height * 0.025),
                      child: SizedBox(
                        width: width * 0.9,
                        child: TWidgets.textformFieldWidget(
                            value: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return 'Enter Price';
                              }
                            },
                            context: context,
                            controller: _itemPriceController,
                            lable: 'item Price'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.025, bottom: height * 0.025),
                      child: SizedBox(
                        width: width * 0.9,
                        child: TWidgets.textformFieldWidget(
                            context: context,
                            controller: _descriptionController,
                            lable: 'Description'),
                      ),
                    ),

                    // ........................................................... Register THE DATA ON FIREBASE BUTTON
                    ElevatedButton.icon(
                        onPressed: _registerData,
                        icon: const Icon(Icons.send),
                        label: BlocBuilder<WaitingBloc, WaitingState>(
                          builder: (context, state) {
                            if (state is WaitingLoadedState) {
                              return const CircularProgressIndicator();
                            } else {
                              return Text(
                                '  Register  ',
                                style: TextStyle(fontSize: (width * 0.08)),
                              );
                            }
                          },
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
