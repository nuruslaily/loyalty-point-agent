import 'package:flutter/material.dart';

class KebijakanScreen extends StatelessWidget {
  const KebijakanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kebijakan Privasi",
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 10),
          Text("Kebijakan Privasi User", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          SizedBox(height: 20),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis malesuada nulla vitae nunc finibus, nec luctus erat iaculis. Nam id nulla vel est fringilla imperdiet. Suspendisse ut diam eget tellus pulvinar volutpat at suscipit dui. Fusce tortor ipsum, maximus posuere malesuada non, gravida at diam. Etiam ac sem vitae ante condimentum maximus iaculis quis lacus. Nulla lacinia varius tempus. Duis ullamcorper metus non elit tempus rhoncus. Duis tincidunt nisl eget nibh ullamcorper, ut efficitur velit aliquet. Vestibulum at nisl non erat elementum ultrices vel vel ante. Sed congue dolor leo, eget aliquam leo scelerisque a. Nam finibus mollis mi, at dictum orci commodo sit amet.", textAlign: TextAlign.justify,style: TextStyle(fontSize: 12),),
        ],
      ))),
    );
  }
}
