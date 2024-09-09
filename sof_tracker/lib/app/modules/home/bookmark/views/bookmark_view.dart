import 'package:flutter/material.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/constants/resources/assets.gen.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/widgets/base/base_exception.dart';
import 'package:sof_tracker/app/global/widgets/base/base_silver_view.dart';
import 'package:sof_tracker/app/global/widgets/utils/image_asset.dart';
import 'package:sof_tracker/app/modules/home/bookmark/components/bookmark_item.dart';
import 'package:sof_tracker/app/modules/home/bookmark/components/bookmark_loader.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends BaseSilverView<BookmarkController> {
  const BookmarkView({super.key});

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            //* Background Curved
            Container(
              width: width,
              height: height / 5.5,
              color: Theme.of(context).colorScheme.primary,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      SvgAsset(
                        height: double.infinity,
                        Assets.svgs.vectorCurved1.path,
                        fit: BoxFit.fitWidth,
                      ),
                      SvgAsset(
                        height: double.infinity,
                        Assets.svgs.vectorCurved3.path,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  );
                },
              ),
            ),

            //* Header
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: SvgAsset(
                Assets.svgs.sofLogo.path,
                height: 32.h,
                width: 32.w,
              ),
            ),

            //* Body
            Column(
              children: [
                const Spacer(),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.r),
                        topRight: Radius.circular(32.r),
                      ),
                    ),
                    child: RefreshIndicator(
                      onRefresh: () => controller.retry(),
                      child: SizedBox(
                        height: height,
                        child: PagedListView.separated(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          pagingController: controller.pagingController,
                          separatorBuilder: (context, index) => Gap(16.h),
                          padding: EdgeInsets.symmetric(vertical: height / 24),
                          builderDelegate: PagedChildBuilderDelegate(
                            animateTransitions: true,
                            transitionDuration: $r.times.fast,

                            //* Progress
                            firstPageProgressIndicatorBuilder: (_) {
                              return const BookmarkLoader();
                            },
                            newPageProgressIndicatorBuilder: (_) {
                              return const BookmarkLoader(
                                isFirstPage: false,
                              );
                            },

                            //* Error
                            noItemsFoundIndicatorBuilder: (_) {
                              return BaseException(
                                exceptionTitle: localeLang.noBookmarks,
                                exceptionMessage: localeLang.viewList,
                                btnIcon: FluentIcons.arrow_left_24_regular,
                                onPressed: () {
                                  controller.viewList();
                                },
                              );
                            },
                            firstPageErrorIndicatorBuilder: (_) {
                              return BaseException(
                                isError: true,
                                onPressed: () {
                                  controller.retry();
                                },
                              );
                            },

                            //* Item
                            itemBuilder: (_, item, index) {
                              return BookmarkItem(
                                key: ValueKey(index),
                                index: index,
                                data: controller.pagingController.itemList?.elementAt(index),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
