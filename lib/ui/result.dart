part of 'pages.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  Random random = Random();
  late int randomInt = random.nextInt(3);
  List<String> list = ["gunting", "batu", "kertas"];
  late String randomList = list[randomInt];

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
                  margin: EdgeInsets.only(top: 75),
                  child: FutureBuilder<SharedPreferences>(
                    future: SharedPreferences.getInstance(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        final SharedPreferences pref = snapshot.data!;
                        String pilihan = pref.getString("pilihan") ?? "";
                        if (pilihan == "batu") {
                          if (randomList == "batu") {
                            return Text("it's a draw!",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.14, fontWeight: FontWeight.bold)
                            );
                          } else if (randomList == "gunting") {
                            return Text("You win!",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.14, fontWeight: FontWeight.bold)
                            );
                          } else if (randomList == "kertas") {
                            return Text("you lose!",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.14, fontWeight: FontWeight.bold)
                            );
                          } else {
                            return Text("error");
                          }
                        } else if (pilihan == "gunting") {
                          if (randomList == "batu") {
                            return Text("you lose!",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.14, fontWeight: FontWeight.bold)
                            );
                          } else if (randomList == "gunting") {
                            return Text("it's a draw!",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.14, fontWeight: FontWeight.bold)
                            );
                          } else if (randomList == "kertas") {
                            return Text("you win!",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.14, fontWeight: FontWeight.bold)
                            );
                          } else {
                            return Text("error");
                          }
                        } else if (pilihan == "kertas") {
                          if (randomList == "batu") {
                            return Text("you win!",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.14, fontWeight: FontWeight.bold)
                            );
                          } else if (randomList == "gunting") {
                            return Text("you lose!",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.14, fontWeight: FontWeight.bold)
                            );
                          } else if (randomList == "kertas") {
                            return Text("it's a draw!",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.14, fontWeight: FontWeight.bold)
                            );
                          } else {
                            return Text("error");
                          }
                        }else {
                          return Text("error");
                        }
                      }
                      return Text("error");
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: EdgeInsets.only(top: 20),
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/$randomList.jpg"),
                      fit: BoxFit.fitWidth
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child : ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.15,
                    buttonColor: Colors.black,
                    child:RaisedButton(
                      onPressed: () {
                        context.read<PageBloc>().add(GoToHomePage());
                      },
                      child: Text("back to home button"),
                      textColor: Colors.white,
                    ) ,
                  )
                )
              ],
            )
          ],
        )
      )
    );
  }
}