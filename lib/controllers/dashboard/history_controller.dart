

import 'package:get/get.dart';
import 'package:hamro_sadhan/models/order.dart';
import 'package:hamro_sadhan/repo/order_repo.dart';
import 'package:hamro_sadhan/widgets/custom_snackbar.dart';

class HistoryController extends GetxController{
 RxList<Order> orderDetails = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    getAllOrders();
    super.onInit();
  }

  
  getAllOrders() async {
    loading.value = true;
    await OrderRepo.getAllOrders(
      onSuccess: (orders) {
        loading.value = false;
        orderDetails.addAll(orders);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Order", message: message);
      }),
    );
  }
}