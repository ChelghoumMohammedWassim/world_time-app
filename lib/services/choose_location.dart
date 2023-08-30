import 'package:flutter/material.dart';
import 'package:world_time/pages/services/world_time.dart';

class Choose_location extends StatefulWidget {
  const Choose_location({Key? key}) : super(key: key);

  @override
  State<Choose_location> createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {
  List <WorldTime> locations=[
    WorldTime(location: "Berlin", flag: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHoAAABJCAMAAADFacLVAAAAFVBMVEUAAAD/zgDdAAC1AADgAADmaQD/1QDZEKEBAAAAP0lEQVRoge3NQRHAIAADsDJg/iVzmKCfxEASAADguVmTVZOvRq1Wq9VqtVqtvvWuyV+TUaNWq9VqtVqtVnfrA610KIMKrkdMAAAAAElFTkSuQmCC", url: "Europe/Berlin"),
    WorldTime(location: "Paris", flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Flag_of_France_%281958%E2%80%931976%29.svg/1200px-Flag_of_France_%281958%E2%80%931976%29.svg.png", url: "Europe/Paris"),
    WorldTime(location: "Cairo", flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/1200px-Flag_of_Egypt.svg.png", url: "Africa/Cairo"),
    WorldTime(location: "London", flag: "https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Flag_of_the_United_Kingdom.svg/188px-Flag_of_the_United_Kingdom.svg.png", url: "Europe/London"),
    WorldTime(location: "New york", flag: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/188px-Flag_of_the_United_States.svg.png", url: "America/New_york"),
    WorldTime(location: "Seoul", flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/165px-Flag_of_South_Korea.svg.png", url: "Asia/Seoul"),
  ];
  Future<void> setUpWordTime(WorldTime instence) async {
    await instence.getTime();
    print("${instence.time} - ${instence.location} - ${instence.flag}");
    Navigator.pop(context, {
      'location': instence.location,
      'flag': instence.flag,
      'time':instence.time,
      "isDay":instence.isDay
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar:AppBar(
        title: Text("Choose Location",style: TextStyle(color: Colors.grey[850]),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.grey[850]),
        backgroundColor: Colors.deepOrange[200],
      ),
      
      body: ListView.builder(
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
            child: Card(
              color: Colors.grey[800],
              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: ListTile(
                onTap:() {
                  setUpWordTime(locations[index]);
                },
                title: Text(locations[index].location,style: TextStyle(fontSize: 20,color: Colors.deepOrange[200]),),
                leading: CircleAvatar(
                  backgroundColor: Colors.deepOrange[200],
                  backgroundImage: NetworkImage(locations[index].flag),
                  radius: 20,
                ),
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),

    );
  }
}
