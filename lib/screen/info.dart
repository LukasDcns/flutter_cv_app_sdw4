import 'package:cv/model/airtable_data.dart';
import 'package:cv/model/airtable_data_info.dart';
import 'package:cv/widget/image_stack.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AirtableData airtableData = AirtableData();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FutureBuilder(
            future: airtableData.getInfo(),
            builder: (BuildContext context, AsyncSnapshot<List<AirtableDataInfo>> snapshot) {
              if (snapshot.hasData) {
                List<AirtableDataInfo>? values = snapshot.data;
                return ListView(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  children: values!
                      .map((AirtableDataInfo value) =>
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                            imageStack(value.image, value.title),
                            Padding(padding: const EdgeInsets.all(16.0),
                              child: Text(
                                value.detail,
                                style: const TextStyle(
                                    fontFamily: 'Raleway-Regular',
                                    fontSize: 16,
                                    color: Colors.white
                                )
                              )
                            )
                          ],
                        )
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