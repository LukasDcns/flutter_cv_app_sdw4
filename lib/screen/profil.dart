import 'package:cv/widget/ico_link.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cv/model/airtable_data.dart';
import 'package:cv/model/airtable_data_profil.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AirtableData airtableData = AirtableData();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              maxRadius: 100,
              backgroundColor: Colors.deepPurple,
            ),
         ),
          const Divider(thickness: 2, height: 25, color: Colors.white),          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ico_link(FontAwesomeIcons.twitter, "https://twitter.com/LukasDcns"),
              ico_link(FontAwesomeIcons.linkedin, "https://www.linkedin.com/in/lukas-descoins"),
            ],
          ),
          const Divider(thickness: 2, height: 25, color: Colors.white),
          FutureBuilder(
            future: airtableData.getProfil(),
            builder: (BuildContext context, AsyncSnapshot<List<AirtableDataProfil>> snapshot) {
              if (snapshot.hasData) {
                List<AirtableDataProfil>? values = snapshot.data;
                return ListView(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  children: values!
                      .map((AirtableDataProfil value) =>
                        ListTile(
                          leading: Text(
                              value.icon,
                              style: const TextStyle(
                                  fontFamily: 'MaterialIcons',
                                  fontSize: 26,
                                  color: Colors.white
                              )
                          ),
                          title: Text(
                              value.content,
                              style: const TextStyle(
                                fontFamily: 'Raleway-Bold',
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                          ),
                        ),
                      )
                      .toList(),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}