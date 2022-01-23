import 'package:cv/model/airtable_data.dart';
import 'package:cv/model/airtable_data_experience.dart';
import 'package:cv/widget/CustomListItem.dart';
import 'package:flutter/material.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AirtableData airtableData = AirtableData();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FutureBuilder(
            future: airtableData.getExperience(),
            builder: (BuildContext context, AsyncSnapshot<List<AirtableDataExperience>> snapshot) {
              if (snapshot.hasData) {
                List<AirtableDataExperience>? values = snapshot.data;
                return ListView(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  children: values!
                      .map((AirtableDataExperience value) =>
                      CustomListItem(
                        thumbnail: Container(
                          alignment: Alignment.topCenter,
                          child: Image.network(value.logo),
                        ),
                        title: "${value.jobTitle} (${value.period})",
                        subtitle: value.jobDescription
                      ),
                  ).toList(),
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