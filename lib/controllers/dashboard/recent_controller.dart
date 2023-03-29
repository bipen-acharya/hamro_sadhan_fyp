import 'package:get/get.dart';
import 'package:hamro_sadhan/repo/recent_order_repo.dart';

import '../../models/order.dart';
import '../../widgets/custom_snackbar.dart';

class RecentOrderController extends GetxController {
  RxList<Order> recentOrderDetails = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    getAllRecentOrders();
    super.onInit();
  }

  getAllRecentOrders() async {
    loading.value = true;
    await RecentOrderRepo.getAllRecentOrder(
      onSuccess: (orders) {
        loading.value = false;
        recentOrderDetails.addAll(orders);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Order", message: message);
      }),
    );
  }
}
