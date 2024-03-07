part of 'bloc_image_picker_bloc.dart';

@immutable
sealed class BlocImagePickerEvent {}

class OnInitialModeEvent extends BlocImagePickerEvent {}

class OnCameraModeEvent extends BlocImagePickerEvent {}

class OnGalleryModeEvent extends BlocImagePickerEvent {}
