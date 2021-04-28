
import 'package:flutter_language_app/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewWishVM extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();
//  final AppDatabase database = locator<AppDatabase>();

  void onFutureEror(dynamic error, Object key) {
    return _snackbarService.showSnackbar(message: error.toString());
  }



  Future<bool> changeWishListState() async {
    if (!isBusy) {
      setError(null);
      setBusy(true);
      notifyListeners();

      bool result = false;


      //
      if (result != null ) {
        setBusy(false);
        return true;
      } else {
        setBusy(false);
        setError("error in result");
        print("error");
        return false;
      }
    }
    return false;
  }

  Future<bool> removeFromWish(int id) async {
    // prepareRemoveFromWish(id);

    return await 25 > 0;
  }

  Future<bool> onLikeButtonTapped(
      bool isLiked, NewWishVM model, int productId) async {
    return isLiked;
  }

// Future<bool> changeWishState(bool isBooked, int productId) async {
//   if (!isBusy) {
//     setBusy(true);
//     notifyListeners();
//
//     if (!isBooked) {
//       var result = await addNewWish(productId);
//
//       setBusy(true);
//       notifyListeners();
//       return result;
//     } else {
//       var result = await removeFromWish(productId);
//
//       setBusy(true);
//       notifyListeners();
//       return result;
//     }
//   }
//   return isBooked;
// }
}
