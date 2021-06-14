part of 'pages.dart';

class ChoosePage extends StatefulWidget {
  @override
  _ChoosePageState createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
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
                        Text("Choose your",
                            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)
                        ),
                        Text("pick :",
                            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)
                        ),
                      ],
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: ()  async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString("pilihan", "batu");
                        context.read<PageBloc>().add(GoToSplashVideoPage());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 200,
                        margin: EdgeInsets.only(top: 35),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/batu.jpg"),
                            fit: BoxFit.fitWidth
                          )
                        ),
                      )
                    ),
                    InkWell(
                        onTap: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("pilihan", "gunting");
                          context.read<PageBloc>().add(GoToSplashVideoPage());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.38,
                          height: 200,
                          margin: EdgeInsets.only(top: 35, left: 50),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/gunting.jpg"),
                                  fit: BoxFit.fitWidth
                              )
                          ),
                        )
                    ),
                  ],
                ),
                InkWell(
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("pilihan", "kertas");
                      context.read<PageBloc>().add(GoToSplashVideoPage());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/kertas.jpg"),
                              fit: BoxFit.fitWidth
                          )
                      ),
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}