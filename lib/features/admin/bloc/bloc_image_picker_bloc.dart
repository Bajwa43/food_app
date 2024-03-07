import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:food_panda_clone/Bloc/BlocOfMap/_bloc.dart';
import 'package:food_panda_clone/services/Imagepicker/ImagePicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'bloc_image_picker_event.dart';
part 'bloc_image_picker_state.dart';

class BlocImagePickerBloc
    extends Bloc<BlocImagePickerEvent, BlocImagePickerState> {
  BlocImagePickerBloc() : super(ImagePickerInitialState()) {
    on<OnInitialModeEvent>((event, emit) => emit(ImagePickerInitialState()));

    on<OnGalleryModeEvent>((event, emit) =>
        ImagePickerService.getImageFromSource(ImageSource.gallery)
            .then((image) => emit(GalleryLoadedState(imagePath: image))));

    on<OnCameraModeEvent>((event, emit) async {
      await ImagePickerService.getImageFromSource(ImageSource.camera)
          .then((image) => emit(CameraLoadedState(imagePath: image)));
    });
  }
}
