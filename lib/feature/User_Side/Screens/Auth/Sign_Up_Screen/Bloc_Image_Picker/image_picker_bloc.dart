// import 'package:e_commerce/Components/Widgets/custom_image_Picker_widget.dart';
// import 'package:e_commerce/Export/e_commerce_export.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'bloc_image_picker_event.dart';
// import 'bloc_image_picker_state.dart';

// class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
//   ImagePickerBloc() : super(ImagePickerInitialState()) {
//     on<ImagePickerEvent>((event, emit) {
//       on<OnInitialEvent>((event, emit) {
//         emit.call(ImagePickerInitialState());
//       });

//       on((event, emit) {
//         ImagePickerService.getImageFromSource(
//           ImageSource.gallery,
//         ).then((image) {
//           emit.call(ImagePickerLoadedState(imagePath: image));
//         });
//       });
//     });
//   }
// }
