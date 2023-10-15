import 'package:chatgpt/core/app_core.dart';

class GPT4 {
  final String image;
  final String title;
  final String subtitle;

  const GPT4(
      {required this.image, required this.title, required this.subtitle});

  static const List<GPT4> list = [
    GPT4(
      image: AppImages.image1,
      title: 'Exclusive to Plus',
      subtitle: 'Plus users get access to GPT-4 and the latest beta features.',
    ),
    GPT4(
      image: AppImages.image2,
      title: 'Built for quality',
      subtitle: 'GPT-4 excels at a diverse range of personal and work tasks.',
    ),
    GPT4(
      image: AppImages.image3,
      title: 'Limited Use',
      subtitle: 'Usage caps for GPT-4 are reset regularly.',
    ),
  ];
}
