import 'package:kw_store_app/core/paths/app_image_paths.dart';
import 'package:kw_store_app/model/on_boarding_model.dart';

mixin OnBoardingDataMixin {
  List<OnBoardingModel> get getOnBoardingData => [
        const OnBoardingModel(
          image: AppImagePaths.onBoarding1,
          title: 'تسوق اون لاين',
          desc:
              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، ',
          index: 0,
        ),
        const OnBoardingModel(
          image: AppImagePaths.onBoarding2,
          title: 'عروض و خصومات',
          desc:
              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، ',
          index: 1,
        ),
        const OnBoardingModel(
          image: AppImagePaths.onBoarding3,
          title: 'الدفع الآمن',
          desc:
              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، ',
          index: 2,
        ),
      ];
}
