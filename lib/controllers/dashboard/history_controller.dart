import 'package:get/get.dart';
import 'package:hamro_sadhan/models/order.dart';
import 'package:hamro_sadhan/repo/order_repo.dart';
import 'package:hamro_sadhan/widgets/custom_snackbar.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class HistoryController extends GetxController {
  RxList<Order> orderDetails = RxList();
  RxBool loading = false.obs;

  final cancelLoading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  @override
  void onInit() {
    getAllOrders();
    super.onInit();
  }

  getAllOrders() async {
    loading.value = true;
    await OrderRepo.getAllOrders(
      onSuccess: (orders) {
        orderDetails.clear();
        loading.value = false;
        orderDetails.addAll(orders);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Order", message: message);
      }),
    );
  }

  void cancelBooking(String id) async {
    cancelLoading.show(message: "Please wait");

    await OrderRepo.cancelBooking(
      orderId: int.parse(id),
      onSuccess: (message) {
        cancelLoading.hide();
        Get.back();
        CustomSnackBar.success(title: "Booking", message: message);
        orderDetails.clear();
        getAllOrders();
      },
      onError: (message) {
        cancelLoading.hide();
        CustomSnackBar.error(title: "Booking", message: message);
      },
    );
  }
}
