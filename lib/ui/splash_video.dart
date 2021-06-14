part of 'pages.dart';

class SplashVideoPage extends StatefulWidget {
  @override
  _SplashVideoPageState createState() => _SplashVideoPageState();
}

class _SplashVideoPageState extends State<SplashVideoPage> {

  AudioPlayer player = AudioPlayer();
  AudioCache cache = new AudioCache();

  @override
  void initState() {
    imageCache!.clear();
    Timer(Duration(milliseconds: 15000), () {
      player.stop();
      context.read<PageBloc>().add(GoToResultPage());
    });
    super.initState();
  }

  openingActions() async { //add this
    player = await cache.play('music.mp3'); //add this
  }

  @override
  Widget build(BuildContext context) {
    openingActions();
    return WillPopScope(
      onWillPop: () async {
        player.stop();
        context.read<PageBloc>().add(GoToHomePage());
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 70),
                    child: Column(
                      children: [
                        Text("touch the button to",
                            style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)
                        ),
                        Text("skip the video",
                            style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)
                        ),
                        Text("(sorry, the video is still under repair)",
                            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)
                        ),
                      ],
                    )
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: EdgeInsets.only(top: 90),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/sumimasen.jpg"),
                          fit: BoxFit.fitWidth
                      )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        player.stop();
                        context.read<PageBloc>().add(GoToResultPage());
                      },
                      child: Container(
                        width: 120,
                        height: 200,
                        margin: EdgeInsets.only(top: 10, right: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/skip.jpg"),
                                fit: BoxFit.fitWidth
                            )
                        ),
                      ),
                    )

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}