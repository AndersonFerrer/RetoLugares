import 'package:reto_lugares/modal/lugar_model.dart';
import 'package:flutter/cupertino.dart';

class LugarFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Lugar lugar;
  LugarFormProvider(this.lugar);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
