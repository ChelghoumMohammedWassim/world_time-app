import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

      if (data.isEmpty) {
        data = ModalRoute.of(context)?.settings.arguments as Map;
      }
      print(data);

    return SafeArea(child:Scaffold(
      backgroundColor: Colors.grey[850],
     appBar: AppBar(
       title: Text("Home",style: TextStyle(color: Colors.grey[850]),),
       centerTitle: true,
       iconTheme: IconThemeData(color: Colors.grey[850]),
       backgroundColor: Colors.deepOrange[200],
     ),
      body:Padding(
        padding: const EdgeInsets.all(80),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(radius: 70,backgroundColor: Colors.deepOrange[200] ,child: Image.network(data["flag"]),),
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Column(
                  children: [
                    Text(data["location"],style: TextStyle(color: Colors.deepOrange[200],fontSize: 50),),
                    Container(
                      child:Text(data["time"],style: TextStyle(color: Colors.deepOrange[200],fontSize: 70,fontWeight:FontWeight.bold),) ,
                      margin:EdgeInsets.fromLTRB(0, 20, 0, 0),
                    )

                  ],
                ),
              )


            ],
          ),
        ),
      ),
        floatingActionButton:FloatingActionButton(onPressed: ()async{
          dynamic result= await Navigator.pushNamed(context, '/choose_location');
          setState(() {
            data={
              "location":result["location"],
              "time":result["time"],
              "flag":result["flag"],
              "isDay":result["isDay"]
            };
          });
        },
        child: Icon(Icons.edit_location,color: Colors.grey[850],),
          backgroundColor: Colors.deepOrange[200],
        )
    )
    );
  }
}
