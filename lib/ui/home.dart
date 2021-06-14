part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/tsunomaki.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 160),
                    child: Column(
                      children: [
                        Text("Tsunomaki",
                          style: TextStyle(fontSize: 47.0, fontWeight: FontWeight.bold)
                        ),
                        Text("Janken",
                            style: TextStyle(fontSize: 47.0, fontWeight: FontWeight.bold)
                        ),
                      ],
                    )
                  ),
                  InkWell(
                    onTap: () {
                      context.read<PageBloc>().add(GoToChoosePage());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      margin: EdgeInsets.only(top: 70),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/play.png"),
                          fit: BoxFit.fitWidth,
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
    );
  }
}