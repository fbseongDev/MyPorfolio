import 'package:convention/ui.dart';

class IntroHero extends HookWidget {
  final VoidCallback onFinish;

  const IntroHero({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: Duration(milliseconds: 2500),
    );

    final Animation<double> blurAnimation = Tween<double>(begin: 20, end: 0)
        .animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
          ),
        );

    useEffect(() {
      controller.forward();
      Future.delayed(const Duration(milliseconds: 3500), onFinish);

      return null;
    }, []);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Center(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: blurAnimation.value,
              sigmaY: blurAnimation.value,
            ),
            child: Opacity(
              opacity: controller.value.clamp(0.0, 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'HYESEONG',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.extraBold,
                      letterSpacing: 10,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 100 * controller.value,
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
