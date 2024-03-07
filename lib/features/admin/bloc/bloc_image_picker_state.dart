part of 'bloc_image_picker_bloc.dart';

@immutable
sealed class BlocImagePickerState {}

final class ImagePickerInitialState extends BlocImagePickerState {}

final class GalleryLoadedState extends BlocImagePickerState {
  XFile? imagePath;
  GalleryLoadedState({required this.imagePath});
}

final class CameraLoadedState extends BlocImagePickerState {
  XFile? imagePath;
  CameraLoadedState({required this.imagePath});
}
