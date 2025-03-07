import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/data/models/responses/user/sof.user.model.dart';
import 'package:sof_tracker/app/data/repos/sof.user.repo.dart';
import 'package:sof_tracker/app/global/constants/enums/systems.dart';
import 'package:sof_tracker/app/global/utils/helpers/misc.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/utils/utils.dart';
import 'package:sof_tracker/app/global/widgets/base/base_controller.dart';
import 'package:sof_tracker/app/modules/home/reputation/controllers/reputation_controller.dart';
import 'package:sof_tracker/app/modules/home/reputation/views/reputation_view.dart';
import 'package:sof_tracker/app/routes/app_pages.dart';

class DashboardController extends BaseController {
  //* Dependencies
  final sofUserService = Get.find<SofUserRepository>();

  //* Variables
  final users = [].obs;
  final pagingController = PagingController(firstPageKey: 1);

  //* Lifecycle
  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) => _fetchData(pageKey));
  }

  @override
  void dispose() {
    pagingController.dispose();
    users.clear();
    super.dispose();
  }

  //* Functions
  Future<void> _fetchData(int pageKey, {int pageSize = 20}) async {
    try {
      final res = await sofUserService.getSofUsers(queries: {
        'page': pageKey,
        'pagesize': pageSize,
        'site': 'stackoverflow',
      });

      if (res.hasError) {
        pagingController.error = res.error;
        return;
      }

      final nonEmptyItems = res.data!.data.items!.where((e) => !isNullOrEmpty(e)).toList();

      users
        ..clear()
        ..addAll(nonEmptyItems);

      res.data!.data.hasMore == false
          ? pagingController.appendLastPage(nonEmptyItems)
          : pagingController.appendPage(nonEmptyItems, pageKey + 1);
    } catch (e) {
      await AppUtils.showSnackBar(
        message: e.toString(),
        type: SnackBarType.error,
      );
    }
  }

  Future<void> retry() async {
    pagingController.refresh();
  }

  Future<void> getDetail(SofUserModel sofUser) async {
    await Get.bottomSheet(
      backgroundColor: $theme.colorScheme.primary,
      GetBuilder(
        init: ReputationController(),
        builder: (controller) => SizedBox(
          height: height * 0.85,
          child: const ReputationView(),
        ),
      ),
      settings: RouteSettings(
        name: Routes.REPUTATION,
        arguments: {
          'sofUser': sofUser,
        },
      ),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
    );
  }

  bool isFavorite(int? accountId) {
    return $storage.user.isFavorite(accountId!);
  }

  Future<void> toggleFavorite(SofUserModel sofUserModel) async {
    $storage.user.toggleFavorite(sofUserModel);
    pagingController.refresh();
  }
}
