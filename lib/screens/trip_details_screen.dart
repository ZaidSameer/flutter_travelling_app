import 'package:flutter/material.dart';
import '/app_data.dart';

class TripDetailsScreen extends StatelessWidget {
  final String tripId;
  final customTextStyle = TextStyle(fontFamily: "The Sans Arabic");

  TripDetailsScreen({Key? key, required this.tripId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedTrip.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  selectedTrip.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _buildSectionTitle(context, title: 'الأنشطة'),
              _buildListViewItems(
                child: ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(
                    indent: 0,
                    endIndent: 0,
                    height: 0,
                  ),
                  itemCount: selectedTrip.activities.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('🔹' + selectedTrip.activities[index],
                        style: customTextStyle),
                  ),
                ),
              ),
              _buildSectionTitle(context, title: 'البرنامج'),
              _buildListViewItems(
                child: ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(
                    indent: 0,
                    endIndent: 0,
                    // height: 0,
                  ),
                  itemCount: selectedTrip.program.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.lightBlueAccent,
                        child: Text(
                          'يوم ${index + 1}',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                      title: Text(
                        selectedTrip.program[index],
                        style: customTextStyle,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListViewItems({Widget? child}) {
    return SingleChildScrollView(
      child: Flexible(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, {String title = 'عنوان'}) {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
