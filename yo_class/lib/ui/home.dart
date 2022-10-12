import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _selectedCleaning({String title, String subtitle}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.only(
        left: 20,
      ),
      height: 120,
      width: 240,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 22, color: Colors.white)),
          SizedBox(
            height: 5,
          ),
          Text(subtitle,
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Widget _selecctedExtras({@required String image, @required String name}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image)))),
          SizedBox(height: 10),
          Text(name)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Yo Class'),
        centerTitle: true,
      ),
      body: Container(
        child: Container(
          height: 800,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  "Selected Cleaning",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: 30, top: 30),
                  child: Row(
                    children: [
                      _selectedCleaning(
                          //color: Theme.of(context).
                          subtitle: "Call for Today",
                          title: "Home cleaning"),
                      _selectedCleaning(
                          //color: Theme.of(context).
                          subtitle: "Call for Today",
                          title: "Office cleaning")
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Extra',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          height: 300,
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.30,
                            children: [
                              _selecctedExtras(
                                image: "Images/icons.png",
                                name: "Organising",
                              ),
                              _selecctedExtras(
                                  image: "Images/incons.png", name: "Creating"),
                              _selecctedExtras(
                                  image: "images/icons.png", name: "Testing"),
                              _selecctedExtras(
                                  image: "images/icons.png", name: "Working"),
                            ],
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
