import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/Calander.dart';

class RequestList extends StatelessWidget {
  final List<String> requests; // List of requests

  RequestList({required this.requests});

  @override
  Widget build(BuildContext context) {
    return Column( mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Align(alignment: Alignment.centerLeft, child: Text("Requests", textAlign: TextAlign.left,)),
      ListView.separated(
          shrinkWrap: true,
          itemCount: requests.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => RequestCard(request: requests[index]),
        ),
    ]
    );
  }
}

class RequestCard extends StatelessWidget {
  final String request;

  RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lisa Jerardo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'April 10th - May 17th',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Study Case',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  // Decline functionality
                },
                child: Text(
                  'Decline',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Accept functionality
                },
                child: Text(
                  'Accept',
                  style: TextStyle(color: Colors.green, fontSize: 14),
                ),
              ),
            ],
          ),
        ),


      ],
    );
  }
}

class LawyerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Card(child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 150,
              width: (MediaQuery.sizeOf(context).width-30)*2.25/5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                IconButton.filled(onPressed: null, icon: Icon(Icons.person, size: 80,)),
                
                Text(FirebaseAuth.instance.currentUser!.displayName ?? ""),

                
              ],),
            ),
          ),),

          
      
          Card(child: SizedBox(child: Padding(padding: EdgeInsets.only(left: 12, top: 12), child: RequestList(requests: ["1", "2"],)), width: (MediaQuery.sizeOf(context).width-30)*2.25/5, height: 300,),)
          
          ],),

          Card(child: SizedBox(width: MediaQuery.sizeOf(context).width/2.1,child: Center(child: MonthCalendar(currentDate: DateTime.now()))))
          
        ],
      ),
    ));
  }
}