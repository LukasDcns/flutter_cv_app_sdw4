import 'package:cv/model/airtable_data.dart';
import 'package:cv/model/airtable_data_education.dart';
import 'package:cv/widget/CustomListItem.dart';
import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AirtableData airtableData = AirtableData();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FutureBuilder(
            future: airtableData.getEducation(),
            builder: (BuildContext context, AsyncSnapshot<List<AirtableDataEducation>> snapshot) {
              if (snapshot.hasData) {
                List<AirtableDataEducation>? values = snapshot.data;
                return ListView(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  children: values!
                      .map((AirtableDataEducation value) =>
                      CustomListItem(
                          thumbnail: Container(
                            alignment: Alignment.topCenter,
                            child: Image.network(value.image),
                          ),
                          title: value.title,
                          subtitle: value.detail
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