import 'package:flutter/material.dart';

class SyaratScreen extends StatelessWidget {
  const SyaratScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text(
          "Syarat dan Ketentuan",
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
          Text("Syarat dan Ketentuan Aplikasi POINT.ID", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          SizedBox(height: 20),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis malesuada nulla vitae nunc finibus, nec luctus erat iaculis. Nam id nulla vel est fringilla imperdiet. Suspendisse ut diam eget tellus pulvinar volutpat at suscipit dui. Fusce tortor ipsum, maximus posuere malesuada non, gravida at diam. Etiam ac sem vitae ante condimentum maximus iaculis quis lacus. Nulla lacinia varius tempus. Duis ullamcorper metus non elit tempus rhoncus. Duis tincidunt nisl eget nibh ullamcorper, ut efficitur velit aliquet. Vestibulum at nisl non erat elementum ultrices vel vel ante. Sed congue dolor leo, eget aliquam leo scelerisque a. Nam finibus mollis mi, at dictum orci commodo sit amet.", textAlign: TextAlign.justify,style: TextStyle(fontSize: 12),),
          SizedBox(height: 20),
          Text("1. Definisi", textAlign: TextAlign.left,style: TextStyle(fontSize: 12),),
          SizedBox(height: 20),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis malesuada nulla vitae nunc finibus, nec luctus erat iaculis. Nam id nulla vel est fringilla imperdiet. Suspendisse ut diam eget tellus pulvinar volutpat at suscipit dui. Fusce tortor ipsum, maximus posuere malesuada non, gravida at diam. Etiam ac sem vitae ante condimentum maximus iaculis quis lacus. Nulla lacinia varius tempus. Duis ullamcorper metus non elit tempus rhoncus. Duis tincidunt nisl eget nibh ullamcorper, ut efficitur velit aliquet. Vestibulum at nisl non erat elementum ultrices vel vel ante. Sed congue dolor leo, eget aliquam leo scelerisque a. Nam finibus mollis mi, at dictum orci commodo sit amet.", textAlign: TextAlign.justify,style: TextStyle(fontSize: 12),),
          SizedBox(height: 20),
          Text("2. Ketentuan Umum", textAlign: TextAlign.left,style: TextStyle(fontSize: 12),),
          SizedBox(height: 20),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis malesuada nulla vitae nunc finibus, nec luctus erat iaculis. Nam id nulla vel est fringilla imperdiet. Suspendisse ut diam eget tellus pulvinar volutpat at suscipit dui. Fusce tortor ipsum, maximus posuere malesuada non, gravida at diam. Etiam ac sem vitae ante condimentum maximus iaculis quis lacus. Nulla lacinia varius tempus. Duis ullamcorper metus non elit tempus rhoncus. Duis tincidunt nisl eget nibh ullamcorper, ut efficitur velit aliquet. Vestibulum at nisl non erat elementum ultrices vel vel ante. Sed congue dolor leo, eget aliquam leo scelerisque a. Nam finibus mollis mi, at dictum orci commodo sit amet.", textAlign: TextAlign.justify,style: TextStyle(fontSize: 12),),
          SizedBox(height: 20),
          Text("3. Redeem Poin", textAlign: TextAlign.left,style: TextStyle(fontSize: 12),),
          SizedBox(height: 20),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis malesuada nulla vitae nunc finibus, nec luctus erat iaculis. Nam id nulla vel est fringilla imperdiet. Suspendisse ut diam eget tellus pulvinar volutpat at suscipit dui. Fusce tortor ipsum, maximus posuere malesuada non, gravida at diam. Etiam ac sem vitae ante condimentum maximus iaculis quis lacus. Nulla lacinia varius tempus. Duis ullamcorper metus non elit tempus rhoncus. Duis tincidunt nisl eget nibh ullamcorper, ut efficitur velit aliquet. Vestibulum at nisl non erat elementum ultrices vel vel ante. Sed congue dolor leo, eget aliquam leo scelerisque a. Nam finibus mollis mi, at dictum orci commodo sit amet.", textAlign: TextAlign.justify,style: TextStyle(fontSize: 12),),
          SizedBox(height: 20),
          Text("4. Transaksi Redeem for Benefit", textAlign: TextAlign.left,style: TextStyle(fontSize: 12),),
          SizedBox(height: 20),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis malesuada nulla vitae nunc finibus, nec luctus erat iaculis. Nam id nulla vel est fringilla imperdiet. Suspendisse ut diam eget tellus pulvinar volutpat at suscipit dui. Fusce tortor ipsum, maximus posuere malesuada non, gravida at diam. Etiam ac sem vitae ante condimentum maximus iaculis quis lacus. Nulla lacinia varius tempus. Duis ullamcorper metus non elit tempus rhoncus. Duis tincidunt nisl eget nibh ullamcorper, ut efficitur velit aliquet. Vestibulum at nisl non erat elementum ultrices vel vel ante. Sed congue dolor leo, eget aliquam leo scelerisque a. Nam finibus mollis mi, at dictum orci commodo sit amet.", textAlign: TextAlign.justify,style: TextStyle(fontSize: 12),),
          SizedBox(height: 20),
        ],
      ))),
    );
  }
}
