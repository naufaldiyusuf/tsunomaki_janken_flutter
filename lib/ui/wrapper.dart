part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, state) {
          if (state is OnHomePage) {
            return HomePage();
          } else if (state is OnChoosePage) {
            return ChoosePage();
          } else if (state is OnSplashVideoPage) {
            return SplashVideoPage();
          } else if (state is OnResultPage) {
            return ResultPage();
          } else
            return HomePage();
        }
    );
  }
}